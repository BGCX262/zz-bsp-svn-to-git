<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
      
    <script>
 

function displayUserOrgPage()
{
   var roleId = document.getElementById("roleId").value;
   if ("" == roleId) {
      alert("请选保存角色");
      return;
   }
   else {
      location.href="<%=baseURL%>/listRoleOrgByRoleId_urss.do?roleId=<bean:write name="RoleForm" property="roleId"/>";
   }
}
    </script>
    </head>
    <html>
    <fe:body moduleName="urss" formId="RoleEdit" prompt="true">
     <fe:topTable width="100%">
            <fe:powerTool funCode="urss_role" groupName="edit"/>
            </fe:topTable>
         <fe:span >
     <br />
        <center>
            <font size=4><b>角色管理</font>
        </center>
        <br />
         <html:form action="/saveRole_urss.do"   styleId="RoleEdit" method="post"> 
    <table border="0" width="80%" align="center">
    <tr>
        <td>
        <div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
        <div class="tab-page" id="tabPage2">
            <h2 class="tab">基本信息</h2>
            <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
    <table cellspacing="0" cellpadding="3" width="90%" class="tform" align=center>
            
              <tr >
                <td width="15%" ><span id = "roleName_span">角色名称：</td>
                <td width="85%" colspan="1">
                 <html:hidden name="RoleForm" property="appId" styleId="appId" />
                  <html:hidden name="RoleForm" property="comId" styleId="comId" />
                  <html:hidden name="RoleForm" property="roleId" styleId="roleId" />
                   <html:hidden name="RoleForm" property="systemIn" styleId="systemIn" />
                   <html:hidden name="RoleForm" property="roleCode" styleId="roleCode" />
                     <html:text name="RoleForm" styleClass="formStyleall"  property="roleName" styleId="roleName"  size="30" />
                </td>
                
                
              </tr>
             
    </table>
    
    
    
    <script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardRoleTree_urss.do?appId=<bean:write name="RoleForm" property="appId"/>&reloadMid=false";
         <%
      }
      %>
    </script>
        </div>
        </td>
    </tr>
</table>
 </html:form>
 </fe:span>
<fe:bottomTable>
    <strong>
        <logic:notEmpty name="RoleForm" property="roleId">修改角色</logic:notEmpty> 
        <logic:empty name="RoleForm" property="roleId">新增角色</logic:empty> 
</strong>
</fe:bottomTable>

</fe:body>
</html>


