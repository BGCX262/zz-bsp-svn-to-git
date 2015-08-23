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
    
      function showWorkItemDoen()
     {
        location.href="<%=baseURL%>/showLoopWorkItemDoen_wfss.do?workItemId=<%=(String)request.getAttribute("wfss_workItemId")%>";
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
							      <td >
							      <input type='button' name='power_button'  value='查看数据'  class='Button'  onclick="showWorkItemDoen()">&nbsp;&nbsp;
							      <input type='button' name='power_button'  value='返回待办箱'  class='Button'  onclick="goBackWorkItemDoig()">&nbsp;&nbsp;
							      </td>
							    </tr>
							   
							     <tr height="26">
										    <td>
										      本环节为顺序会签环节，您必须等待其他人处理完成后才可处理。相关信息请点“查看数据”按钮
                                            </td>
									   </tr>
								   
							</table>
						</div>
					</div>
				</td>
			  </tr>
			</table>
	
  </body>
</html>

