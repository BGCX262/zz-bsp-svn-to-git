<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>	
<%@ page import="com.youthor.bsp.core.abdf.model.ReportQueryPara"%>
<%@ page import="com.youthor.bsp.core.urss.model.Function"%>
<%Function function = (Function)request.getAttribute("function");
String funCode = function.getFunCode();
List formList = (List)request.getAttribute("queryParas");
%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
    <script type="text/javascript" >
      function submitReportFrom(viewType) {
         document.getElementById("ABDF_viewType").value = viewType;
         document.getElementById("ReportQueryPage").submit();
      }
    </script>
 	
	<fe:body  >
    <fe:topTable>
       <fe:powerTool funCode="<%=funCode%>" groupName="query"/>
    </fe:topTable>

  <fe:span>
    <form action="<%=baseURL%>/doReport_abdf.do"   id="ReportQueryPage" style="margin: 0" method="post" target="_blank">
    <input type="hidden" name="ABDF_funCode" id ="ABDF_funCode"  value="<%=funCode%>"/>
    <input type="hidden" name="ABDF_viewType" id = "ABDF_viewType" value="pdfReportViewer"/>
    <br/><center><font size="4"><b><%=function.getFunModuleName()%></b></font></center><br/>
    <table border="0" width="80%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="tabPane1">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
                        <div class="tab-page" id="tabPage2">
                            <h2 class="tab">
                                查询条件
                            </h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
                            <% 
                             int len = formList.size();
                             int i=0;
                             if (len > 0) {
                             %>
                            <table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
               
             
                    <%
                    int  columnCount = 2; 
                   
                    for(;i<len;i++){
                        ReportQueryPara peportQueryPara =(ReportQueryPara)formList.get(i);
                        request.setAttribute("oneItemForm", peportQueryPara);
                        String inputType = peportQueryPara.getInputType() == null ? "text" : peportQueryPara.getInputType();
                       if (i%columnCount == 0) {
                    %>
                             <tr>
                      <%} %>
                   
                        <td width="10%"><span id="<%=peportQueryPara.getParaKey()%>.span"><bean:write name="oneItemForm" property="name"/>:</span></td>
                        <td width="40%">&nbsp;
                        <select name="<%=peportQueryPara.getParaKey()%>_operation" id="<%=peportQueryPara.getParaKey()%>_operation">
                        <option value="=">等于</option>
                        <option value="&gt;">大于</option>
                        <option value="&gt;=">大于等于</option>
                        <option value="&lt;">小于</option>
                        <option value="&lt;=">小于等于</option>
                        <option value="like">模糊匹配</option>
                        </select>
                        <%if(inputType.equalsIgnoreCase("text")) {%>
                        <input type="text" size="30"  name="<%=peportQueryPara.getParaKey()%>"  id="<%=peportQueryPara.getParaKey()%>" class="formStyleall">
                        <%} else if (inputType.equalsIgnoreCase("radio")) {%>
                        <fe:radioBox dictType="<%=peportQueryPara.getDictTypeCode()%>"  dynamic="false" struts="false"  scope="request" valueType="code" property="<%=peportQueryPara.getParaKey()%>" />
                        <% } else if (inputType.equalsIgnoreCase("checkBox")) {
                            %>
                              <fe:checkBox dictType="<%=peportQueryPara.getDictTypeCode()%>"  dynamic="false" struts="false"  scope="request" valueType="code" property="<%=peportQueryPara.getParaKey()%>" />
                            <%
                        } else if (inputType.equalsIgnoreCase("select"))  {%>
                            <fe:dropDown dictType="<%=peportQueryPara.getDictTypeCode()%>"  dynamic="false" struts="false"  scope="request" valueType="code" property="<%=peportQueryPara.getParaKey()%>" />
                        <% 
                        }//根据需要加不同的控件
                        %>
                                
                        </td><% 
                        if ((i+1)%columnCount == 0) {
                    %>
                             </tr>
                      <%} %>
                       
                    <%
                    }
                    %>
                    <% 
                        if (len%columnCount !=0 ) {
                    %>
                            <td colspan="2">&nbsp;</td>
                             </tr>
                      <%} %>
                </table>
                <% 
                     }else {
                %>
                无
                <% 
                     }
                %>
                         </div>
        
                         </div>
                 </td>
            </tr>
        </table>
    </form>
  </fe:span>
	<fe:bottomTable></fe:bottomTable>
</fe:body>
</html>

