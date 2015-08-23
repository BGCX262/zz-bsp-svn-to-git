<%@ page contentType="text/html;charset=UTF-8" language="java"%>  
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    <script language="javascript" type="text/javascript" >
    function openSelectOpenSelectProcess() {
       var editionId = document.getElementById("id").value;
       if (editionId == '') {
         alert("请选保存流程版本");
         return;
       }
       //window.open(baseURL+'/forwardProcessSelectFrame_wfss.do?id='+editionId);
        var returnValue=showModalDialog(baseURL+'/forwardProcessSelectFrame_wfss.do?id='+editionId, window,'dialogHeight:500px;dialogWidth:650px;status=off');
        if(returnValue!=null) {
           
           location.href = baseURL+"/addProcessToEdition_wfss.do?id="+editionId+"&processId="+returnValue;
        }
    }
    </script>
    <fe:body formId="ProcessEditionForm" moduleName="wfss">
    <fe:topTable>
    <fe:powerTool funCode="wfss_process_edition" groupName="edit"/>
     </fe:topTable>

  <fe:span>
    <html:form action="/saveProcessEdition_wfss.do"   styleId="ProcessEditionForm" method="post">
    <br />
        <center>
            <font size=4><b>流程版本管理</font>
        </center>
        <br />
    <table border="0" width="80%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="tabPane1">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
                        <div class="tab-page" id="tabPage2">
                            <h2 class="tab">
                                基本属性
                            </h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
                            <table cellspacing="0" cellpadding="3" width="96%" class="tform" align=center>
    
            <tr >
                <td width="15%" ><span id="name_span">版本名称：</span></td>
                <td width="85%">
                        <html:hidden name="ProcessEditionForm" property="id" styleId="id" />
                        <html:hidden name="ProcessEditionForm" property="deleteFlag" styleId="deleteFlag" />
                        <html:text name="ProcessEditionForm" styleClass="formStyleall"  property="name"  styleId="name"  size="30" />
                </td>
                </tr>
                <logic:present name="processList">
                 <tr >
                <td width="100%" colspan="2">
                <fieldset style='width:100%'><legend><B>所含流程</B></legend>
                        <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
            <thead>
                <tr>
                   
                    <td width="50%" align="center"  nowrap="nowrap"><b>流程名称</b></td>
                    <td width="25%" align="center"  nowrap="nowrap"><b>流程编号</b></td>
                    <td width="25%" align="center"  nowrap="nowrap"><b>状态</b></td>
                   
                </tr>
            </thead>
            <logic:iterate name="processList" id="process" scope="request" >
              <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
                      <td>
                      <a href="#" onclick="buttomOnClick('<%=baseURL%>/forwardProcessEditFrame_wfss.do?processId=<bean:write name="process" property="processId"/>','self')" >
                        <bean:write name="process" property="processName"/>
                       </a>
                     </td>
                     
                      <td>
                        <bean:write name="process" property="processAlias"/>
                     
                     </td>
                       
                      <td>
                      <logic:equal value="Y" name="process"  property="isUsed">启用</logic:equal>
                      <logic:equal value="N" name="process"  property="isUsed">停用</logic:equal>
                     </td>
                      
                    
                </tr>
            </logic:iterate>
    </table>
     </fieldset>
                </td>
                </tr>
                </logic:present>
                <logic:present name="appFormList">
             <tr >
                <td width="100%" colspan="2">
                <fieldset style='width:100%'><legend><B>所含业务表单</B></legend>
                        <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
            <thead>
                <tr>
                   
                    <td width="50%" align="center"  nowrap="nowrap"><b>表单名称</b></td>
                    <td width="50%" align="center"  nowrap="nowrap"><b>表单编号</b></td>
                </tr>
            </thead>
            <logic:iterate name="appFormList" id="appForm" scope="request" >
              <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
                      <td>
                      <a href="#" onclick="buttomOnClick('<%=baseURL%>/showAppForm_wfss.do?appFormId=<bean:write name="appForm" property="appFormId"/>','self')" >
                        <bean:write name="appForm" property="appFormName"/>
                       </a>
                     </td>
                     
                      <td>
                        <bean:write name="appForm" property="appFormCode"/>
                     
                     </td>
                       
                     
                      
                    
                </tr>
            </logic:iterate>
    </table>
     </fieldset>
                </td>
                
                </tr>
                </logic:present>
    </table>
    

    
                         </div>
        
                         </div>
                 </td>
            </tr>
        </table>
    </html:form>
    
    </fe:span>
    <fe:bottomTable>
        <logic:notEmpty name="ProcessEditionForm" property="id">修改流程版本</logic:notEmpty> 
        <logic:empty name="ProcessEditionForm" property="id">新增流程版本</logic:empty>
    </fe:bottomTable>
</fe:body>
</html>

