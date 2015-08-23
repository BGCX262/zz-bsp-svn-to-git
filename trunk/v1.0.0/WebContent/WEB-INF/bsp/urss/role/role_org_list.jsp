<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>

</head>
<fe:body>
<script>
     var orgVo=null;
    function selectRoleOrg()
    {
       orgVo=new OrgVo();
       orgVo.setOrgId("<%=WebHelper.getTopOrgId(session,"GS")%>"); //根节点id设置 
       orgVo.setOrgName("<%=WebHelper.getTopOrgName(session,"GS")%>");//根节点名称设置 
       orgVo.setOrgType("GS");//根节组织架构类型 
       orgVo.setSelectOrgType("YG");//设置可以选择的组织架构类型 
       orgVo.setSize(0);
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
       if(returnValue==null) return ;
       var subOrgList=orgVo.getSubOrgVos();
       var ids="";
        for(var i=0;i<subOrgList.length;i++)
        {
            var valueObj=subOrgList[i];
            ids=ids+valueObj.getOrgId()+",";
        }
        if(ids!="")
        {
          ids=ids.substring(0,ids.length-1);
        }
        document.getElementById("selectOrgId").value=ids;
        var RoleOrgFormObj=document.getElementById("RoleOrgForm");
        RoleOrgFormObj.action="<%=baseURL%>/saveRoleOrg_urss.do";
        RoleOrgFormObj.submit();
    }
    
    function deleteRoleOrg()
    {
       var num=getCheckBoxNum("itemIdCheckBox");
       if(num==0)
       {
          alert("请选择一项进行删除!")
          return;
       }
        var RoleOrgFormObj=document.getElementById("RoleOrgForm");
        RoleOrgFormObj.action="<%=baseURL%>/deleteRoleOrg_urss.do";
        RoleOrgFormObj.submit();
    }
    function openRoleOrgQuery()
    {
       var returnValue=showModalDialog('<%=baseURL%>/forwardRoleOrgQuery_urss.do?roleId=<%=request.getAttribute("roleId")%>', window,'dialogHeight:500px;dialogWidth:650px;status=off');
       if(returnValue)
       {
          location.href="<%=baseURL%>/listRoleOrgByRoleId_urss.do?roleId=<%=request.getAttribute("roleId")%>"
       }
    }
</script>
    <fe:topTable>
         
           <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="selectRoleOrg()" id='role_add'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='查询'   class='Button3'  onclick="openRoleOrgQuery()" id='RoleEdit_move'>&nbsp;&nbsp;
      
       <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="deleteRoleOrg()" id='RegCompany_del'>&nbsp;&nbsp;
        管理<b><bean:write name="role" property="roleName"/></b>下用户
         </fe:topTable>
     <fe:span>
      <form name="RoleOrgForm" id="RoleOrgForm" action="<%=baseURL%>/listRoleOrgByRoleId_urss.do" method="post">
    <TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
       <thead>
        <tr>
             <input type="hidden" name="selectOrgId" id="selectOrgId">
             <input type="hidden" name="roleId" id="rloeId" value="<%=request.getAttribute("roleId")%>">
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="35%" align="center"  nowrap="nowrap"><b>所属组织</b></td>
            <td width="20%" align="center"  nowrap="nowrap"><b>用户名</b></td>
            <td width="20%" align="center"  nowrap="nowrap"><b>创立人</b></td>
            <td width="20%" align="center"  nowrap="nowrap"><b>创立时间</b></td>
        </tr>
         </thead>
        <logic:iterate name="pageList" id="roleOrg">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox" <logic:equal value="Y" name="roleOrg" property="systemIn" >disabled</logic:equal>  value="<bean:write name="roleOrg" property="roleOrgId"/>" ></td>
            <td >
             <bean:write name="roleOrg" property="allParentName"/>
             </td>
             <td>
             <bean:write name="roleOrg" property="orgName"/>
             </td>
             <td>
             <bean:write name="roleOrg" property="createName"/>
            
             </td>
             <td>
             <bean:write name="roleOrg" property="createTime" format="yyyy-MM-dd"/>
             </td>
            
        </tr>
        </logic:iterate>
        
        
    
    </table>
    </fe:span>
    <fe:bottomTable><fe:root inputclass="formStyleall" formId="RoleOrgForm"/></fe:bottomTable>
    
        
    </form>
    
</fe:body>

</html>
