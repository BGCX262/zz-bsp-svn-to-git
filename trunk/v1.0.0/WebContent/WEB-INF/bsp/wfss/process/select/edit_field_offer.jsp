<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@ page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<script type="text/javascript">
</script>
<html>
	<head>
		<title>可供选择人员</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
</style>

	</head>
	<body>
        <%String appFormId=request.getParameter("appFormId");
         IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
         List fieldList=wfssServiceFacade.getAppFormFieldByFormId(appFormId);
         if(fieldList==null) fieldList=new ArrayList();
         request.setAttribute("fieldList",fieldList);
        %>
		<table border="0" width="100%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1" style="height:390">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2" style="height:390" style="overflow:hidden">
							<h2 class="tab" >可供选择项</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
						       <div   style="height:350" style="overflow:auto">
						        <TABLE width="100%" <%=tableStyle%> align="center">
									<tr>
										<th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
										<th width="30%" align="center" class="ListTableHeader" nowrap="nowrap"><b>域名称</b></th>
										
									</tr>
									<logic:iterate name="fieldList" id="appFormField" scope="request" >
									<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
										<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="appFormField" property="fieldAlias"/>" fieldName="<bean:write name="appFormField" property="fieldName"/>">&nbsp;</td>
										<td >
										 <bean:write name="appFormField" property="fieldName"/>(<bean:write name="appFormField" property="fieldAlias"/>)
										
										 </td>					  
									</tr>
									</logic:iterate>
								</table>
						       </div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
	<script>
	   var selectedValue=parent.parentArg.document.getElementById("editFields").value;
	   var selectedValueArr=selectedValue.split(",");
	   var objItemIdCheckBox=document.getElementsByName("itemIdCheckBox")
	   for(var i=0;i<selectedValueArr.length;i++)
	   {
	       for(var j=0;j<objItemIdCheckBox.length;j++)
           {
              if(selectedValueArr[i]==objItemIdCheckBox[j].value)
              {
                 objItemIdCheckBox[j].checked=true;
                 break;
              }
           }
	   }
	</script>
</html>

