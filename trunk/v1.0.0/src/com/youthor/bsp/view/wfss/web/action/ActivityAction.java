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
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Participant;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.wfss.common.WFCacheHelper;
import com.youthor.bsp.view.wfss.web.form.ActivityForm;

/**
 * 
 */
public class ActivityAction extends BaseStrutsAction {

    private static final String FORWARD_ActivityEdit = "activityEdit";

    private static final String FORWARD_DelToList = "delToList";

    private static final String ActionFormClass = ActivityForm.class.getName();

    private static final String modelClass = Activity.class.getName();

    private IWfssServiceFacade wfssServiceFacade;


    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    public ActionForward initActivity(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String processId = request.getParameter("processId");
        
        Process process = wfssServiceFacade.getProcessById(processId);
        request.setAttribute("editionId", process.getEditionId());
        request.setAttribute("process",process);
        
        ActivityForm activityFrom = (ActivityForm) form;
        activityFrom.setProcessId(processId);
        activityFrom.setIsFirstNode("N");
        activityFrom.setAppFormId(process.getAppFormId());
        activityFrom.setSplitMode("XOR");
        activityFrom.setJoinMode("XOR");
        activityFrom.setOperateMode("XOR");
        activityFrom.setAttachPrivilege("NONE");
        activityFrom.setIsBatch("N");
        activityFrom.setNotifyType("EMAIL");
        activityFrom.setAttachTypeDynamic("N");
        activityFrom.setAttachTypeValueMode("VALUE");
        activityFrom.setProcessButtonMode("ALL_ROUTE");
        
        activityFrom.setAppId(process.getAppId());
        request.setAttribute("appId",process.getAppId());
        return mapping.findForward(FORWARD_ActivityEdit);
    }

    public ActionForward saveActivity(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActivityForm activityFrom = (ActivityForm) form;
        request.setAttribute("appId",activityFrom.getAppId());
        Activity activity = (Activity) this.formToModel(activityFrom, modelClass);
        String [] operations = request.getParameterValues("operation");
        String operation = StringHelper.arrToString(operations);
        activity.setOperation(operation);
        activityFrom.setOperation(operation);
        Process process=wfssServiceFacade.getProcessById(activity.getProcessId());
        request.setAttribute("editionId", process.getEditionId());
        request.setAttribute("process",process);
        //处理是否选择了人员
        List partList=new ArrayList();
        if(!StringHelper.doWithNull(activityFrom.getPartUserIds()).equals(""))
        {
            String [] userIdsArr=StringHelper.split(activityFrom.getPartUserIds(),",");
            String [] nameIdsArr=StringHelper.split(activityFrom.getPartUserNames(),",");
            for(int i=0;i<userIdsArr.length;i++)
            {
                Participant participant=new Participant();
                participant.setMemberId(userIdsArr[i]);
                participant.setMemberType("USER");
                participant.setParentType("A");
                participant.setParticipantName(nameIdsArr[i]);
                participant.setOrderIndex(i);
                partList.add(participant);
            }
        }
        
        if(!StringHelper.doWithNull(activityFrom.getPartOrgIds()).equals(""))
        {
            String [] orgIdsArr=StringHelper.split(activityFrom.getPartOrgIds(),",");
            String [] nameIdsArr=StringHelper.split(activityFrom.getPartOrgNames(),",");
            String [] orgCodesArr=StringHelper.split(activityFrom.getPartOrgTypeCodes(),",");
            for(int i=0;i<orgIdsArr.length;i++)
            {
                Participant participant=new Participant();
                participant.setMemberId(orgIdsArr[i]);
                participant.setMemberType("ORG");
                participant.setParentType("A");
                participant.setOrgTypeCode(orgCodesArr[i]);
                participant.setParticipantName(nameIdsArr[i]);
                participant.setOrderIndex(i);
                partList.add(participant);
            }
        }
        activity.setPartticipantList(partList);
        if (StringHelper.doWithNull(activity.getActivityId()).equals("")) {
            wfssServiceFacade.addActivity(activity);
            
            request.setAttribute("reloadTree", "true");
            activityFrom.setActivityId(activity.getActivityId());

        } else {
            String activityOldName=request.getParameter("activityOldName");
            if(activityOldName==null) activityOldName="";
            if(!activityOldName.equals(activity.getActivityName()))
            {
                request.setAttribute("reloadTree", "true");
            }
            String orderIndexOld=request.getParameter("orderIndexOld");
            float orderIndexOldF=Float.parseFloat(orderIndexOld);
            
            if(orderIndexOldF!=activity.getOrderIndex())
            {
                request.setAttribute("reloadTree", "true");
            }
            
            if(activity.getIsFirstNode().equals("Y"))
            {
                
                process.setFirstActivityId(activity.getActivityId());
                wfssServiceFacade.updateProcess(process);
            }
            
            wfssServiceFacade.updateActivity(activity);
        }
        WFCacheData.mapActivityId.clear();
        WFCacheData.mapActivityAlias.clear();
        
        return mapping.findForward(FORWARD_ActivityEdit);
    }

    public ActionForward showActivity(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActivityForm activityForm = (ActivityForm) form;
        Activity activity = wfssServiceFacade.getActivityById(activityForm
                .getActivityId());
        activityForm = (ActivityForm) this.modelToForm(activity, ActionFormClass);
        List partList=activity.getPartticipantList();
        if(partList!=null&&!partList.isEmpty())
        {
            StringBuffer userIds=new StringBuffer();
            StringBuffer userNames=new  StringBuffer();
            StringBuffer orgIds=new StringBuffer();
            StringBuffer orgNames=new  StringBuffer();
            StringBuffer orgTypeCodes=new  StringBuffer();
            for(int i=0;i<partList.size();i++)
            {
                Participant participant=(Participant)partList.get(i);
                if(participant.getMemberType().equals("USER"))
                {
                    userIds.append(participant.getMemberId()+",");
                    userNames.append(participant.getParticipantName()+",");
                }
                if(participant.getMemberType().equals("ORG"))
                {
                    orgIds.append(participant.getMemberId()+",");
                    orgNames.append(participant.getParticipantName()+",");
                    orgTypeCodes.append(participant.getOrgTypeCode()+",");
                }
            }
            if(userIds.toString().endsWith(","))
            {
               activityForm.setPartUserIds(userIds.toString().substring(0,userIds.toString().length()-1));
               activityForm.setPartUserNames(userNames.toString().substring(0,userNames.toString().length()-1));
            }
            if(orgIds.toString().endsWith(","))
            {
               activityForm.setPartOrgIds(orgIds.toString().substring(0,orgIds.toString().length()-1));
               activityForm.setPartOrgNames(orgNames.toString().substring(0,orgNames.toString().length()-1));
               activityForm.setPartOrgTypeCodes(orgTypeCodes.toString().substring(0,orgTypeCodes.toString().length()-1));
            }
        }
        request.setAttribute("ActivityForm", activityForm);
        request.setAttribute("appId",activityForm.getAppId());
        Process process = wfssServiceFacade.getProcessById(activity.getProcessId());
        request.setAttribute("process",process);
        request.setAttribute("editionId", process.getEditionId());
        return mapping.findForward(FORWARD_ActivityEdit);
    }

    public ActionForward deleteActivity(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String[] ids = request.getParameterValues("itemIdCheckBox");
        wfssServiceFacade.deleteActivityByIds(ids);
        request.setAttribute("reloadTree", "true");
        return mapping.findForward(FORWARD_DelToList);
    }

}
