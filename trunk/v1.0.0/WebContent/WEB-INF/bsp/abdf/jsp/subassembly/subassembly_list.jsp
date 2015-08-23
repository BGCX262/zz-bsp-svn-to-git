<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
</head>
<body>
   <table  <%=tableStyle%> width="100%">
    <tr class="ListTableHeader">
      <td colspan="4" ><div align="center" ><strong>业务/数据组件列表</strong></div></td>
    </tr>
    <tr  class=ListTableRow >
      <td colspan="4">
     
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initSubassembly_abdf.do','self')" id='dictionary_add'>&nbsp;&nbsp;
      
     </td>
    </tr>
    </table>
   
   
    <TABLE width="100%" <%=tableStyle%> align="center">
        <tr>
          
            <td align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="35%" align="center" class="ListTableHeader" nowrap="nowrap"><b>表名</b></td>
            <td width="30%" align="center" class="ListTableHeader" nowrap="nowrap"><b>业务/数据组件名称</b></td>
            
            </tr>
        <logic:iterate name="pageList" id="subassembly" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="subassembly" property="subassemblyId"/>" ></td>
            <td >
              <a href="#" onclick="buttomOnClick('<%=baseURL%>/forwardSubassemblyFrame_abdf.do?subassemblyId=<bean:write name="subassembly" property="subassemblyId"/>','self')" >
              <bean:write name="subassembly" property="tableName"/></a>
             </td>
             <td >
             <bean:write name="subassembly" property="subassemblyName"/>
             </td>
        </tr>
        </logic:iterate>
    </table>
</body>

</html>
