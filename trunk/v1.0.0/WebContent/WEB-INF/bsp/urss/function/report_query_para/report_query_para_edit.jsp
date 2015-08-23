<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>    
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
   
    <html>
    <table <%=tableStyle%> width="100%">
            
            <tr class=ListTableRow>
                <td colspan="4">
                
                    <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'reportQueryParaEdit',0,'urss')" id='reportQueryPara_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/getAllReportQueryParaByFunId_urss.do?funModuleId=<bean:write name="ReportQueryParaForm" property="funModuleId"/>','self')" id='reportQueryPara_save'>&nbsp;&nbsp;
                  <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initReportQueryPara_urss.do?funModuleId=<bean:write name="ReportQueryParaForm" property="funModuleId"/>','self')" id='dictionary_add'>&nbsp;&nbsp;
                   </td>
            </tr>
    </table>
    
    <table width="100%" <%=tableStyle%>>
    <html:form action="/saveReportQueryPara_urss.do"   styleId="reportQueryParaEdit" method="post">
            <tr class="ListTableRow">
                <td width="15%" >查询字段名称：</td>
                <td width="35%">
                        <html:hidden name="ReportQueryParaForm" property="id" styleId="id" />
                        <html:hidden name="ReportQueryParaForm" property="funModuleId" styleId="funModuleId" />
                        
                        
                        <html:text name="ReportQueryParaForm" styleClass="formStyleall"  property="name" styleId="name"  size="30" /><%=red%>
                </td>
                <td width="15%">查询字段编号：</td>
                <td width="35%">               
                  <html:text name="ReportQueryParaForm" styleClass="formStyleall"  property="paraKey" styleId="paraKey"  size="30" /><%=red%>
                </td>
                </tr>
                <tr class="ListTableRow">
                <td width="15%" >输入框类型：</td>
                <td width="35%">
                  <html:radio name="ReportQueryParaForm"   property="inputType" value="text">文本框</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="inputType" value="radio">单选框</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="inputType" value="select">下拉框</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="inputType" value="checkBox" disabled="true">多选框</html:radio>
                        
                </td>
                <td width="15%" >数据类型：</td>
                <td width="35%">
                  <html:radio name="ReportQueryParaForm"   property="dataType" value="string">字符</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="dataType" value="num">数字</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="dataType" value="date">日期</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="dataType" value="datetime">日期时间</html:radio>   
                </td>
                
              </tr>
              
              <tr class="ListTableRow">    
                <td width="15%">是否必须：</td>
                <td width="35%">
                  <html:radio name="ReportQueryParaForm"   property="notNull" value="Y">是</html:radio>
                  <html:radio name="ReportQueryParaForm"   property="notNull" value="N">否</html:radio>
                
                 
                </td>
                <td width="15%">字段名称：</td>
                <td width="35%">               
                  <html:text name="ReportQueryParaForm" styleClass="formStyleall"  property="paraCol" styleId="paraCol"  size="30"/>
                </td>
              </tr>
              
              <tr class="ListTableRow">    
                <td width="15%" >数据字典类型：</td>
                <td width="85%" colspan="3">
                    <html:text name="ReportQueryParaForm" styleClass="formStyleall"  property="dictTypeCode" styleId="dictTypeCode"  size="30" />
                </td>
                
              </tr>
              
               
              
              
              
             
              </html:form>
    </table>
    
</html>

