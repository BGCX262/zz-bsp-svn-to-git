<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>

</head>
<fe:body>
<script>
        function deleteRole()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
          alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
           document.getElementById("roleList").action="<%=baseURL%>/deleteRole_urss.do";
           document.getElementById("roleList").submit();
        }
      
    }
 
function addRole(obj) {
    buttomOnClickAdd(obj,'<%=baseURL%>/initRole_urss.do?appId=<bean:write name="app" property="appId"/>','self')
}
    </script>
    <logic:present name="app">
     <fe:topTable>
     <fe:powerTool funCode="urss_role" groupName="list"/>
    </fe:topTable>
    
     <fe:span>
      <form action="<%=baseURL%>/deleteRole_urss.do" name="roleList"  id="roleList">
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
     <thead>
        <tr>
          <input type="hidden" name="appId" value="<bean:write name="app" property="appId"/>"/>
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="75%" align="center"  nowrap="nowrap"><b>角色名称</b></td>
            
        </tr>
         </thead>
        <logic:iterate name="pageList" id="role" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox" <logic:equal value="Y" name="role" property="systemIn" >disabled</logic:equal> value="<bean:write name="role" property="roleId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showRole_urss.do?roleId=<bean:write name="role" property="roleId"/>','self')" >
              <bean:write name="role" property="roleName"/>&nbsp;
             </a>
             </td>
            
            
        </tr>
        </logic:iterate>
        
        
    
        
    </table>
    
    </form>
    
     </fe:span>
     <fe:bottomTable>(<bean:write name="app" property="appName"/>)角色列表</strong></fe:bottomTable>
     </logic:present >
</fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardRoleTree_urss.do?appId=<bean:write name="app" property="appId"/>&reloadMid=false";
         <%
      }
      %>
    </script>
</html>
