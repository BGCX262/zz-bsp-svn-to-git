/**
 * 
 */
package com.youthor.bsp.view.wfss.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.Expression;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.wfss.web.form.ExpressionForm;

public class ExpressionAction extends BaseStrutsAction {

    private static final String FORWARD_ExpressionList = "expressionList";

    private static final String FORWARD_ExpressionEdit = "expressionEdit";

    private static final String FORWARD_DelToList = "delToList";

    private static final String ActionFormClass = ExpressionForm.class.getName();

    private static final String modelClass = Expression.class.getName();

    private IWfssServiceFacade wfssServiceFacade;


    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    public ActionForward initExpression(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        return mapping.findForward(FORWARD_ExpressionEdit);
    }

    public ActionForward listExpression(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String expType=request.getParameter("expType");
        String comId=WebHelper.getCurrComId(request.getSession());
        List pageList=new ArrayList();
        if(WebHelper.isComAdmin(request.getSession()))
        {
            pageList=wfssServiceFacade.listExpressionComId(page,comId,expType);
        }
        else if(WebHelper.isAppAdmin(request.getSession()))
        {
            String [] appIds=null;
             pageList=wfssServiceFacade.listExpressionComAppIds(page,comId,appIds,expType);
        }
        request.setAttribute("pageList",pageList);
        request.setAttribute("expType",expType);
        return mapping.findForward(FORWARD_ExpressionList);    
    }
    
    
    public ActionForward saveExpression(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ExpressionForm expressionFrom = (ExpressionForm) form;
        String comId=WebHelper.getCurrComId(request.getSession());
        expressionFrom.setComId(comId);
        Expression expression = (Expression) this.formToModel(expressionFrom, modelClass);

        if (StringHelper.doWithNull(expression.getExpId()).equals("")) {
            wfssServiceFacade.addExpression(expression);
            expressionFrom.setExpId(expression.getExpId());

        } else {
            wfssServiceFacade.updateExpression(expression);
        }
        request.setAttribute("appId", expressionFrom.getAppId());
        
        return mapping.findForward(FORWARD_ExpressionEdit);
    }

    public ActionForward showExpression(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ExpressionForm expressionForm = (ExpressionForm) form;
        Expression expression = wfssServiceFacade.getExpressionById(expressionForm
                .getExpId());
        expressionForm = (ExpressionForm) this.modelToForm(expression, ActionFormClass);
        request.setAttribute("ExpressionForm", expressionForm);
        request.setAttribute("appId", expressionForm.getAppId());
            return mapping.findForward(FORWARD_ExpressionEdit);
    }

    public ActionForward deleteExpression(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String[] ids = request.getParameterValues("itemIdCheckBox");
        wfssServiceFacade.deleteExpressionByIds(ids);
        request.setAttribute("reloadTree", "true");
        return mapping.findForward(FORWARD_DelToList);
    }

}
