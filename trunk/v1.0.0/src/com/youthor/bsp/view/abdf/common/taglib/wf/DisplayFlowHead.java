package com.youthor.bsp.view.abdf.common.taglib.wf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Process;
public class DisplayFlowHead extends BodyTagSupport{
    private static final long serialVersionUID = -3144777115565419975L;
    public int doEndTag() throws JspException
     {
       try {
           JspWriter out = pageContext.getOut();
           StringBuffer buf = new StringBuffer();
           HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
           Process process=(Process)request.getAttribute("CURR_PROCESS");
           String processName=process.getProcessName();
           Activity activity=(Activity)request.getAttribute("CURR_ACTIVITY");
           String activityName=activity.getActivityName();
           String workItemId=(String)request.getAttribute("wfss_workItemId");
           if(workItemId==null) workItemId="";
           String wfss_openAction=(String)request.getAttribute("wfss_openAction");
           if(wfss_openAction==null) wfss_openAction="";
             buf.append("<table width='98%' align='center'>\n");
             buf.append("<tr>\n");
             buf.append("<td>\n");
             buf.append("<div align='right'>当前流程："+processName+"\n");
             if (wfss_openAction.equals("YB")) {
               buf.append("&nbsp;&nbsp;办理环节："+activityName+"</div>\n");
             }
             else {
                 buf.append("&nbsp;&nbsp;当前环节："+activityName+"</div>\n");
             }
             buf.append("</td>\n");
             buf.append("</tr>\n");
             buf.append("</table>\n");
             buf.append(" <input type='hidden' name='SUBMIT_ROUTE_VALUE' value='' id='SUBMIT_ROUTE_VALUE'>\n");
             buf.append(" <input type='hidden' name='SUBMIT_OPTION_VALUE' value='' id='SUBMIT_OPTION_VALUE'>\n");
             buf.append(" <input type='hidden' name='SUBMIT_WF_ACTION' value='' id='SUBMIT_WF_ACTION'>\n");
             buf.append(" <input type='hidden' name='wfss_processId' value='"+process.getProcessId()+"' id='wfss_processId'>\n");
             buf.append(" <input type='hidden' name='wfss_activityId' value='"+activity.getActivityId()+"' id='wfss_activityId'>\n");
             buf.append(" <input type='hidden' name='wfss_workItemId' value='"+workItemId+"' id='wfss_workItemId'>\n");
             buf.append(" <input type='hidden' name='wfss_openAction' value='"+wfss_openAction+"' id='wfss_openAction'>\n");
           out.println(buf.toString());
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
       return EVAL_PAGE;
     }

}
