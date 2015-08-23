<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
    <script>
      function selectOrg()
	{
	   orgVo=new OrgVo();
	   orgVo.setOrgId("<%=WebHelper.getTopOrgId(session,"GS")%>"); //根节点id设置 
	   orgVo.setOrgName("<%=WebHelper.getTopOrgName(session,"GS")%>");//根节点名称设置 
	   orgVo.setOrgType("GS");//根节组织架构类型 
	   orgVo.setSelectOrgType("!YG");//设置可以选择的组织架构类型 
	   orgVo.setSize(1);
	   
	   if(document.getElementById("orgId").value!='')
		 {
		       var orgVoTemp=new  OrgVo();
		       orgVoTemp.setOrgId(document.getElementById("orgId").value);
		       orgVoTemp.setOrgName(document.getElementById("orgName").value);
		       orgVoTemp.setOrgType(document.getElementById("orgTypeCode").value);
		       orgVo.getSubOrgVos()[0]=orgVoTemp;
		 }
	   
	   var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
       if(returnValue==null) return ;
       var subOrgList=orgVo.getSubOrgVos();
       var ids="";
       var orgTemp=subOrgList[0];
       document.getElementById("orgId").value=orgTemp.getOrgId();
       document.getElementById("orgName").value=orgTemp.getOrgName();
        document.getElementById("orgTypeCode").value=orgTemp.getOrgType();
	}
	function addActivity(obj) {
	var processIdValue = document.getElementById("processId").value;
	if (processIdValue == "") {
	  alert("请选保存流程，然后再新增环节");
	  return;
	} 
	   buttomOnClick('<%=baseURL%>/initActivity_wfss.do?processId=<bean:write name="ProcessForm" property="processId"/>','self');
	}
	function backProcess(obj) {
        buttomOnClick('<%=baseURL%>/queryPageProcess_wfss.do','parent');
    }
    </script>
    </head>
    <fe:body formId="processEdit" moduleName="wfss">
    <fe:topTable>
       <fe:powerTool funCode="wfss_process_mrg" groupName="process_edit"/>
    </fe:topTable>
<html:form action="/saveProcess_wfss.do"   styleId="processEdit" method="post" style="margin: 0px">
  <fe:span>
  <br />
        <center>
            <font size=4><b>流程管理</font>
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
                            <table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
    
             <tr >
                <td width="20%" ><span id="processName_span">流程名称：</sapn></td>
                <td width="35%" colspan="3">
                  
                  <html:hidden name="ProcessForm" property="processId" styleId="processId"/>
                  
                  <input type="hidden" name="processNameOld" size="60" value="<bean:write name="ProcessForm"   property="processName"/>" id="processNameOld">
                 
                  <html:text name="ProcessForm" styleClass="formStyleall"  property="processName" styleId="processName"  size="60" />
                </td>
                
              </tr>
              
              <tr >
                <td width="15%" ><span id="processAlias_span">流程编号：</span></td>
                <td width="35%" colspan="1">
                  <logic:notEmpty name="ProcessForm" property="processId">
                        <html:hidden name="ProcessForm"    property="processAlias" styleId="processAlias" />
                       <bean:write name="ProcessForm" property="processAlias"/>
                   </logic:notEmpty> 
                   <logic:empty name="ProcessForm" property="processId">
                      <html:text name="ProcessForm" styleClass="formStyleall"  property="processAlias" styleId="processAlias"  size="30" />
                   </logic:empty> 
                 
                </td>
                <td width="15%" ><span id="appId_span">所属系统：</span></td>
                <td width="35%">
                  <html:hidden name="ProcessForm" property="appId"/>
                  <bean:write name="app" property="appName"/>
                 
                </td>
                
              </tr>
              
              
             <tr >
                <td width="15%" ><span id="orgName_span">所属组织：</span></td>
                <td width="35%" colspan="3">
                  <html:hidden name="ProcessForm" property="orgId" styleId="orgId"/>
                   <html:hidden name="ProcessForm" property="orgTypeCode" styleId="orgTypeCode"/>
                   <bean:write name="ProcessForm" property="orgName"/>
                  <html:hidden name="ProcessForm"    property="orgName" styleId="orgName" />
                 <!--  <input type='button' name='power_button'  value='选择'   class='Button3'  onclick="selectOrg()"> -->
                </td>
                
              </tr>
              <tr >
                <td width="15%" ><span id="appFormId_span">默认业务表单：</span></td>
                <td width="35%" colspan="3">
                <fe:dropDown struts="true" dictType="appForm" property="appFormId" name="ProcessForm" dynamic="true"/>

                 </td>
                  </tr>
                   <tr>
                <td width="15%" ><span id="firstActivityId_span">流程首活动：</span></td>
                <td width="35%" colspan="3">
                 <fe:dropDown scope="request" name="ProcessForm"  property="firstActivityId" dictType="activity" dynamic="true" struts="true"/>
                
                  </td>
              </tr>
       
        
              <tr >
                <td width="15%" ><span id="isUsed_span">是否启用：</span></td>
                <td width="35%">
                 <html:radio  name="ProcessForm" property="isUsed" value="Y"/>是&nbsp;
                 <html:radio name="ProcessForm" property="isUsed" value="N"/>否
                  </td>
                <td width="15%" ><span id="editionId_span">所属版本：</span></td>
                <td>
                   <logic:notEmpty name="ProcessForm" property="processId">
                       <html:hidden name="ProcessForm" property="editionId" styleId="editionId"/>
                       <fe:codeToName dictType="wfssProcessEditionDict" dynamic="true" name="ProcessForm" property="editionId"/>
                   </logic:notEmpty> 
                   <logic:empty name="ProcessForm" property="processId">
                      <fe:dropDown name="ProcessForm" dictType="wfssProcessEditionDict" property="editionId" dynamic="true" onchange="Control_LinkDropDown(this,'appFormId','appForm')"/>
                   </logic:empty> 
        
                
                  </td>
              </tr>
                            
              <tr >
                <td width="15%" ><span id="onStartEvent_span">启动前事件：</span></td>
                <td width="35%">
                <html:text name="ProcessForm" styleClass="formStyleall"  property="onStartEvent" styleId="onStartEvent"  size="30" />
                  </td>
                <td width="15%" ><span id="onEndEvent_span">结束后事件：</span></td>
                <td>
                  <html:text name="ProcessForm" styleClass="formStyleall"  property="onEndEvent" styleId="onEndEvent"  size="30" />
                 
                  </td>
              </tr>
                <tr >
                <td width="15%" ><span id="cancellationEvent_span">作废事件：</span></td>
                <td width="35%">
                <html:text name="ProcessForm" styleClass="formStyleall"  property="cancellationEvent" styleId="cancellationEvent"  size="30" />
                  </td>
                <td width="15%" ><span id="hangEvent_span">挂起事件：</span></td>
                <td>
                  <html:text name="ProcessForm" styleClass="formStyleall"  property="hangEvent" styleId="hangEvent"  size="30" />
                 
                  </td>
              </tr>
              
              
              <tr >
                
                <td width="15%" ><span id="memo_span">备注：</span></td>
                <td width="35%" colspan="3">
                  <html:textarea style="width=100%" name="ProcessForm" rows="4"   property="memo" styleId="memo" ></html:textarea>
                </td>
              </tr>
              
              
             
        </table>
         </div>
        
                         </div>
                 </td>
            </tr>
        </table>

 </fe:span>
  </html:form>
  <fe:bottomTable>
        <logic:notEmpty name="ProcessForm" property="processId">修改流程定义</logic:notEmpty> 
        <logic:empty name="ProcessForm" property="processId">新增流程定义</logic:empty> 
  </fe:bottomTable>
</fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardProcessEditTree_wfss.do?processId=<bean:write name="ProcessForm" property="processId"/>";
         <%
      }
      %>
    </script>    
</html>

