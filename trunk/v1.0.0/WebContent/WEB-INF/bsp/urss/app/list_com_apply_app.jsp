<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.AppForm"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Process"%>


<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>注册公司管理</title>
	</head>
	<fe:body>
	


	<form action="<%=baseURL%>/queryPageRegCompany_urss.do" id="regComListForm" method="post" name="regComListForm">		
	<fe:topTable> 
      <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/delDictionaryType_urss.do','self')" id='RegCompany_del'>&nbsp;&nbsp;
   </fe:topTable> 
  
   <fe:span>
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
		<thead>
		<tr>
		    <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<fe:tabTitle title="<b>公司名称</b>" column="regComName" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
			<fe:tabTitle title="<b>应用名称</b>" column="regComCode" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>状态</b>" column="regComBoss" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
	        <fe:tabTitle title="<b>有效期</b>" column="regComEmail" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		</tr>
		</thead>
		<logic:iterate name="pageList" id="appCom" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="appCom" property="appComId"/>" >&nbsp;</td>
			<td >
			
			  <bean:write name="appCom" property="comName"/>&nbsp;
			
			 </td>
			 <td  >
			 <bean:write name="appCom" property="appName"/>&nbsp;
			 </td>
			 
			 <td  >
			 <bean:write name="appCom" property="status"/>&nbsp;
			 </td>
			  <td  >
			 <bean:write name="appCom" property="validDate" format="yyyy-mm-dd"/>&nbsp;
			 </td>
			  
		</tr>
		</logic:iterate>
	</table>
	</fe:span>
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="regComListForm"/></fe:bottomTable>
	</form>
  </fe:body>
</html>

