package com.youthor.bsp.view.abdf.common.taglib.wf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.DateHelper;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.common.helper.FlowDataHelper;
import com.youthor.bsp.core.wfss.common.model.WfProcessTraceHelper;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.ProcessInstance;

public class ProcessTraceTag extends BodyTagSupport{
    private static final long serialVersionUID = -8665466325545039709L;

    public int doEndTag() throws JspException
     {
          try {
            JspWriter out = pageContext.getOut();
            StringBuffer buf = new StringBuffer();
            HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
            buf.append("<TABLE  cellspacing='0' cellpadding='3' width='100%' class='tlist' align='center'>\n");
            buf.append("<thead>\n");
            buf.append("<tr>\n");
            buf.append("<td align='center'  width='3%'><b>序</b></td>\n");
            buf.append("<td width='20%' align='center'  nowrap='nowrap'><b>环节</b></td>\n");
            buf.append("<td width='25%' align='center' nowrap='nowrap'><b>处理状态</b></td>\n");
            buf.append("<td width='30%' align='center' nowrap='nowrap'><b>提交状态</b></td>\n");
            buf.append("<td width='25%' align='center' nowrap='nowrap'><b>意见</b></td>\n");
            //buf.append("<td width='12%' align='center' nowrap='nowrap'><b>超时</b></td>\n");
            buf.append("</tr>\n");
            buf.append("</thead>\n");
            String workItemId = (String) request.getAttribute("wfss_workItemId");
            if (workItemId == null) workItemId = "";
            if(!workItemId.equals("")) {
               IWfssServiceFacade wfssServiceFacade = (IWfssServiceFacade) SpringHelper.getBean("wfssServiceFacade");
               List listWfProcessTrace = wfssServiceFacade.listWfProcessTraceByIdWorkItemId(workItemId);
               buildProcessTraceSrc( buf, listWfProcessTrace);
               ProcessInstance processInstance=wfssServiceFacade.getProcessInstanceByWorkItemId(workItemId);
               if(processInstance!=null&&processInstance.getStatus()!=null&&processInstance.getStatus().equals("JS"))
                {
                   buf.append("<tr>\n");
                   buf.append("<td align='center'  width='100%' colspan='5'><font color='red'>本流程已结束</font></td>\n");
                   buf.append("</tr>\n");
                }
               else if (processInstance!=null&&processInstance.getStatus()!=null&&processInstance.getStatus().equals(Constants.WF_CANCEL)) {
                   buf.append("<tr>\n");
                   buf.append("<td align='center'  width='100%' colspan='5'><font color='red'>本流程已取消</font></td>\n");
                   buf.append("</tr>\n");
               }
               else if (processInstance!=null&&processInstance.getStatus()!=null&&processInstance.getStatus().equals(Constants.WF_HANG)) {
                   buf.append("<tr>\n");
                   buf.append("<td align='center'  width='100%' colspan='5'><font color='red'>本流程已挂起</font></td>\n");
                   buf.append("</tr>\n");
               }
            }
            buf.append("</table>\n");
            out.println(buf.toString());
          }
          catch(Exception ex)
           {
               ex.printStackTrace();
           }
          return EVAL_PAGE;
     }

    private void buildProcessTraceSrc(StringBuffer buf, List listWfProcessTrace) {
          IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
            try {
                List listWfProcessTraceHelper = WfProcessTraceHelper.getWfProcessTraceHelper(listWfProcessTrace);
                if (listWfProcessTraceHelper == null|| listWfProcessTraceHelper.isEmpty()) return;
                WfProcessTraceHelper wfProcessTraceHelper = (WfProcessTraceHelper) listWfProcessTraceHelper.get(0);
                if (wfProcessTraceHelper != null) {
                    ActivityInstance activityInstanceTop = wfProcessTraceHelper.getActivityInstance();
                    List listChild = wfProcessTraceHelper.getWfProcessTraceHelperList();

                    if (listChild.size() == 0) {
                        buf.append("<tr height='25' >");
                        buf.append("<td>1</td>");
                        buf.append("<td>");
                        Activity activity =wfCacheEngine.getActivityById(activityInstanceTop.getActivityId());
                        buf.append(activity.getActivityName());
                        buf.append("</td>");
                        buf.append("<td>");
                        buf.append(activityInstanceTop.getExecutorName() + "(草稿)");
                        buf.append("</td>");
                        buf.append("<td>&nbsp;</td>");
                        buf.append("<td>&nbsp;</td>");
                        //buf.append("<td>&nbsp;</td>");
                        buf.append("</tr>");
                    } else {
                        if (listChild.size() > 1) {
                            buf.append("<tr height='25' >");
                            buf.append("<td rowspan=" + listChild.size()
                                    + ">1</td>");
                            buf.append("<td rowspan=" + listChild.size() + ">");
                            Activity activity = wfCacheEngine.getActivityById(activityInstanceTop.getActivityId());
                            buf.append(activity.getActivityName());
                            buf.append("</td>");
                            buf.append("<td rowspan=" + listChild.size() + ">");
                            buf.append(activityInstanceTop.getExecutorName()
                                    + " 于 " + DateHelper.converDateToLongStr(activityInstanceTop.getCompleteDate())
                                    + "&nbsp;处理完成  ");
                            buf.append("</td>");

                            buf.append("<td> ");
                            WfProcessTraceHelper wfProcessTraceHelper2 = (WfProcessTraceHelper) listChild.get(0);
                            ActivityInstance activityInstance2 = wfProcessTraceHelper2.getActivityInstance();
                            Activity toActivity2 =wfCacheEngine.getActivityById(activityInstance2.getToActivityId());
                            buf.append(FlowDataHelper.getDesBySubmitStates(activityInstance2.getSubmitStatus())+"&nbsp;");
                            buf.append(activityInstance2.getExecutorName());
                            if(StringHelper.isHasContent(activityInstance2.getIsAgentedOrgName())) {
                                buf.append("("+activityInstance2.getIsAgentedOrgName()+")");
                            }
                            buf.append( "&nbsp;");
                            buf.append(toActivity2.getActivityName());
                            buf.append(FlowDataHelper.getDesByDisposalStatesWithRed(activityInstance2.getStatus()));
                            
                            buf.append("</td>");
                            String option = activityInstanceTop.getExecuteMsg();
                            if (option == null || option.trim().equals(""))
                                option = "&nbsp;";
                            buf.append("<td rowspan=" + listChild.size() + ">" + option + "</td>");
                            //buf.append("<td>&nbsp;</td>");
                            buf.append("</tr>");

                            for (int j = 1; j < listChild.size(); j++) {
                                buf.append("<tr> ");
                                buf.append("<td> ");
                                wfProcessTraceHelper2 = (WfProcessTraceHelper) listChild.get(j);
                                activityInstance2 = wfProcessTraceHelper2.getActivityInstance();
                                toActivity2 =wfCacheEngine.getActivityById(activityInstance2.getToActivityId());
                                buf.append(FlowDataHelper.getDesBySubmitStates(activityInstance2.getSubmitStatus())+"&nbsp;");
                                buf.append(activityInstance2.getExecutorName());
                                if(StringHelper.isHasContent(activityInstance2.getIsAgentedOrgName())) {
                                    buf.append("("+activityInstance2.getIsAgentedOrgName()+")");
                                }
                                buf.append( "&nbsp;");
                                
                                buf.append(toActivity2.getActivityName());
                                buf.append(FlowDataHelper.getDesByDisposalStatesWithRed(activityInstance2.getStatus()));
                                
                                buf.append("</td>");
                                
                                //buf.append("<td>&nbsp;</td>");
                                buf.append("</tr>");
                            }

                        } else {
                            buf.append("<tr height='25' >");
                            buf.append("<td>1</td>");
                            buf.append("<td>");
                            Activity activity = wfCacheEngine.getActivityById(activityInstanceTop.getActivityId());
                            buf.append(activity.getActivityName());
                            buf.append("</td>");
                            buf.append("<td>");
                            buf.append(activityInstanceTop.getExecutorName()
                                    + " 于 " + DateHelper.converDateToLongStr(activityInstanceTop.getCompleteDate())
                                    + "&nbsp;处理完成  ");
                            buf.append("</td>");

                            buf.append("<td> ");

                            WfProcessTraceHelper wfProcessTraceHelper2 = (WfProcessTraceHelper) listChild
                                    .get(0);
                            ActivityInstance activityInstance2 = wfProcessTraceHelper2
                                    .getActivityInstance();
                            Activity toActivity2 =wfCacheEngine.getActivityById(activityInstance2.getToActivityId());
                            buf.append(FlowDataHelper.getDesBySubmitStates(activityInstance2.getSubmitStatus())+"&nbsp;");
                            buf.append(activityInstance2.getExecutorName());
                            if(StringHelper.isHasContent(activityInstance2.getIsAgentedOrgName())) {
                                buf.append("("+activityInstance2.getIsAgentedOrgName()+")");
                            }
                            buf.append( "&nbsp;");
                            buf.append(toActivity2.getActivityName());
                            buf.append(FlowDataHelper.getDesByDisposalStatesWithRed(activityInstance2.getStatus()));
                            
                            buf.append("</td>");
                            String option = activityInstanceTop.getExecuteMsg();
                            if (option == null || option.trim().equals(""))
                                option = "&nbsp;";
                            buf.append("<td>" + option + "</td>");
                            //buf.append("<td>&nbsp;</td>");
                            buf.append("</tr>");
                        }
                    }
                }
                if (listWfProcessTraceHelper.size() == 1)
                    return;
                for (int n = 1; n < listWfProcessTraceHelper.size(); n++) {
                    wfProcessTraceHelper = (WfProcessTraceHelper) listWfProcessTraceHelper.get(n);
                    List listChild = wfProcessTraceHelper.getWfProcessTraceHelperList();
                    ActivityInstance activityInstanceTopTemp = wfProcessTraceHelper.getActivityInstance();
                    if (listChild.size() > 1) {
                        buf.append("<tr height='25' >");
                        buf.append("<td rowspan=" + listChild.size() + ">"
                                + (n + 1) + "</td>");
                        buf.append("<td rowspan=" + listChild.size() + ">");
                        Activity activity = wfCacheEngine.getActivityById(activityInstanceTopTemp.getToActivityId());
                        buf.append(activity.getActivityName());
                        buf.append("</td>");
                        buf.append("<td rowspan=" + listChild.size() + ">");
                        buf.append(activityInstanceTopTemp.getExecutorName()
                                        + " 于 "
                                        + DateHelper.converDateToLongStr(activityInstanceTopTemp.getCompleteDate())
                                        + "&nbsp;处理完成  ");
                        buf.append("</td>");
                        buf.append("<td>"+FlowDataHelper.getDesBySubmitStates(activityInstanceTopTemp.getSubmitStatus())+" ");
                        WfProcessTraceHelper wfProcessTraceHelper2 = (WfProcessTraceHelper) listChild
                                .get(0);
                        ActivityInstance activityInstance2 = wfProcessTraceHelper2
                                .getActivityInstance();
                        Activity toActivity2 = wfCacheEngine.getActivityById(activityInstance2.getToActivityId());
                        buf.append(activityInstance2.getExecutorName());
                        if(StringHelper.isHasContent(activityInstance2.getIsAgentedOrgName())) {
                            buf.append("("+activityInstance2.getIsAgentedOrgName()+")");
                        }
                        buf.append( "&nbsp;");
                        
                        buf.append(toActivity2.getActivityName());
                        buf.append(FlowDataHelper.getDesByDisposalStatesWithRed(activityInstance2.getStatus()));
                        buf.append("</td>");
                        String option = activityInstanceTopTemp.getExecuteMsg();
                        if (option == null || option.trim().equals(""))
                            option = "&nbsp;";
                        buf.append("<td rowspan=" + listChild.size() + ">" + option + "</td>");
                        //buf.append("<td>&nbsp;</td>");
                        buf.append("</tr>");
                        for (int j = 1; j < listChild.size(); j++) {
                        wfProcessTraceHelper2 = (WfProcessTraceHelper) listChild.get(j);
                            activityInstance2 = wfProcessTraceHelper2.getActivityInstance();
                            buf.append("<tr>");
                            buf.append("<td>"+FlowDataHelper.getDesBySubmitStates(activityInstance2.getSubmitStatus())+" ");
                            
                            toActivity2 = wfCacheEngine.getActivityById(activityInstance2.getToActivityId());
                            
                            buf.append(activityInstance2.getExecutorName());
                            if(StringHelper.isHasContent(activityInstance2.getIsAgentedOrgName())) {
                                buf.append("("+activityInstance2.getIsAgentedOrgName()+")");
                            }
                            buf.append( "&nbsp;");
                            buf.append(toActivity2.getActivityName());
                            buf.append(FlowDataHelper.getDesByDisposalStatesWithRed(activityInstance2.getStatus()));
                            buf.append("</td>");
                            
                            //buf.append("<td>&nbsp;</td>");
                            buf.append("</tr>");
                        }

                    } else {
                        buf.append("<tr height='25' >");
                        buf.append("<td >" + (n + 1) + "</td>");
                        buf.append("<td >");
                        Activity activity =wfCacheEngine.getActivityById(activityInstanceTopTemp.getToActivityId());
                        
                        buf.append(activity.getActivityName());
                        buf.append("</td>");
                        buf.append("<td >");
                        buf.append(activityInstanceTopTemp.getExecutorName()
                                        + " 于 "
                                        + DateHelper.converDateToLongStr(activityInstanceTopTemp.getCompleteDate())
                                        + " &nbsp;处理完成  ");
                        buf.append("</td>");
                        WfProcessTraceHelper wfProcessTraceHelper2 = (WfProcessTraceHelper) listChild
                                .get(0);
                        ActivityInstance activityInstance2 = wfProcessTraceHelper2
                                .getActivityInstance();
                        buf.append("<td>"+FlowDataHelper.getDesBySubmitStates(activityInstance2.getSubmitStatus())+" ");
                        Activity toActivity2 = wfCacheEngine.getActivityById(activityInstance2.getToActivityId());
                        buf.append(activityInstance2.getExecutorName());
                        if(StringHelper.isHasContent(activityInstance2.getIsAgentedOrgName())) {
                            buf.append("("+activityInstance2.getIsAgentedOrgName()+")");
                        }
                        buf.append( "&nbsp;");
                        buf.append(toActivity2.getActivityName());
                        buf.append(FlowDataHelper.getDesByDisposalStatesWithRed(activityInstance2.getStatus()));
                        buf.append("</td>");
                        String option = activityInstanceTopTemp.getExecuteMsg();
                        if (option == null || option.trim().equals(""))
                            option = "&nbsp;";
                        buf.append("<td>" + option + "</td>");
                        //buf.append("<td>&nbsp;</td>");
                        buf.append("</tr>");

                    }

                }
            } catch (Exception ex) {
                ex.printStackTrace();
                
            }
        }

}
