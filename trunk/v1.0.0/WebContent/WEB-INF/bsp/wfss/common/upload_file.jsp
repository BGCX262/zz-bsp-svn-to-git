<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ActivityInstance"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ProcessInstance"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.DateHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.common.helper.FlowDataHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.common.model.WfProcessTraceHelper"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.DictHelper"%>
<%@ page import="com.youthor.bsp.core.abdf.model.Item"%>
<%@ page import="java.util.*"%>

<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<title>上传附件</title>
</head>
<script>
<% 
Activity currActivity = (Activity)request.getAttribute("CURR_ACTIVITY"); 
String attachPrivilege = currActivity.getAttachPrivilege();
String attachType = currActivity.getAttachType();
if (attachType==null) attachType="";
%>
var fileIndex = 0;
	function addFile() 
	{
		fileIndex++;
	    var spanId = "filespan";
	    var fileId = "uploadFile(" +fileIndex+ ")";
	    var attachTypeId = "flowAttachType(" +fileIndex+ ")";
	    addInputFile(spanId, fileId,fileIndex,attachTypeId);
	}
	function addInputFile(spanId, fileId,index,attachTypeId) 
	{
    	var span = document.getElementById(spanId);
    	if (span != null) 
    	{
        	var divObj = document.createElement("div");
        	
        	var html= "文件:&nbsp;<input type=file size=\"40\" style=\"height: 22\" name='"+fileId+"'>&nbsp;";
        	
        	<%
				if (!attachType.equals("")) {
				  	List dictData = DictHelper.getDictData(currActivity.getAttachType(),"value",request);
				  	if(dictData == null) dictData = new ArrayList();
				  %>
				html = html + "<select name='"+attachTypeId+"' id='"+attachTypeId+"' size='1' >";
				html = html + "<option value='' >----请选择----</option>";
				<%
				  for(int i=0;i<dictData.size();i++) {
				  	Item item = (Item)dictData.get(i);	
				%>
				html = html +"<option value='<%=item.getKey() %>' ><%=item.getValue() %></option>"
				<%
				 }
			%>
			html = html +"</select>"
			<%
			 }
			%>
        	
        	divObj.id = fileId;
        	divObj.width = "300"
            html = html + "&nbsp;&nbsp;<input type=button onclick=delInputFile('" + spanId + "','" + fileId + "') class='button' value='删除' >"
            divObj.innerHTML = html;
        	
        	//divObj.appendChild(textObj);
        	
        	span.appendChild(divObj);
    	}
	}
	 function delInputFile(spanId, fileId) 
	{
    	var span = document.getElementById(spanId);
    	var divObj = document.getElementById(fileId);
    	if (span != null && divObj != null) 
    	{
        	span.removeChild(divObj);
    	}
	}
	
function sumbitProcessAttach()
{
  document.getElementById("saveProcessAttach").submit();
}

function closeProcessAttachWindow()
{
   returnValue = true;
   window.close();
}
</script>

<body   class="right_body" >

	<html:form action="/saveProcessAttach_wfss.do" style="margin: 0px" styleId="saveProcessAttach" enctype="multipart/form-data" target="uploadFile">
	    <fe:topTable>
	   
	    <input type='button' name='power_button' value='上传' class='Button3' onclick="sumbitProcessAttach();" > 
	    当前环节:<%=currActivity.getActivityName()%> </fe:topTable>
	     <iframe name="uploadFile" style="display:none" id="uploadFile"></iframe>
	     <input type="hidden" name="workItemId" d="workItemId" value="<%=(String)request.getAttribute("workItemId")%>">
        <fe:span>
        <center><font size=4><b>上传附件</b></font></center>

                <table width=98%"  align="center" border="0">
                                    <tr>
                                          <td nowrap id="filespan">文件:&nbsp;<input name="uploadFile(0)" type="file" size="40" style="height: 22"/>
                                          <%
                                          if (!attachType.equals("")) {
                                              List dictData = DictHelper.getDictData(currActivity.getAttachType(),"value",request);
                                              if(dictData == null) dictData = new ArrayList();
                                              %>
                                              <select name='flowAttachType(0)' id='flow_attachType(0)' size='1' >
                                                <option value='' >----请选择----</option>
                                              <%
                                              for(int i=0;i<dictData.size();i++) {
                                                  Item item = (Item)dictData.get(i);    
                                               %>
                                               <option value='<%=item.getKey() %>' ><%=item.getValue() %></option>
                                               <%
                                              }
                                              %>
                                               </select>
                                              <%
                                          }
                                              %>&nbsp;&nbsp;<input name="button" type="button" onclick="addFile()" class="button" value="增加" /></td>
                                      </tr>
                                </table>
        
         </fe:span>
    </html:form>
    
     <fe:bottomTable>
        
    </fe:bottomTable>
   </body>

<script language=javascript>
document.getElementById('CONTENT_SPAN').style.height=document.body.clientHeight-51;
window.onresize = onresize_CONTENT_SPAN;
function onresize_CONTENT_SPAN() {
document.getElementById('CONTENT_SPAN').style.height=document.body.clientHeight-51;
}
</script>

</html>

