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
								  Activity fromActivityObj=(Activity)request.getAttribute("fromActivityObj");
								Activity toActivityObj=(Activity)request.getAttribute("toActivityObj");
							      List ownerOrgs = (List)request.getAttribute("ownerOrgs");
								      if(ownerOrgs.size()>1)
								      {
								      %>
									    <tr height="26">
										    <td rowspan="<%=ownerOrgs.size()%>"><%=fromActivityObj.getActivityName()%></td>
										    <td rowspan="<%=ownerOrgs.size()%>"><%=toActivityObj.getActivityName()%></td>
										    <%WfOrg wfOrg=(WfOrg)ownerOrgs.get(0);%>
										    <td><%=wfOrg.getOrgName()%></td>
										    
									   </tr>
									    <%for(int j=1;j<ownerOrgs.size();j++)
									    {%>
									    <tr height="26">
									   	  <%WfOrg wfOrgTemp=(WfOrg)ownerOrgs.get(j);%>
										    <td><%=wfOrgTemp.getOrgName()%></td>
										  
									  	</tr>
								      <%
								       }
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

