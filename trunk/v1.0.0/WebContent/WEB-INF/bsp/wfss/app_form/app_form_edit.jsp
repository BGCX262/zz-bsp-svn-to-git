<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    <script type="text/javascript" language="javascript">
    function gotoMrgForm() {
        var appFormIdValue = document.getElementById("appFormId").value;
        if(appFormIdValue!="") {
           location.href="<%=baseURL%>/getFormFieldByFormId_wfss.do?appFormId=<bean:write name="AppFormForm" property="appFormId"/>";
         }
         else {
            alert("请先保存流程表单!");
         }
    }
    </script>
    <html>
    <fe:body formId="appFormEdit" moduleName="wfss">
    <fe:topTable>
    <fe:powerTool funCode="wfss_form_mrg" groupName="edit"/>
</fe:topTable>

 <fe:span>
   <br />
        <center>
            <font size=4><b>流程表单管理</font>
        </center>
        <br />
            <html:form action="/saveAppForm_wfss.do"   styleId="appFormEdit" method="post" style="margin: 0">
<table border="0" width="96%" align="center">
    <tr>
        <td>
        <div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
        <div class="tab-page" id="tabPage2">
        <h2 class="tab">基本信息</h2>
        <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
        
   
    <table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">

             <tr class="ListTableRow">
                <td width="15%" ><span id="appFormName_span">表单名称：</sapn></td>
                <td width="35%">
                  <html:hidden name="AppFormForm" property="appFormId" styleId="appFormId" />
                  <INPUT type="hidden" name="appFormNameOld" value="<bean:write name="AppFormForm"  property="appFormName"/>">
                  <html:text name="AppFormForm" styleClass="formStyleall"  property="appFormName" styleId="appFormName"  size="30" />
                </td>
                <td width="15%" ><span id="appFormCode_span">表单编码：</sapn></td>
                <td width="35%">
                  <html:text name="AppFormForm" styleClass="formStyleall"  property="appFormCode" styleId="appFormCode"  size="30" />
                </td>
              </tr>
              <tr class="ListTableRow">
                <td width="15%" ><span id="appFormUrl_span">表单路径：</sapn></td>
                <td width="35%" >
                  <html:text name="AppFormForm" styleClass="formStyleall"  property="appFormUrl" styleId="appFormUrl"  size="30" />
                </td>
                <td width="15%" >所属应用：</td>
                <td width="35%" >
                  <bean:write name="app" property="appName"/>&nbsp;
                  <input type="hidden" name="appId" value="<bean:write name="app" property="appId"/>" id="appId" />
                </td>
              </tr>
             
             
               <tr class="ListTableRow">
                <td width="15%" ><span id="editionId_span">所属版本：</span></td>
                <td colspan="3">
                   <logic:notEmpty name="AppFormForm" property="appFormId">
                       <html:hidden name="AppFormForm" property="editionId" styleId="editionId"/>
                       <fe:codeToName dictType="wfssProcessEditionDict" dynamic="true" name="AppFormForm" property="editionId"/>
                   </logic:notEmpty> 
                   <logic:empty name="AppFormForm" property="appFormId">
                      <fe:dropDown name="AppFormForm" dictType="wfssProcessEditionDict" property="editionId" dynamic="true"/>
                   </logic:empty> 
        
                
                  </td>
              </tr>
    </table>
        
        </div>
        
        </td>
    </tr>
</table>
 </html:form>
 </fe:span>
 <fe:bottomTable>
 <strong>
    <logic:notEmpty name="AppFormForm" property="appFormId">修改表单定义</logic:notEmpty> 
    <logic:empty name="AppFormForm" property="appFormId">新增表单定义</logic:empty> 
</strong>
</fe:bottomTable> 
</fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardAppFormTree_wfss.do?appId=<bean:write name="app" property="appId"/>&reloadMid=false";
         <%
      }
      %>
    </script>    
</html>

