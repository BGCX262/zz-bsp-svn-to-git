<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.AppForm"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Process"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ProcessInstance"%>



<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>我的发起</title>
	</head>
	<fe:body>
	 <form name="listProcessInst" method="post" action="<%=baseURL%>/listProcessInstByOrgId_wfss.do" id="listProcessInst" >		
	
   <fe:span subHeight="28">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
		<tr>
			<td width="25%" align="center"  nowrap="nowrap"><b>标题</b></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>所属流程</b></td>
			<td width="10%" align="center"  nowrap="nowrap"><b>业务类型</b></td>
			<td width="17%" align="center"  nowrap="nowrap"><b>发起时间</b></td>
			
		</tr>
	  </thead>
	  <%
		IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
		List listProcessInst=(List)request.getAttribute("listProcessInst");
		if(listProcessInst!=null&&listProcessInst.size()>0)
		{
		  for(int i=0;i<listProcessInst.size();i++)
		  {
			  ProcessInstance processInstance=(ProcessInstance)listProcessInst.get(i);
			  request.setAttribute("processInstance",processInstance);
		     %>
		      <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
		     <td>
               <a href="<%=baseURL%>/showProcessInst_wfss.do?id=<%=processInstance.getProcessInstanceId()%>"><%=processInstance.getTitle()%></a>
			 </td>
			 <td>
			   <%Process process=wfCacheEngine.getProcessById(processInstance.getProcessId());
                out.write(process.getProcessName());
                %>
			 </td>
            
              <td>
                <%AppForm appForm=wfCacheEngine.getAppFormById(processInstance.getAppFormId());
			     out.write(appForm.getAppFormName());
			  %>
			 </td>
			
			  <td>
			  	<bean:define id="createTime" name="processInstance" property="createTime" scope="request"/>
			  <bean:write name="createTime" format="yyyy-MM-dd HH:mm:ss"/>
			 </td> 
		</tr>
		 <%}} %>
	</table>
	</fe:span>
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="listProcessInst"/></fe:bottomTable>
	</form>
  </fe:body>
</html>

