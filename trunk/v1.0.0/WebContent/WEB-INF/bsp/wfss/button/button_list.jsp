<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	
	<fe:body >
    <fe:topTable>
        <!--  <input type='button' name='power_button'  value='新增'   class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initButton_wfss.do','self')" >&nbsp;&nbsp;-->
        <fe:powerTool funCode="wfss_button" groupName="list"/>
         
    </fe:topTable>

  <fe:span>
<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	<thead>
		<tr>
		   
			<td width="25%" align="center"  nowrap="nowrap"><b>按钮名称</b></td>
			<td width="25%" align="center"  nowrap="nowrap"><b>按钮ID</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>按钮所处理位置</b></td>
			<td width="25%" align="center"  nowrap="nowrap"><b>执行js方法</b></td>
		</tr>
	</thead>
	<logic:iterate name="allButton" id="button" scope="request" >
	<bean:define id="buttonRequest" name="button" toScope="request"></bean:define>
	<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
	
			
              <td>
              <a href="#" onclick="buttomOnClick('<%=baseURL%>/showButton_wfss.do?buttonId=<bean:write name="button" property="buttonId"/>','self')" >
                <bean:write name="button" property="buttonStyleId"/>
               </a>
			 </td>
			 
			  <td>
			   <bean:write name="button" property="buttonName"/>
			 
			 </td>
			   
			  <td>
			  <fe:codeToName dictType="buttonPositions" name="buttonRequest" property="buttonPosition" struts="true"/>
             
			 </td>
			  
			  <td>
			       <bean:write name="button" property="jsMethod"/>
			    
			 </td>
		</tr>
		</logic:iterate>
</table>
	</fe:span>
	<fe:bottomTable>
		
	</fe:bottomTable>
</fe:body>
</html>

