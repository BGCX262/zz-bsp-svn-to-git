<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    
    <fe:body >
    <fe:topTable>
       <fe:powerTool funCode="wfss_process_edition" groupName="list"/>
         
    </fe:topTable>

  <fe:span>
<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
    <thead>
        <tr>
           <td align="center" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="85%" align="center"  nowrap="nowrap"><b>版本名称</b></td>
            
        </tr>
    </thead>
    <logic:iterate name="listProcessEdition" id="processEdition" scope="request" >
    <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
    <td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="processEdition" property="id"/>" >&nbsp;</td>
           
              <td>
              <a href="#" onclick="buttomOnClick('<%=baseURL%>/showProcessEdition_wfss.do?id=<bean:write name="processEdition" property="id"/>','self')" >
                <bean:write name="processEdition" property="name"/>
               </a>
             </td>
            
        </tr>
        </logic:iterate>
</table>
    </fe:span>
    <fe:bottomTable>
        
    </fe:bottomTable>
</fe:body>
</html>

