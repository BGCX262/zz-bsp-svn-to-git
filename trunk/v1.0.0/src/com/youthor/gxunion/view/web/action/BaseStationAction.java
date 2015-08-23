package com.youthor.gxunion.view.web.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.common.FlowEngineView;

import com.youthor.gxunion.common.util.Constants;
import com.youthor.gxunion.common.util.PictrueComposite;
import com.youthor.gxunion.core.facade.IGxUnionServiceFacade;
import com.youthor.gxunion.core.model.BaseStation;
import com.youthor.gxunion.view.web.form.BaseStationForm;

public class BaseStationAction extends BaseStrutsAction {
    private static final String FORWARD_BASESTATION_LIST = "baseStationList";
    private static final String FORWARD_BASESTATION_EDIT = "baseStationEdit";
    private static final String FORWARD_BASESTATION_IMG     = "showBaseStationImg";
    private static final String FORWARD_BASESTATION_VIEW = "baseStationView";
    private static final String FORWARD_BASESTATION_DEL  = "delToList";
    
    private static final String formClass = BaseStationForm.class.getName();
    private static final String modelClass = BaseStation.class.getName();
    private IGxUnionServiceFacade serviceFacade;

    public ActionForward listPageBaseStation(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        List pageList=serviceFacade.getValidBaseStation(page, null);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_BASESTATION_LIST);    
    }
    
    public ActionForward initBaseStation(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        return mapping.findForward(FORWARD_BASESTATION_EDIT);    
    }
    
    public ActionForward submitBaseStation(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        BaseStationForm bsForm =(BaseStationForm)form;
        BaseStation baseStation = (BaseStation)formToModel(bsForm, modelClass);
        Map map1 = FlowEngineView.setProcessData(request);
        Org org = WebHelper.getOrg(request.getSession());
        if(StringHelper.isHasContent(bsForm.getId())){
            if(org != null){
                baseStation.setStatus(Constants.GLOBAL_STATUS_VALID);
                baseStation.setUpdateOrgId(org.getOrgId());
                baseStation.setUpdateOrgName(org.getOrgName());
                baseStation.setUpdateTime(new Date());
            }
            //baseStation = serviceFacade.updateBaseStation(baseStation);
        }
        else{
            if(org != null){
                baseStation.setCreateOrgId(org.getOrgId());
                baseStation.setCreateOrgName(org.getOrgName());
                baseStation.setStatus(Constants.GLOBAL_STATUS_VALID);
                baseStation.setUpdateOrgId(org.getOrgId());
                baseStation.setUpdateOrgName(org.getOrgName());
                baseStation.setUpdateTime(new Date());
            }
            //serviceFacade.addBaseStation(baseStation);
        }
        String id = serviceFacade.submitBaseStation(baseStation,map1);
        bsForm.setId(baseStation.getId());
        bsForm.setCreateOrgId(baseStation.getCreateOrgId());
        bsForm.setCreateOrgName(baseStation.getCreateOrgName());
        request.setAttribute("BaseStaionForm",bsForm);
        //更新地图
        reCreateBaseStationImg(request,true);
        return FlowEngineView.getProcessForward(request,response,map1);
    }
    
    public ActionForward deleteBaseStation(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids = request.getParameterValues("itemIdCheckBox");
        if(ids != null && ids.length >0){
            for(int i=0;i<ids.length;i++){
                BaseStation baseStation = serviceFacade.getBaseStationById(ids[i]);
                baseStation.setStatus(Constants.GLOBAL_STATUS_INVALID);
                serviceFacade.updateBaseStation(baseStation);
            }
        }
        //更新地图
        reCreateBaseStationImg(request,true);
        return mapping.findForward(FORWARD_BASESTATION_DEL);    
    }
    
    public ActionForward showBaseStation(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String id=FlowEngineView.setShowProcessData(request,"id");
        BaseStation baseStation = serviceFacade.getBaseStationById(id);
        BaseStationForm bsForm = (BaseStationForm)modelToForm(baseStation, formClass);
        request.setAttribute("BaseStationForm",bsForm);
        return mapping.findForward(FORWARD_BASESTATION_EDIT);    
    }

    public ActionForward showBaseStationImg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        if(request.getSession().getServletContext().getAttribute("baseStationImgPath") == null){
            reCreateBaseStationImg(request,false);
        }
        return mapping.findForward(FORWARD_BASESTATION_IMG);    
    }
    
    public ActionForward viewBaseStation(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        BaseStationForm bsForm =(BaseStationForm)form;
        BaseStation baseStation = serviceFacade.getBaseStationById(bsForm.getId());
        bsForm = (BaseStationForm)modelToForm(baseStation, formClass);
        request.setAttribute("BaseStationForm",bsForm);
        return mapping.findForward(FORWARD_BASESTATION_VIEW);    
    }
    
    protected void reCreateBaseStationImg(HttpServletRequest request,boolean createImgFlag){
        int len = 0;
        List allBaseStation = serviceFacade.getAllValidBaseStation();
        if(allBaseStation != null){
            len = allBaseStation.size();
        }

        String bg = ConfigInfoHelper.getProperty(Constants.GXUNION_MAP_PATH);
        String logo = ConfigInfoHelper.getProperty(Constants.GXUNION_BASESTATION_LOGO_PATH);
        String img = ConfigInfoHelper.getProperty(Constants.GXUNION_BASESTATION_IMG_PATH);
        String contextPath = request.getSession().getServletContext().getRealPath("/");
        bg = bg.replaceAll("\\\\", "/");
        logo = logo.replaceAll("\\\\", "/");
        img = img.replaceAll("\\\\", "/");
        
        bg = contextPath + "/" + bg;
        logo = contextPath + "/" + logo;
        img = contextPath + "/" + img;
        
        int ltweidu = getGeographyPosition(ConfigInfoHelper.getProperty(Constants.GXUNION_MAP_LT_NORTH_LATITUDE));
        int ltjingdu = getGeographyPosition(ConfigInfoHelper.getProperty(Constants.GXUNION_MAP_LT_EAST_LONGITUDE));
        int rbweidu = getGeographyPosition(ConfigInfoHelper.getProperty(Constants.GXUNION_MAP_RB_NORTH_LATITUDE));
        int rbjingdu = getGeographyPosition(ConfigInfoHelper.getProperty(Constants.GXUNION_MAP_RB_EAST_LONGITUDE));
        
        int [] xzhou = null;
        int [] yzhou = null;
        String [] baseStationId = null;
        String [] baseStationName=null;
        
        if(len > 0){
            xzhou = new int[len];
            yzhou = new int[len];
            baseStationId = new String[len];
            baseStationName = new String[len];
            
            for(int i=0;i<len;i++){
                BaseStation baseStation = (BaseStation)allBaseStation.get(i);
                int nl = getGeographyPosition("" + baseStation.getNorthLatitude());
                int el = getGeographyPosition("" + baseStation.getEastLongitude());
                
                yzhou[i] = (nl * 1000)/(ltweidu - rbweidu);
                xzhou[i] = (el * 1000)/(rbjingdu - ltjingdu);
                baseStationId[i] = baseStation.getId();
                baseStationName[i] = baseStation.getName();
            } 
        }

        PictrueComposite pc = new PictrueComposite(bg,logo,img);
        pc.setNewImgX(xzhou);
        pc.setNewImgY(yzhou);
        
        if(createImgFlag){
            try{
                pc.createJpgByFont(null);
            }
            catch(Exception e){
                
            }
        }
        
        ServletContext context = request.getSession().getServletContext();
        context.setAttribute("baseStationImgPath", 
                ConfigInfoHelper.getProperty(Constants.GXUNION_BASESTATION_IMG_PATH));
        context.setAttribute("baseStationNewImgX",xzhou);
        context.setAttribute("baseStationNewImgY",yzhou);
        context.setAttribute("baseStationImgWidth","" + pc.getImgWidth());
        context.setAttribute("baseStationImgHeight","" + pc.getImgHeight());
        context.setAttribute("baseStationLogoWidth","" + pc.getLogoWidth());
        context.setAttribute("baseStationLogoHeight","" + pc.getLogoHeight());
        context.setAttribute("baseStationId",baseStationId);
        context.setAttribute("baseStationName",baseStationName);
    }
    
    protected int getGeographyPosition(String position){
        if(!StringHelper.isHasContent(position)){
            return 0;
        }
        
        int len = position.length();
        int commPos = position.indexOf(".");
        
        String du = position.substring(0,commPos);
        String fen = "0";
        String miao = "0";
        if(commPos >0 && commPos < len){
            String xiaoshu = position.substring(commPos + 1);
            if(xiaoshu.length()<3){
                fen = xiaoshu;
                if(fen.length() == 1){
                    fen = fen + "0";
                }
            }
            else{
                fen = xiaoshu.substring(0,2);
                miao = xiaoshu.substring(2);
                int miaoLen = miao.length();
                if(miaoLen == 1){
                    miao = miao + "0";
                }
                if(miaoLen > 1){
                    miao = miao.substring(0,2);
                }
            }
        }
        return stringToInt(du)*360 + stringToInt(fen)*60 + stringToInt(miao);
    }
    
    protected int stringToInt(String i){
        if(!StringHelper.isHasContent(i)){
            return 0;
        }
        try{
            return Integer.parseInt(i);
        }
        catch(Exception e){
            return 0;
        }
    }

    public IGxUnionServiceFacade getServiceFacade() {
        return serviceFacade;
    }

    public void setServiceFacade(IGxUnionServiceFacade serviceFacade) {
        this.serviceFacade = serviceFacade;
    }
}
