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
       <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initRegCompany_urss.do','self')" id='RegCompany_add'>&nbsp;&nbsp;
      <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/delDictionaryType_urss.do','self')" id='RegCompany_del'>&nbsp;&nbsp;
   </fe:topTable> 
  
   <fe:span>
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
        <thead>
        <tr>
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
            <fe:tabTitle title="<b>公司名称</b>" column="regComName" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            <fe:tabTitle title="<b>公司编号</b>" column="regComCode" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            <fe:tabTitle title="<b>公司法人</b>" column="regComBoss" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            <fe:tabTitle title="<b>公司Eamil</b>" column="regComEmail" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            <fe:tabTitle title="<b>用户类型</b>" column="captil" width="15%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
    
        </tr>
        </thead>
        <logic:iterate name="pageList" id="regCom" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="regCom" property="regComId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showRegCompany_urss.do?regComId=<bean:write name="regCom" property="regComId"/>','self')" >
              <bean:write name="regCom" property="regComName"/>&nbsp;
             </a>
             </td>
             <td  >
             <bean:write name="regCom" property="regComCode"/>&nbsp;
             </td>
             
             <td  >
             <bean:write name="regCom" property="regComBoss"/>&nbsp;
             </td>
              <td  >
             <bean:write name="regCom" property="regComEmail"/>&nbsp;
             </td>
              <td  >
              <logic:equal name="regCom" property="userType" value="0">永久用户</logic:equal>
              <logic:equal name="regCom" property="userType" value="1">注册用户</logic:equal>
              <logic:equal name="regCom" property="userType" value="2">试用用户</logic:equal>
              <logic:equal name="regCom" property="userType" value="3">未审批用户</logic:equal>
              &nbsp;
             </td>
        </tr>
        </logic:iterate>
    </table>
    </fe:span>
    <fe:bottomTable><fe:root inputclass="formStyleall" formId="regComListForm"/></fe:bottomTable>
    </form>
  </fe:body>
</html>

