<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
       function deleteOrgUer() {
             var usersTableTBodyObj = document.getElementById("usersTableTBody");
        usersTableTBodyObj.removeChild(event.srcElement.parentElement.parentElement);
       }
    </script>
    </head>
    <fe:body moduleName="urss" formId="UserEdit">
    <fe:topTable>
       <fe:powerTool funCode="urss_use_mrg" groupName="urss_user_edit" />    
    </fe:topTable>
    <fe:span>
    <br />
        <center>
            <font size=4><b>用户管理</font>
        </center>
        <br />
        <html:form action="/saveUser_urss.do"   styleId="UserEdit" method="post" >
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
                            <table cellspacing="0" cellpadding="3" width="96%" class="tform" align=center>
                            <tr>
    <td width="16%" >增加身份:</td>
                    <td width="29%" colspan="3">
                    <input type="checkbox" name="addUser"  value="" id="addUser">
                    </td>
                    </tr>
                 <tr >
                    <td width="16%" >身份/组织信息：</td>
                    <td width="29%" colspan="3">
                    <table width="100%" cellpadding="0" cellspacing="0" id="usersTable" border="0">
                     <tbody id="usersTableTBody">
                    <input type="hidden" name="deleteUserIds" value="" id="deleteUserIds">
                    <logic:present name="orgList">
                    
                       <logic:notEmpty name="orgList">
                          <logic:iterate name="orgList" id="org">
                             <tr><td>
                             <input type="hidden" name="orgId" value="<bean:write name="org" property="orgId"/>" id="orgId">
                             <bean:write name="org" property="allParentName"/><br>
                             </td></tr>
                          </logic:iterate>
                       </logic:notEmpty>
                    </logic:present>
                    </tbody>
                    </table>
                    </td>
                    
                  </tr>
                  <tr class="ListTableRow">
                    <td width="16%" ><span id="userName_span">用户名:</span></td>
                    <td width="29%" colspan="1">
                        <html:hidden name="UserForm" property="userId" styleId="userId" />
                    <html:text name="UserForm" styleClass="formStyleall"  property="userName" styleId="userName"  size="30" readonly="true"/>
                    </td>
                    
                    <td width="16%" ><span id="loginId_span">登陆名:</span></td>
                    <td width="29%" colspan="1">
                    <html:text name="UserForm" styleClass="formStyleall"  property="loginId" styleId="loginId"  size="30" />
                    </td>
                  </tr>
                   <tr class="ListTableRow">
                    <td width="16%" ><span id="pwd_span">密码:</span></td>
                    <td width="29%" colspan="1">
                    <input type="hidden" name="pwdOld" value="<bean:write name="UserForm" property="pwd"/>" id="pwdOld">
                        <html:password name="UserForm" styleClass="formStyleall"  property="pwd" styleId="pwd"  size="30" ></html:password>
                    </td>
                    
                    <td width="16%" ><span id="userEmail_span">邮箱:</span></td>
                    <td width="29%" colspan="1">
                    <html:text name="UserForm" styleClass="formStyleall"  property="userEmail" styleId="userEmail"  size="30" />
                    </td>
                  </tr>
                  
                  <tr class="ListTableRow">
                    <td width="16%" ><span id="userFixdTel_span">固定电话:</span></td>
                    <td width="29%" colspan="1">
                    <html:text name="UserForm" styleClass="formStyleall"  property="userFixdTel" styleId="userFixdTel"  size="30" />
                    </td>
                    <td width="16%" ><span id="userMoveTel_span">移动电话:</span></td>
                    <td width="29%" colspan="1">
                    <html:text name="UserForm" styleClass="formStyleall"  property="userMoveTel" styleId="userMoveTel"  size="30" />
                    </td>
                  </tr>
                 
        </table>
         </div>
        
                         </div>
                 </td>
            </tr>
        </table>
         </html:form>
    </fe:span>
    <fe:bottomTable>
        <strong>
            <logic:notEmpty name="UserForm" property="userId">修改用户</logic:notEmpty> 
            <logic:empty name="UserForm" property="userId">新增用户</logic:empty> 
       </strong>
    </fe:bottomTable>
    
    </fe:body>
</html>


