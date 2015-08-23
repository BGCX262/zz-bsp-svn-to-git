package com.youthor.bsp.view.abdf.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Favorite;
import com.youthor.bsp.core.abdf.model.FavoriteItem;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.web.form.FavoriteItemForm;


public class FavoriteAction extends BaseStrutsAction{
    private IAbdfServiceFacade abdfServiceFacade;
    
    
     
      
      
      private static final String modelClass =Favorite.class.getName();
      private static final String ActionFormClass =FavoriteItemForm.class.getName();
    
    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }    
    
    public ActionForward initFavorite(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        String orgId=org.getOrgId();
        List favoriteList = abdfServiceFacade.getFavoriteByOrgId(orgId);
        request.setAttribute("favoriteList", favoriteList);
        return mapping.findForward("initFavorite");    
    }
    
    public ActionForward showFavorite(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        String orgId=org.getOrgId();
        List favoriteList = abdfServiceFacade.getFavoriteByOrgId(orgId);
        request.setAttribute("favoriteList", favoriteList);
        List favoriteItemList = abdfServiceFacade.getFavoriteItemByOrgId(orgId);
        request.setAttribute("favoriteItemList", favoriteItemList);
        return mapping.findForward("showFavorite");    
    }
    
    public ActionForward saveFavoriteItem(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FavoriteItemForm favoriteItemForm = (FavoriteItemForm)form;
        HttpSession session = request.getSession(false);
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        String favoriteId = favoriteItemForm.getFavoriteId();
        String orgId=org.getOrgId();
        if (StringHelper.doWithNull(favoriteItemForm.getIsNewFavorite()).equals("Y")) {
            Favorite favorite = new Favorite();
            if(StringHelper.isHasContent(favoriteItemForm.getFavoriteId())) {
                favorite.setParentId(favoriteItemForm.getFavoriteId());
                if(StringHelper.isHasContent(favoriteItemForm.getAllParentId())) {
                    favorite.setAllParentId(favoriteItemForm.getFavoriteId()+":"+favoriteItemForm.getAllParentId());
                    favorite.setAllParentName(favoriteItemForm.getFavoriteNameView()+":"+favoriteItemForm.getAllParentName());
                }
                else {
                    favorite.setAllParentId(favoriteItemForm.getFavoriteId());
                    favorite.setAllParentName(favoriteItemForm.getFavoriteNameView());
                }
            }
            favorite.setFavoriteName(favoriteItemForm.getFavoriteName());
            favorite.setOrgId(orgId);
            favorite.setOrgName(org.getOrgName());
            favoriteId = abdfServiceFacade.addFavorite(favorite);
        }
        FavoriteItem favoriteItem = new FavoriteItem();
        favoriteItem.setFavoriteId(favoriteId);
        favoriteItem.setName(favoriteItemForm.getName());
        favoriteItem.setUrl(favoriteItemForm.getUrl());
        favoriteItem.setOrgId(orgId);
        favoriteItem.setOrgName(org.getOrgName());
        String favoriteItemId = abdfServiceFacade.addFavoriteItem(favoriteItem);
        return mapping.findForward("add_favorite_return");    
    }
    
}
