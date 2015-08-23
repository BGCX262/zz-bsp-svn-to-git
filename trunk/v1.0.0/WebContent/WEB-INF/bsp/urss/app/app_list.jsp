<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>管理员列表</title>
    </head>
    <fe:body>
    


    <form name="AppForm" method="post" action="<%=baseURL%>/deleteApp_urss.do" id="appEdit">
    <fe:topTable> 
       <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initApp_urss.do','self')" id='dictionary_add'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='删除'  class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deleteApp_urss.do','self','itemIdCheckBox')" id='dictionary_del'>&nbsp;&nbsp;
   </fe:topTable> 
  
   <fe:span>
    <TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
     <thead>
        <tr>
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
            <td width="15%" align="center"  nowrap="nowrap"><b>应用编码</b></td>
            <td width="20%" align="center" nowrap="nowrap"><b>应用名称</b></td>
            <td width="10%" align="center"  nowrap="nowrap"><b>应用状态</b></td>
            <td width="15%" align="center" nowrap="nowrap"><b>应用类型</b></td>
            <td width="30%" align="center"  nowrap="nowrap"><b>应用地址</b></td>
        </tr>
        </thead>
        <logic:iterate name="pageList" id="app" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="app" property="appId"/>" ></td>
            <td >
              <a href="#" onclick="buttomOnClick('<%=baseURL%>/showApp_urss.do?appId=<bean:write name="app" property="appId"/>','self')" >
              <bean:write name="app" property="appCode"/></a>
             </td>
             <td >
                <bean:write name="app" property="appName"/>&nbsp;
             </td>
             <td >
                <logic:equal name="app" property="status" value="0">开发</logic:equal>
                <logic:equal name="app" property="status" value="1">测试</logic:equal>
                <logic:equal name="app" property="status" value="2">试用</logic:equal>
                <logic:equal name="app" property="status" value="3">上线</logic:equal>&nbsp;
             </td>
              <td >
               <bean:write name="app" property="appType"/>&nbsp;
              
             </td>
             <td >
                <bean:write name="app" property="appAddress"/>&nbsp;
             </td>
        </tr>
        
        </logic:iterate>
        
    </table>
    </fe:span>
    <fe:bottomTable>应用管理列表</fe:bottomTable>
    </form>
  </fe:body>
</html>

