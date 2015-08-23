/**
 * 
 */
package com.youthor.bsp.view.urss.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Post;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.PostForm;

/**
 * @author 胡友成  2007-11-17
 *
 */
public class PostAction extends BaseStrutsAction{
    
    

      private static final String FORWARD_PostList = "postList";
      private static final String FORWARD_PostEdit = "postEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = PostForm.class.getName();
      private static final String modelClass = Post.class.getName();
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward queryPagePost(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Post post=new Post();
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String comId=WebHelper.getCurrComId(request.getSession());
        String userId=WebHelper.getCurrComUser(request.getSession()).getComUserId();
        List pageList=new ArrayList();
        if(WebHelper.isComAdmin(request.getSession()))
        {
            pageList=urssServiceFacade.queryPagePostByComId(page,comId);
        }
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_PostList);    
    }
    
    public ActionForward initPost(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        return mapping.findForward(FORWARD_PostEdit);    
    }
    
  public ActionForward savePost(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
      PostForm postFrom=(PostForm)form;
      Post post=(Post)this.formToModel(postFrom,modelClass);
    
    if(StringHelper.doWithNull(post.getPostId()).equals(""))
    {
        post.setComId(WebHelper.getCurrComId(request.getSession()));
        urssServiceFacade.addPost(post);
        postFrom.setPostId(post.getPostId());
        
    }
    else
    {
        urssServiceFacade.updatePost(post);
    }
        return mapping.findForward(FORWARD_PostEdit);    
    }

public ActionForward showPost(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    PostForm postForm=(PostForm)form;
    Post post=urssServiceFacade.getPostById(postForm.getPostId());
    postForm=(PostForm)this.modelToForm(post,ActionFormClass);
    request.setAttribute("PostForm",postForm);
        return mapping.findForward(FORWARD_PostEdit);    
}

public ActionForward deletePost(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        urssServiceFacade.deletePostByIds(ids);
        return mapping.findForward(FORWARD_DelToList);    
    }

 
}
