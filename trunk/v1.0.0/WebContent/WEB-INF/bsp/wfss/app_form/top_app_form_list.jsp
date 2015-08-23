<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<script type="text/javascript" language="javascript">
function addForm(obj) {
    buttomOnClickAdd(this,'<%=baseURL%>/initAppForm_wfss.do?appId=<bean:write name="app" property="appId"/>','self');
}
function  gotoMrgForm(){
 var num = getCheckBoxNum("itemIdCheckBox");
 if (num==0) {
   alert("请选择一个表单");
   return;
 }
 else if (num>1){
    alert("只能选择一个表单");
    return;
 }
 location.href="<%=baseURL%>/getFormFieldByFormId_wfss.do?appFormId="+getCheckBoxObj("itemIdCheckBox").value;
}
</script>
</head>
<fe:body>
<fe:topTable>
    <fe:powerTool funCode="wfss_form_mrg" groupName="list"/>
</fe:topTable>
         
   <form action="<%=baseURL%>/queryPageAppForm_wfss.do" id="appFormListForm" method="appForm" name="appFormListForm" style="margin: 0">
   <fe:span>
 
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
    <thead>
        <tr>
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="30%" align="center"  nowrap="nowrap"><b>表单名称</b></td>
            <td width="40%" align="center"  nowrap="nowrap"><b>表单编码</b></td>
            <td width="25%" align="center"  nowrap="nowrap"><b>所属版本</b></td>
        </tr>
        </thead>
        <logic:iterate name="pageList" id="appForm" scope="request" >
        <bean:define name="appForm" toScope="request" id="appFormRquest"></bean:define>
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="appForm" property="appFormId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showAppForm_wfss.do?appFormId=<bean:write name="appForm" property="appFormId"/>','self')" >
              <bean:write name="appForm" property="appFormName"/>&nbsp;
             </a>
             </td>
             <td>
             <bean:write name="appForm" property="appFormCode"/>&nbsp;
             </td>
             <td>
             <a href="#" onclick="buttomOnClick('<%=baseURL%>/showProcessEdition_wfss.do?id=<bean:write name="appForm" property="editionId"/>','parent')" >
              
                <fe:codeToName dictType="wfssProcessEditionDict" dynamic="true" name="appFormRquest" property="editionId" scope="request"/>
                </a>
             </td>

              
        </tr>
        </logic:iterate>
    </table>
    
    
    </fe:span>
    <fe:bottomTable><strong>表单定义列表</strong></fe:bottomTable> 
    </form>
</fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/bsp/wfss/app_form/app_form_tree.jsp?reloadMid=false";
         <%
      }
      %>
    </script>
</html>
