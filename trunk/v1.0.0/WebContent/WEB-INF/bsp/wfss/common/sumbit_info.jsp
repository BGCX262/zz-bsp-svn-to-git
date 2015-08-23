<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.model.WfActorProperty"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Route"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.common.model.WfOrg"%>


<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>流程操作提示信息</title>
    <script>
     function goBackWorkItemDoig()
     {
        location.href="<%=baseURL%>/listWorkItemDoing_wfss.do";
     }
     function doNextWorkItemDoing()
     {
        location.href="<%=baseURL%>/showNextWorkItemDoing_wfss.do";
     }
     
      function showWorkItemDoen()
     {
        location.href="<%=baseURL%>/showWorkItemDoen_wfss.do?workItemId=<%=(String)request.getAttribute("wfss_workItemDoenId")%>";
     }
     
    </script>
    </head>
    <body>
  <br>
   <br>
    <br>
     <br>
      <br>
       <br>
 <table border="0" width="70%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="tabPane1">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
                        <div class="tab-page" id="tabPage2">
                            <h2 class="tab">
                                提示信息
                            </h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
                             <table  <%=tableStyle%> width="100%">
                               <tr  class=ListTableRow >
                               
                                  <td colspan="4">
                                 
                                  <input type='button' name='power_button'  value='查看处理数据'  class='Button'  onclick="showWorkItemDoen()">&nbsp;&nbsp;
                                  <input type='button' name='power_button'  value='返回待办箱'  class='Button'  onclick="goBackWorkItemDoig()">&nbsp;&nbsp;
                                  <input type='button' name='power_button'  value='继续处理下一条待办'  class='Button' onclick="doNextWorkItemDoing()" >&nbsp;&nbsp;
                                 </td>
                                </tr>
                                </table>
                            <TABLE width="100%" <%=tableStyle%> align="center">
                                <tr>
                                    <th  align="center" class="ListTableHeader" width="30%" nowrap="nowrap">当前环节</th>
                                    <th width="30%" align="center" class="ListTableHeader" nowrap="nowrap"><b>提交到下一环节</b></th>
                                    <th width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b>下一环节参与者</b></td>
                                    
                                </tr>
                                <%
                                String processIsNext = (String)request.getAttribute("PROCESS_IS_NEXT") ;
                                IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
                                List wfss_submitRouteInfo=(List)request.getAttribute("wfss_submitRouteInfo");
                                if (!processIsNext.equals("N")) {
                                if(wfss_submitRouteInfo!=null&&wfss_submitRouteInfo.size()>0)
                                {
                                   for(int i=0;i<wfss_submitRouteInfo.size();i++)
                                   {
                                      WfActorProperty wfActorProperty=(WfActorProperty)wfss_submitRouteInfo.get(i);
                                      Route route=wfActorProperty.getRoute();
                                      List ownerOrgs=wfActorProperty.getOwnerOrgs();
                                      String fromActivityId=route.getActivityId();
                                      String toActivityId=route.getToActivityId();
                                      Activity fromActivityIdObj=wfCacheEngine.getActivityById(fromActivityId);
                                      Activity toActivityIdObj=wfCacheEngine.getActivityById(toActivityId);
                                      if(route.getIsPointToEnd().equals("N")){
                                      if(ownerOrgs.size()>1)
                                      {
                                      %>
                                        <tr height="26">
                                            <td rowspan="<%=ownerOrgs.size()%>"><%=fromActivityIdObj.getActivityName()%></td>
                                            <td rowspan="<%=ownerOrgs.size()%>"><%=toActivityIdObj.getActivityName()%></td>
                                            <%WfOrg wfOrg=(WfOrg)ownerOrgs.get(0);%>
                                            <td><%=wfOrg.getOrgName()%>
                                            <%if(wfOrg.getIsAgentedOrgName()!=null && !wfOrg.getIsAgentedOrgName().equals("")){%>
                                            (<%=wfOrg.getIsAgentedOrgName()%>)
                                            <%} %>
                                            </td>
                                            
                                       </tr>
                                        <%for(int j=1;j<ownerOrgs.size();j++)
                                        {%>
                                        <tr height="26">
                                             <%WfOrg wfOrgTemp=(WfOrg)ownerOrgs.get(j);%>
                                            <td><%=wfOrgTemp.getOrgName()%>
                                             <%if(wfOrgTemp.getIsAgentedOrgName()!=null && !wfOrgTemp.getIsAgentedOrgName().equals("")){%>
                                            (<%=wfOrgTemp.getIsAgentedOrgName()%>)
                                            <%} %>
                                            </td>
                                          
                                          </tr>
                                      <%
                                       }
                                      }
                                      else
                                      {
                                        %>
                                          <tr height="26">
                                            <td ><%=fromActivityIdObj.getActivityName()%></td>
                                            <td ><%=toActivityIdObj.getActivityName()%></td>
                                            <%
                                            if (ownerOrgs.size()>0) {
                                            WfOrg wfOrg=(WfOrg)ownerOrgs.get(0);%>
                                          
                                            <td><%=wfOrg.getOrgName()%>
                                             <%if(wfOrg.getIsAgentedOrgName()!=null && !wfOrg.getIsAgentedOrgName().equals("")){%>
                                            (<%=wfOrg.getIsAgentedOrgName()%>)
                                            <%} %>ytyty
                                            </td>
                                            <%}else {%>
                                             <td>无</td>
                                            <% }%>
                                           
                                       </tr>
                                        <%
                                      }
                                   }
                                   else
                                   {
                                       
                                     %>
                                        <tr height="26">
                                            <td ><%=fromActivityIdObj.getActivityName()%></td>
                                            <td ><%=toActivityIdObj.getActivityName()%></td>
                                         
                                          
                                            <td>无</td>
                                            
                                           
                                       </tr>
                                     <%
                                   }
                                }
                                }
                                }
                                else {
                                     Activity  CURR_ACTIVITY = (Activity)request.getAttribute("CURR_ACTIVITY");
                                    %>
                                     <tr height="26">
                                            <td ><%=CURR_ACTIVITY.getActivityName()%></td>
                                            <td >无</td>
                                         
                                          
                                            <td>无</td>
                                            
                                           
                                       </tr>
                                    <%
                                }
                                %>
                            </table>
                        </div>
                    </div>
                </td>
              </tr>
            </table>
    
  </body>
</html>

