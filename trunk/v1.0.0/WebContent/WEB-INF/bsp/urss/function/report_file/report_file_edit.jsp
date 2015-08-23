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
                
                    <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'reportFileEdit',0,'urss')" id='reportFile_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/getAllReportFileByFunId_urss.do?funModuleId=<bean:write name="ReportFileForm" property="funModuleId"/>','self')" id='reportFile_save'>&nbsp;&nbsp;
                  <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initReportFile_urss.do?funModuleId=<bean:write name="ReportFileForm" property="funModuleId"/>','self')" id='dictionary_add'>&nbsp;&nbsp;
                   </td>
            </tr>
    </table>
    
    <table width="100%" <%=tableStyle%>>
    <html:form action="/saveReportFile_urss.do"   styleId="reportFileEdit" method="post" enctype="multipart/form-data">
            <tr class="ListTableRow">
                <td width="15%" >附件：</td>
                <td width="85%">
                        <html:hidden name="ReportFileForm" property="id" styleId="id" />
                        <html:hidden name="ReportFileForm" property="funModuleId" styleId="funModuleId" />
                        <html:file name="ReportFileForm" property="formFile" styleId="formFile" style="width:80%"></html:file><%=red%>
                        
                       
                </td>
               
                </tr>
                <tr class="ListTableRow">
               
              
              <tr class="ListTableRow">    
                <td width="15%" >描述：</td>
                <td width="85%" colspan="3">
                <html:textarea name="ReportFileForm" property="desc" styleId="desc" style="width:100%" rows="8"></html:textarea>
                   
                </td>
                
              </tr>
              
               
              
              
              
             
              </html:form>
    </table>
    
</html>

