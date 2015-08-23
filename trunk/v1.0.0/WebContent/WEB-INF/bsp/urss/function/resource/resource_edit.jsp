<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>    
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    <SCRIPT>
function selectCoopArea()
{
     
     var returnValue=showModalDialog("<%=baseURL%>/forwardSelectCoop_urss.do",window,'dialogHeight:360px;dialogWidth:400px;status=off');
     if(returnValue!=null){
         var returnValueArr=returnValue.split("#");
         document.getElementById("coopAreaId").value=returnValueArr[0];
         document.getElementById("coopAreaIdName").value=returnValueArr[1];
      } 
}
    </SCRIPT>
    <html>
    <table <%=tableStyle%> width="100%">
            
            <tr class=ListTableRow>
                <td colspan="4">
                
                    <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'resourceEdit',0,'urss')" id='resource_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/getAllResourceByFunId_urss.do?funModuleId=<bean:write name="ResourceForm" property="funModuleId"/>','self')" id='resource_save'>&nbsp;&nbsp;
                  <input type='button' name='power_button'  value='新增资源'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initResource_urss.do?funModuleId=<bean:write name="ResourceForm" property="funModuleId"/>','self')" id='dictionary_add'>&nbsp;&nbsp;
                   </td>
            </tr>
    </table>
    
    <table width="100%" <%=tableStyle%>>
    <html:form action="/saveResource_urss.do"   styleId="resourceEdit" method="post">
            <tr class="ListTableRow">
                <td width="16%" >资源名称：</td>
                <td width="29%">
                        <html:hidden name="ResourceForm" property="resourceId" styleId="resourceId" />
                        <html:hidden name="ResourceForm" property="funModuleId" styleId="funModuleId" />
                        <html:hidden name="ResourceForm" property="appId" styleId="appId" />
                        
                        <html:text name="ResourceForm" styleClass="formStyleall"  property="resourceName" styleId="resourceName"  size="30" /><%=red%>
                </td>
                <td width="20%">资源编号：</td>
                <td width="35%">               
                  <html:text name="ResourceForm" styleClass="formStyleall"  property="resourceCode" styleId="resourceCode"  size="30" /><%=red%>
                </td>
                </tr>
                <tr class="ListTableRow">
                <td width="16%" >分组名称：</td>
                <td width="29%">
                        <html:text name="ResourceForm" styleClass="formStyleall"  property="groupName" styleId="groupName"  size="30" />
                        
                </td>
                <td width="16%" >是否按钮：</td>
                <td width="29%">
                <html:radio name="ResourceForm"   property="isButton" value="Y">是</html:radio>
                <html:radio name="ResourceForm"   property="isButton" value="N">否</html:radio>
                
                        
                </td>
                
              </tr>
              
              <tr class="ListTableRow">    
                <td width="20%">按钮ID：</td>
                <td width="35%">               
                  <html:text name="ResourceForm" styleClass="formStyleall"  property="buttonId" styleId="buttonId"  size="30" />
                </td>
                <td width="20%">按钮样式：</td>
                <td width="35%">               
                  <html:text name="ResourceForm" styleClass="formStyleall"  property="buttonStyle" styleId="buttonStyle"  size="30"/>
                </td>
              </tr>
              
              <tr class="ListTableRow">    
                <td width="16%" >执行JS方法：</td>
                <td width="29%" colspan="1">
                    <html:text name="ResourceForm" styleClass="formStyleall"  property="implJs" styleId="implJs"  size="30" />
                </td>
                <td width="16%" >父资源：</td>
                <td width="29%" colspan="1">
                <fe:dropDown name="ResourceForm" struts="true" dictType="ResourceDict" property="parentResId" dynamic="true"/>
                </td>
              </tr>
              
               <tr class="ListTableRow">    
                <td width="16%" >实现的URL：</td>
                <td width="29%" colspan="3">
                    <html:text name="ResourceForm" styleClass="formStyleall"  property="implUrl" styleId="implUrl"  size="60" />
                </td>
              </tr>
              
               <tr class="ListTableRow">    
                <td width="20%">是否联带分配资源：</td>
                <td width="35%">
                <html:radio name="ResourceForm"   property="linkAssign" value="Y">是</html:radio>
                <html:radio name="ResourceForm"   property="linkAssign" value="N">否</html:radio>
                </td>
                <td width="20%">是否菜单显示资源：</td>
                <td width="35%">
                <html:radio name="ResourceForm"   property="isMenuDisplay" value="Y">是</html:radio>
                <html:radio name="ResourceForm"   property="isMenuDisplay" value="N">否</html:radio>
                </td>
              </tr>
              
              
                <tr class="ListTableRow">    
                <td width="20%">联带分配资源：</td>
                <td width="35%" colspan="1">
                <fe:checkBox struts="true" name="ResourceForm" dictType="ResourceDict" property="linkAssignValue" dynamic="true"/>
                &nbsp;
                </td>
                <td width="20%">分配方式：</td>
                <td width="35%">
                <html:radio name="ResourceForm"   property="assignMethod" value="display">可显示分配</html:radio>
                <html:radio name="ResourceForm"   property="assignMethod" value="hidden">只能联带分配</html:radio>
                </td>
                
                    
              </tr>
              
              
              <tr class="ListTableRow">    
                <td width="20%">所属协同区：</td>
                <td width="35%">               
                  <html:hidden name="ResourceForm" property="coopAreaId" styleId="coopAreaId" />
                  <html:text name="ResourceForm" styleClass="formStyleall"  property="coopAreaIdName" styleId="coopAreaIdName"  size="30" readonly="true"/>
                  <input type='button' name='power_button'  value='选择'   class='Button2'  onclick="selectCoopArea()" id='select_coop'>
                </td>
                <td width="20%">协同区显示名称：</td>
                <td width="35%">               
                  <html:text name="ResourceForm" styleClass="formStyleall"  property="coopItemName" styleId="coopItemName"  size="30"/>
                </td>
              </tr>
              
              <tr class="ListTableRow">    
                <td width="16%" >协同区图标：</td>
                <td width="29%" colspan="3">
                    <html:text name="ResourceForm" styleClass="formStyleall"  property="coopImg" styleId="coopImg"  size="60" />
                </td>
              </tr>
               <tr class="ListTableRow">    
                <td width="16%" >组织架构权限资源：</td>
                <td width="29%" colspan="1">
                <html:radio name="ResourceForm"   property="haveOrgRight" value="Y">是</html:radio>
                <html:radio name="ResourceForm"   property="haveOrgRight" value="N">否</html:radio>
                
                </td>
                <td width="16%" >排序号：<html:text name="ResourceForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="4" /></td>
                <td width="29%" colspan="1">
                 协同区排序号：<html:text name="ResourceForm" styleClass="formStyleall"  property="orderIndexCoop" styleId="orderIndexCoop"  size="4" />
                </td>
              </tr>
                <tr class="ListTableRow">
                <td width="16%" >是否自动收缩：</td>
                <td width="29%" colspan="1" >
                    <html:radio name="ResourceForm"   property="foldArea" value="Y">是</html:radio>
                <html:radio name="ResourceForm"   property="foldArea" value="N">否</html:radio>
                </td>
                
                <td width="16%" >关联流程：</td>
                <td width="29%" colspan="1" >
                <html:text name="ResourceForm" styleClass="formStyleall"  property="processInfo" styleId="processInfo"  size="30" />
                </td>
                
              </tr>
              </html:form>
    </table>
    
</html>

