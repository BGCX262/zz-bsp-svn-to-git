<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    <html> 
   <table <%=tableStyle%> width="100%">
            <tr class="ListTableHeader">
                <td colspan="4">
                    <div align="center">
                            <strong>
                            <logic:notEmpty name="ExpressionForm" property="expId">修改表达式</logic:notEmpty> 
                            <logic:empty name="ExpressionForm" property="expId">新增表达式</logic:empty> 
                             </strong>
                    </div>
                </td>
            </tr>
    </table>    
<table border="0" width="96%" align="center">
    <tr>
        <td>
            
    <table <%=tableStyle%> width="96%">
            <tr class=ListTableRow>
                <td colspan="4">
                    <input type='button' name='power_button'  value='保存表达式'   class='Button3'  onclick="submitForm(this,'ExpressionForm',0,'wfss')" id='process_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/listExpression_wfss.do?expType= <bean:write name="ExpressionForm" property="expType"/>','self')" id='process_save'>&nbsp;&nbsp;
                   </td>
            </tr>
    </table>
    
    <table width="96%" <%=tableStyle%>>
    <html:form action="/saveExpression_wfss.do"   styleId="ExpressionForm" method="post">
             <tr class="ListTableRow">
                <td width="15%" >表达式名称：</td>
                <td width="35%" colspan="3" >
                  <html:hidden name="ExpressionForm" property="expId" styleId="expId"/>
                 
                  <html:hidden name="ExpressionForm" property="expType" styleId="expType"/>
                  <html:text name="ExpressionForm" styleClass="formStyleall"  property="expName" styleId="expName"  size="60" />
                </td>
                
            
                
              </tr>
              
            
              
              
             <tr class="ListTableRow">
                <td width="15%" >表达式用途分类：</td>
                <td width="35%">
                <logic:equal name="ExpressionForm" property="expType" value="JAVA">
                    <html:select name="ExpressionForm" property="expUseType" styleId="expUseType"> 
                    <html:option value=" ">请选择</html:option>
                    <html:option value="JAVA_0">流程启动前</html:option>
                    <html:option value="JAVA_1">流程结束前</html:option>
                    <html:option value="JAVA_2">活动启动前</html:option>
                    <html:option value="JAVA_3">活动启动后</html:option>
                 </html:select>
                </logic:equal>
                
                
                <logic:equal name="ExpressionForm" property="expType" value="JS">
                   <html:select name="ExpressionForm" property="expUseType" styleId="expUseType"> 
                    <html:option value=" ">请选择</html:option>
                     <html:option value="JS_0">流程启动前</html:option>
                     <html:option value="JS_1">选路由前</html:option>
                     <html:option value="JS_2">打开业务之前</html:option>
                     <html:option value="JS_3">提交活动之前</html:option>
                 </html:select>
                </logic:equal>
                
                <%=red%>
                </td>
                <td width="15%" >所属系统：</td>
                <td width="35%">
                
                  <fe:dropDown struts="true" dictType="app" property="appId" name="ExpressionForm" dynamic="true" onchange="Control_LinkDropDown(this,'appFormId','appForm')"/><%=red%>
                </td>
              </tr>
              
               <tr class="ListTableRow">
                <td width="15%" >所属业务表单：</td>
                <td width="35%" colspan="3" >
                <fe:dropDown struts="true" dictType="appForm" property="appFormId" name="ExpressionForm" dynamic="true"/><%=red%>
                </td>
                
            
                
              </tr>
              
              
              <tr class="ListTableRow">
                <td width="15%" >表达式内容：<%=red%></td>
                <td width="35%" colspan="3">
                <logic:equal name="ExpressionForm" property="expType" value="JS">
                <html:textarea property="expContent" name="ExpressionForm" style="width:100%" rows="6"></html:textarea>
                    </logic:equal>
                    
                    <logic:equal name="ExpressionForm" property="expType" value="JAVA">
                     <html:text name="ExpressionForm" styleClass="formStyleall"  property="expContent" styleId="expContent"  size="60" />
                    </logic:equal>
                    
                 </td>
                
              </tr>
              
              
              
              </html:form>
        </table>
        </td>
    </tr>
</table>
    
</html>

