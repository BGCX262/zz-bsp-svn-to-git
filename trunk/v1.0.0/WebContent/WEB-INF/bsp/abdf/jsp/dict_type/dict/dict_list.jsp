<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>管理员列表</title>
    </head>
    <fe:body>
    


     <form action="<%=baseURL%>/listDict_abdf.do" id="dictListForm" method="post" name="DictForm" style="" id="DictForm">
    <fe:topTable> 
        <input type="hidden" value="<bean:write name="dictTypeCode"/>" name="dictTypeCode">
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initDict_abdf.do?dictTypeId=<bean:write name="dictTypeId"/>','self')" id='Dict_add'>&nbsp;&nbsp;
      <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deleteDict.do','self','itemIdCheckBox')" id='Dict_del'>&nbsp;&nbsp;
   </fe:topTable> 
  
   <fe:span>
    <TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
    <thead>
    <tr>
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="35%" align="center"  nowrap="nowrap"><b><strong><bean:write name="dictTypeName"/>值</b></td>
            <td width="30%" align="center"  nowrap="nowrap"><b><strong><bean:write name="dictTypeName"/>别名</b></td>
            <td width="30%" align="center"  nowrap="nowrap"><b>状态</b></th>
            
        </tr>
    </thead>
        <logic:iterate name="pageDate" id="dict" scope="request" >
        <bean:define name="dict" toScope="request" id="dictRquest"></bean:define>
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="dict" property="dictId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showDict_abdf.do?dictId=<bean:write name="dict" property="dictId"/>','self')" >
              <bean:write name="dict" property="dictValue"/>&nbsp;
             </a>
             </td>
             <td>
              <bean:write name="dict" property="dictAlias"/>&nbsp;
             </td>
              <td>
             <logic:equal name="dict" property="isUse" value="Y">启用</logic:equal>
              <logic:equal name="dict" property="isUse" value="N">停用</logic:equal>
              &nbsp;
             </td>
             
        </tr>
        </logic:iterate>
        
    </table>
    </fe:span>
    <fe:bottomTable><fe:root inputclass="formStyleall" formId="DictForm"/></fe:bottomTable>
    </form>
  </fe:body>
</html>

