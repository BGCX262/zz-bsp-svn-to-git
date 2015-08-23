<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>管理员列表</title>
    </head>
    <fe:body>
    


    <form action="<%=baseURL%>/listPageComUser_urss.do" id="comUserListForm" method="post" name="comUserListForm">
    <fe:topTable> 
       <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initComUser_urss.do','self')" id='RegCompany_add'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/delComUser_urss.do','self')" id='RegCompany_del'>&nbsp;&nbsp;
   </fe:topTable> 
  
   <fe:span>
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
     <thead>
     <tr>
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
            <fe:tabTitle title="<b>管理用户名称</b>" column="comUserName" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            <fe:tabTitle title="<b>管理用户登陆名</b>" column="logonId" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            <fe:tabTitle title="<b>管理用户类型</b>" column="userType" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
            
        </tr>
        </thead>
        <logic:iterate name="pageList" id="comUser" scope="request">
        <bean:define name="comUser" toScope="request" id="comUserRquest"></bean:define>
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="comUser" property="comUserId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showComUser_urss.do?comUserId=<bean:write name="comUser" property="comUserId"/>','self')" >
              <bean:write name="comUser" property="comUserName"/>&nbsp;
             </a>
             </td>
             <td  >
             <bean:write name="comUser" property="logonId"/>&nbsp;
             </td>
              <td  >
              <fe:codeToName dictType="adminType" dynamic="true" name="comUserRquest" property="userType" struts="true"/>
             </td>
        </tr>
        </logic:iterate>
    </table>
    </fe:span>
    <fe:bottomTable><fe:root inputclass="formStyleall" formId="comUserListForm"/></fe:bottomTable>
    </form>
  </fe:body>
</html>

