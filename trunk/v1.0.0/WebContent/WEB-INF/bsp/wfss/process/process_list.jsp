<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>
<fe:body>
<fe:topTable>
<fe:powerTool funCode="wfss_process_mrg" groupName="process_list"/>
</fe:topTable>
<form action="<%=baseURL%>/queryPageProcess_wfss.do" id="processListForm" method="process" name="processListForm" style="margin: 0">
   <fe:span>
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
    <thead>
        <tr>
            <td align="center" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="30%" align="center" nowrap="nowrap"><b>流程名称</b></td>
            <td width="25%" align="center" nowrap="nowrap"><b>流程别名</b></td>
            <td width="20%" align="center" nowrap="nowrap"><b>启动状态</b></td>
            <td width="25%" align="center"  nowrap="nowrap"><b>所属版本</b></td>
        </tr>
        </thead>
        <logic:iterate name="pageList" id="process" scope="request" >
        <bean:define name="process" toScope="request" id="processRequest"></bean:define>
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="process" property="processId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/forwardProcessEditFrame_wfss.do?processId=<bean:write name="process" property="processId"/>','self')" >
              <bean:write name="process" property="processName"/>&nbsp;
             </a>
             </td>
             <td>
             <bean:write name="process" property="processAlias"/>&nbsp;
             </td>
             <td>
              <logic:equal name="process" property="isUsed" value="Y">启用</logic:equal>
               <logic:equal name="process" property="isUsed" value="N">停用</logic:equal>
             </td>
             <td>
             <a href="#" onclick="buttomOnClick('<%=baseURL%>/showProcessEdition_wfss.do?id=<bean:write name="processRequest" property="editionId"/>','self')" >
              
                <fe:codeToName dictType="wfssProcessEditionDict" dynamic="true" name="processRequest" property="editionId" scope="request"/>
                </a>
             </td>
        </tr>
        </logic:iterate>
    </table>
    
    </fe:span>
    </form>
<fe:bottomTable><strong>流程定义列表</strong></fe:bottomTable> 
</fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardProcessTree_wfss.do";
         <%
      }
      %>
    </script>
</html>
