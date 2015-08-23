<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>
<fe:body>
<script>
<%String moduleName=request.getAttribute("moduleName") == null ?"":(String)request.getAttribute("moduleName");%>
function addDict(obj) {
   buttomOnClickAdd(obj,'<%=baseURL%>/initDictType_abdf.do?moduleName=<%=moduleName%>','self');
}
function delDict(obj) {
buttomOnClickDel(obj,'<%=baseURL%>/deleteDictType_abdf.do?moduleName=<%=moduleName%>','self');
}
</script>
 
<fe:topTable>

     <fe:powerTool funCode="abdf_dict" groupName="list"/>
   </fe:topTable>
     

   <fe:span>
    <form name="DictTypeForm" method="post" action="<%=baseURL%>/deleteDictType_abdf.do" id="dictTypeEdit" style="margin: 0">
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
    
      <thead>
      <tr>
            <input type="hidden" name="moduleName" value="<%=moduleName%>" id="moduleName">
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="35%" align="center"  nowrap="nowrap"><b>字典类型代码</b></td>
            <td width="30%" align="center"  nowrap="nowrap"><b>字典类型名称</b></td>
            <td width="30%" align="center"  nowrap="nowrap"><b>所属模块</b></td>
            </tr>
     </thead>
        <logic:iterate name="pageList" id="dictType" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="dictType" property="dictTypeId"/>" ></td>
            <td >
              <a href="#" onclick="buttomOnClick('<%=baseURL%>/showDictType_abdf.do?dictTypeId=<bean:write name="dictType" property="dictTypeId"/>&moduleName=<%=moduleName%>','self')" >
              <bean:write name="dictType" property="dictTypeCode"/></a>
             </td>
             <td >
             <bean:write name="dictType" property="dictTypeName"/>
             </td>
             <td >
             <bean:write name="dictType" property="moduleName"/>
             </td>
        </tr>
        </logic:iterate>
    </table>
    </form>
    </fe:span>
    <fe:bottomTable><strong>数据字典列表</strong></fe:bottomTable>
</fe:body>
<script>
<%String treeRefresh=(String)request.getAttribute("treeRefresh");
   if(treeRefresh!=null&&treeRefresh.equals("true"))
   {
     %>
       parent.left.location.reload();
     <%
   }
%>    
</script>
</html>
