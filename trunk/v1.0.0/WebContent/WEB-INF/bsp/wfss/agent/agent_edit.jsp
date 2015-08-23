<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    <script type="text/javascript">
     function selectOrg()
    {
       orgVo=new OrgVo();
       orgVo.setOrgId("<%=WebHelper.getTopOrgId(session,"GS")%>"); //根节点id设置 
       orgVo.setOrgName("<%=WebHelper.getTopOrgName(session,"GS")%>");//根节点名称设置 
       orgVo.setOrgType("GS");//根节组织架构类型 
       orgVo.setSelectOrgType("YG");//设置可以选择的组织架构类型 
       orgVo.setSize(1);
        if(document.getElementById("agentOrgId").value!='')
         {
               var orgVoTemp=new  OrgVo();
               orgVoTemp.setOrgId(document.getElementById("agentOrgId").value);
               orgVoTemp.setOrgName(document.getElementById("agentOrgName").value);
               orgVoTemp.setOrgType('YG');
               orgVo.getSubOrgVos()[0]=orgVoTemp;
         }
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
        if(returnValue==null) return ;
        var subOrgList=orgVo.getSubOrgVos();
        var ids="";
        var names="";
       
         for(var i=0;i<subOrgList.length;i++)
         {
            var valueObj=subOrgList[i];
            ids=ids+valueObj.getOrgId()+"," ;
            names=names+valueObj.getOrgName()+"," ;
           
        }
        if(ids!="")
           ids=ids.substring(0,ids.length-1);
        if(names!="")
           names=names.substring(0,names.length-1);
        
           
        document.getElementById("agentOrgId").value=ids;
        document.getElementById("agentOrgName").value=names;
       
    }
    </script>
    <fe:body formId="AgentForm" moduleName="wfss">
    <fe:topTable>
    <fe:powerTool funCode="wfss_process_agent" groupName="edit"/>
     </fe:topTable>

  <fe:span>
    <html:form action="/saveAgent_wfss.do"   styleId="AgentForm" method="post">
    <br />
        <center>
            <font size=4><b>代理人设置</font>
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
                <td width="15%" ><span id="orgId_span">当前组织：</span></td>
                <td width="85%" colspan="3">
                        <html:hidden name="AgentForm" property="orgId" styleId="orgId" />
                        <bean:write name="currOrgName"/>:<bean:write name="AgentForm" property="orgName"/>
                </td>
              
                </tr>
                <tr >
                <td width="15%" ><span id="agentType_span">代理类型：</span></td>
                <td width="35%">
                  <html:radio property="agentType" name="AgentForm" styleId="agentTypeAll" value="ALL"/><label for="agentTypeAll">全部代理</label>&nbsp;
                  <html:radio property="agentType" name="AgentForm" styleId="agentTypePart" value="PART" disabled="true"/><label for="agentTypePart">部份代理</label>&nbsp;
                  <html:radio property="agentType" name="AgentForm" styleId="agentTypeExcept" value="EXCEPT" disabled="true"/><label for="agentTypeExcept">除...以外</label>
               </td>
                <td width="15%" ><span id="agentOrgId_span">代理人：</span> </td>
                <td width="35%">
                <html:hidden name="AgentForm" property="agentOrgId" styleId="agentOrgId" />
                <html:text name="AgentForm" styleClass="formStyleall" readonly="true" property="agentOrgName" styleId="agentOrgName"  size="30" />
                  <input type='button' name='power_button'  value='选择'   class='Button3'  onclick="selectOrg()">  
                </td>
                
              </tr>
              
              <tr >    
                <td width="15%"><span id="fromDate_span">代理日期 从：</span></td>
                <td width="35%" colspan="1">               
                  <fe:date property="fromDate" name="AgentForm" readOnly="true" time="false"/>
                </td>
                <td width="15%"><span id="toDate_span">到：</span></td>
                <td width="35%" colspan="1">               
                  <fe:date property="toDate" name="AgentForm" readOnly="true" time="false"/>
                </td>
              </tr>
              
            
    </table>
                         </div>
        
                         </div>
                 </td>
            </tr>
        </table>
    </html:form>
    
    </fe:span>
    <fe:bottomTable>
       设置代理人
    </fe:bottomTable>
</fe:body>
</html>

