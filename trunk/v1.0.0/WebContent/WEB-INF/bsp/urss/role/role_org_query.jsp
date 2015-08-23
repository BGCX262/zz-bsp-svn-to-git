<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<title>
角色人员查询
</title>
</head>
<body style="overflow:hidden" onbeforeunload='giveTheReturnValue()'>
<script>
function giveTheReturnValue()
{
   var isUpdate=document.getElementById("isUpdate").value;
   if(isUpdate=='true')
       returnValue=true;
   else
    returnValue=false;
}

function selectOrg()
    {
       orgVo=new OrgVo();
       orgVo.setOrgId("<%=WebHelper.getTopOrgId(session,"GS")%>"); //根节点id设置 
       orgVo.setOrgName("<%=WebHelper.getTopOrgName(session,"GS")%>");//根节点名称设置 
       orgVo.setOrgType("GS");//根节组织架构类型 
       orgVo.setSelectOrgType("!YG");//设置可以选择的组织架构类型 
       var parentIdObj=document.getElementById("parentId");
       var parentNameObj=document.getElementById("parentName");
       var parentOrgTypeObj=document.getElementById("parentOrgType");
       
       if(parentIdObj.value!='')
       {
         var orgVoExist=new OrgVo();
         orgVoExist.setOrgId(parentIdObj.value);
         orgVoExist.setOrgName(parentNameObj.value);
         orgVoExist.setOrgType(parentOrgTypeObj.value);
         orgVo.getSubOrgVos()[0]=orgVoExist;
       }
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
       if(returnValue==null) return ;
       var subOrgList=orgVo.getSubOrgVos();
       if(subOrgList.length==0)
       {
          parentIdObj.value="";
          parentNameObj.value="";
          parentOrgTypeObj.value="";
       }
       else
       {
          parentIdObj.value=subOrgList[0].getOrgId();
          parentNameObj.value=subOrgList[0].getOrgName();
          parentOrgTypeObj.value=subOrgList[0].getOrgType()
       }
        
    }
function queryOrg()
{
   var orgNameObj=document.getElementById("orgName");
   var orgQueryCodeObj=document.getElementById("orgQueryCode");
   var parentIdObj=document.getElementById("parentId");
   if(Trim(orgNameObj.value)==''&&Trim(orgQueryCodeObj.value)==''&&parentIdObj.value=='')
   {
      var messContent="<div style='padding:20px 0 20px 0;text-align:center'>三个条件中必须填写一个</div>"
      showMessageBoxCenter('提示',messContent,350);
      return;
   }
   var formObj=document.getElementById("queryOrgForm");
   formObj.action="<%=baseURL%>/queryRoleOrg_urss.do";
   formObj.submit();
 }    

function delRoleOrg()
{
   var num=getCheckBoxNum("addOrg");
   if(num==0)
   {
       var messContent="<div style='padding:20px 0 20px 0;text-align:center'>请在已新增用户栏中至少选择一项进行删除！</div>"
      showMessageBoxCenter('提示',messContent,350);
      return;
   }
   var formObj=document.getElementById("queryOrgForm");
   formObj.action="<%=baseURL%>/deleteRoleOrgFormQuery_urss.do";
   formObj.submit();
}    
function addRoleOrg()
{
   var num=getCheckBoxNum("notAddOrg");
   if(num==0)
   {
       var messContent="<div style='padding:20px 0 20px 0;text-align:center'>请在未新增用户栏中至少选择一项进行新增！</div>"
      showMessageBoxCenter('提示',messContent,350);
      return;
   }
   var formObj=document.getElementById("queryOrgForm");
   formObj.action="<%=baseURL%>/addRoleOrgFormQuery_urss.do";
   formObj.submit();
}        

function selectParentAll()
{
   var allChild=event.srcElement.parentElement.children;
   for(var i=0;i<allChild.length;i++)
   {
      if(allChild[i].type='checkbox')
      {
         allChild[i].checked=event.srcElement.checked;
      }
   }
}
</script>
   <form id="queryOrgForm" action="<%=baseURL%>/queryRoleOrg_urss.do" target="queryReturnWin" method="post">
   <table  <%=tableStyle%> width="100%">
    <tr  class=ListTableRow >
      <td colspan="4">
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="addRoleOrg()" id='role_add'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="delRoleOrg()" id='RegCompany_del'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='查询'   class='Button3'  onclick="queryOrg()" id='RoleEdit_move'>&nbsp;&nbsp; 
        <input type='button' name='power_button'  value='关闭'   class='Button3'  onclick="javascript:window.close()" id='RoleEdit_move'>&nbsp;&nbsp;     
     </td>
    </tr>
    <tr class="ListTableRow">
                <td width="15%" >用户姓名：<iframe id="queryReturnWin" name="queryReturnWin" src="" style="display:none"></iframe></td>
                <td width="35%" colspan="1">
                     <input type="hidden" name="isUpdate" id="isUpdate" value="false"/>
                     <input type="text" name="orgName" size="30" value="" id="orgName" class="formStyleall">
                </td>
                
                <td width="15%" >查询码：</td>
                <td width="35%" colspan="1">
                 <input type="text" name="orgQueryCode" size="30" value="" id="orgQueryCode" class="formStyleall" >
                </td>
              </tr>
      <tr class="ListTableRow">
                <td width="15%" >所属组织：</td>
                <td width="35%" colspan="3">
                     <input type="hidden" name="parentId" id="parentId" value=""/>
                     <input type="hidden" name="parentOrgType" id="parentOrgType" value=""/>
                     <input type="text" name="parentName" size="60" value="" id="parentName" class="formStyleall" readonly="true">
                     <input type='button' name='power_button'  value='选择'   class='Button3' onclick="selectOrg()">
                </td>
                
                
        </tr>
    
    </table>
    
    <table border="0" width="96%" align="center">
    <tr>
        <td>
        <div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
        <div class="tab-page" id="tabPage2" style="height:350" style="overflow:auto">
        <h2 class="tab">未新增用户</h2>
        <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
           <TABLE width="100%" <%=tableStyle%> align="center">
         <tbody id="notAddToRloeTbody">
        <tr>
             
             <input type="hidden" name="roleId" id="rloeId" value="<%=request.getParameter("roleId")%>">
            <th align="center" class="ListTableHeader" width="10%">操作</th>
            <th width="70%" align="center" class="ListTableHeader" nowrap="nowrap"><b>所属组织</b></th>
            <th width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b>用户名</b></th>
            
        </tr>
        </notAddToRloeTbody>
        
    </table>
        </div>
        <div class='tab-page' id='tabPage5' style="height:350" style="overflow:auto">
        <h2 class='tab'>已新增用户</h2>
        <script type="text/javascript">tp1.addTabPage( document.getElementById( 'tabPage5' ));</script>
         <TABLE width="100%" <%=tableStyle%> align="center">
        <tbody id="addToRloeTbody">
        <tr>
             
             <input type="hidden" name="roleId" id="rloeId" value="<%=request.getAttribute("roleId")%>">
            <th align="center" class="ListTableHeader" width="10%">操作</th>
            <th width="50%" align="center" class="ListTableHeader" nowrap="nowrap"><b>所属组织</b></th>
            <th width="15%" align="center" class="ListTableHeader" nowrap="nowrap"><b>用户名</b></th>
            <th width="13%" align="center" class="ListTableHeader" nowrap="nowrap"><b>创立人</b></th>
            <th width="12%" align="center" class="ListTableHeader" nowrap="nowrap"><b>创立时间</b></th>
        </tr>
       </tbody>
    </table>
        </div>
        </div>
        </td>
    </tr>
</table>
</form>

    
</body>

</html>
