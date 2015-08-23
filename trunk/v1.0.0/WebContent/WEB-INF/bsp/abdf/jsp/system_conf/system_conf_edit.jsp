<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>	
<%@ page import="com.youthor.bsp.core.abdf.model.SystemConf"%>	

<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
 <%
	Map groupMap = (Map)request.getAttribute("groupMap");
	Set keys = groupMap.keySet();
 %>
 	<script type="text/javascript">
 		function selfDefSubmitForm(objId){
 		    var obj = null;
 		    var isSumbit = true;
 		     <%
 		    Iterator it = keys.iterator();
		   while(it.hasNext()){
		     String id = (String)it.next();
			 List formList = (List)groupMap.get(id);
			 for(int i=0;i<formList.size();i++){
				SystemConf systemConf =(SystemConf)formList.get(i);
				String key = systemConf.getKey();
				String notNull =  systemConf.getNotNull() == null ? "N" : systemConf.getNotNull();
				String inputType =  systemConf.getInputType() == null ? "text" : systemConf.getInputType();
				if (notNull.equalsIgnoreCase("Y")) {
					if (!inputType.equalsIgnoreCase("checkbox")) {
				%>
				    obj = document.getElementById("<%=systemConf.getKey()%>");
				    if (obj.value == "") {
				       alert("<%=systemConf.getMemo()%>不能为空,请填写!");
				       try {
				          obj.select();
				       }catch(e){}
				       isSumbit=false;
				       return;
				    }
				   
				<%
				 }
					else if (inputType.equalsIgnoreCase("checkbox")) {
						%>
						if (getCheckBoxNum("<%=systemConf.getKey()%>") == 0) {
						     alert("<%=systemConf.getMemo()%>不能为空,请填写!");
						     isSumbit=false;
						      return;
						}
						<%
					}
				}
			 }
		   }
			 %>
			 if (isSumbit) {
 			   var objForm =document.getElementById(objId);
 			   formToAbled();
 		       objForm.submit();
 		     }
 		}
 		function displayRed() {
 		   <%
 		    it = keys.iterator();
		   while(it.hasNext()){
		     String id = (String)it.next();
			 List formList = (List)groupMap.get(id);
			 for(int i=0;i<formList.size();i++){
				SystemConf systemConf =(SystemConf)formList.get(i);
				String key = systemConf.getKey();
				String notNull =  systemConf.getNotNull() == null ? "N" : systemConf.getNotNull();
				if (notNull.equalsIgnoreCase("Y")) {
				%>
				document.getElementById("<%=key%>.span").className="promptRed";
				<%
				}
			 }
		   }
			 %>
 		}
 	</script>
 	
	<fe:body  onload="displayRed()">
    <fe:topTable>
       <fe:powerTool funCode="urss_sys_para" groupName="edit"/>
    </fe:topTable>

  <fe:span>
    <form action="<%=baseURL%>/saveSystemConf_abdf.do"   id="SystemConfEdit" style="margin: 0" method="post" >
	<br/><center><font size="4"><b>系统参数配置</b></font></center><br/>
	<table border="0" width="80%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2">
							<h2 class="tab">
								基本属性
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
				<%
				it = keys.iterator();
				while(it.hasNext()){
					String id = (String)it.next();
					List formList = (List)groupMap.get(id);
				%>
			 <tr>
				<td width="100%" >
				<fieldset style='width:100%'><legend><%=id %></legend>
				<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
					<%
					int len = formList.size();
					for(int i=0;i<len;i++){
						SystemConf systemConf =(SystemConf)formList.get(i);
						request.setAttribute("oneItemForm", systemConf);
						String inputType = systemConf.getInputType() == null ? "text" : systemConf.getInputType();
						String systemIn =  systemConf.getSystemIn() == null ? "N" : systemConf.getSystemIn();
						String disabled = "";
						boolean bDisabled = false;
						if (systemIn.equalsIgnoreCase("Y")) {
							disabled = "readonly = 'true'";
							bDisabled = true;
						}
					%>
					<tr>
						<td width="15%"><span id="<%=systemConf.getKey()%>.span"><bean:write name="oneItemForm" property="memo"/>:</span></td>
						<td>&nbsp;&nbsp;
						<%if(inputType.equalsIgnoreCase("text")) {%>
						<input type="text" size="60" <%=disabled%> name="<%=systemConf.getKey()%>" value="<%=systemConf.getValue()%>" id="<%=systemConf.getKey()%>" class="formStyleall">
						<%} else if (inputType.equalsIgnoreCase("radio")) {%>
						<fe:radioBox dictType="<%=systemConf.getDictTypeCode()%>"  dynamic="false" struts="false" defaultValue="<%=systemConf.getValue()%>" scope="request" valueType="<%=systemConf.getDictTypeValueType()%>" property="<%=systemConf.getKey()%>" disabled="<%=bDisabled%>"/>
						<% } else if (inputType.equalsIgnoreCase("checkBox")) {
							%>
							  <fe:checkBox dictType="<%=systemConf.getDictTypeCode()%>"  dynamic="false" struts="false" defaultValue="<%=systemConf.getValue()%>" scope="request" valueType="<%=systemConf.getDictTypeValueType()%>" property="<%=systemConf.getKey()%>" disabled="<%=bDisabled%>"/>
							<%
						} else if (inputType.equalsIgnoreCase("select"))  {%>
						    <fe:dropDown dictType="<%=systemConf.getDictTypeCode()%>"  dynamic="false" struts="false" defaultValue="<%=systemConf.getValue()%>" scope="request" valueType="<%=systemConf.getDictTypeValueType()%>" property="<%=systemConf.getKey()%>" disabled="<%=bDisabled%>"/>
						<% 
						}//根据需要加不同的控件
						%>
								
						</td>
					</tr>
					<%
					}
					%>
				</table>
				</fieldset>
				</td>
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
	</form>
	</fe:span>
	<fe:bottomTable></fe:bottomTable>
</fe:body>
</html>

