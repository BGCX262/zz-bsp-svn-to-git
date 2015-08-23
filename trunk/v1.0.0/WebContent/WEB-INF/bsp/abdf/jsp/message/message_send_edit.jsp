<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
     
     <script language="javascript">
        function sendMessageSend(buttonRef){
            document.getElementById("MessageSendEditForm").action="<%=baseURL%>/sendMessageSend_abdf.do";
            submitForm(buttonRef,'MessageSendEditForm','','');
        }

        function selectOrg(){
           orgVo=new OrgVo();
           orgVo.setOrgId("<%=WebHelper.getTopOrgId(session,"GS")%>"); //根节点id设置 
           orgVo.setOrgName("<%=WebHelper.getTopOrgName(session,"GS")%>");//根节点名称设置 
           orgVo.setOrgType("GS");//根节组织架构类型 
           orgVo.setSelectOrgType("YG,BM,GS");//设置可以选择的组织架构类型 
           orgVo.setSize(-1);
           if(document.getElementById("acceptOrgIds").value!='')
             {
                   var orgVoTemp=new  OrgVo();
                   orgVoTemp.setOrgId(document.getElementById("acceptOrgIds").value);
                   orgVoTemp.setOrgName(document.getElementById("acceptOrgNames").value);
                   orgVoTemp.setOrgType(document.getElementById("acceptOrgTypes").value);
                   orgVo.getSubOrgVos()[0]=orgVoTemp;
             }
           
           var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
           if(returnValue==null) return ;
           var subOrgList=orgVo.getSubOrgVos();
           var ids="";
           var orgTemp=subOrgList[0];
           document.getElementById("acceptOrgIds").value=orgTemp.getOrgId();
           document.getElementById("acceptOrgNames").value=orgTemp.getOrgName();
           document.getElementById("acceptOrgTypes").value=orgTemp.getOrgType();
        }
            
     </script>
    <fe:body formId="MessageSendEditForm" moduleName="abdf" runFlow="false" prompt="true" >
    <fe:topTable>
       &nbsp;&nbsp;<fe:powerTool funCode="messageSend" groupName="edit" type="button"/>
       &nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='保存' class='Button3' onclick="submitForm(this,'MessageSendEditForm','','');" id='baseStation_show'>&nbsp;&nbsp;</span>
       &nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='立即发送' class='Button3' onclick="sendMessageSend(this);" id='baseStation_show'>&nbsp;&nbsp;</span>
       &nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='返回' class='Button3' onclick="buttomOnClick('enterUserMessage_abdf.do','parent')" id='baseStation_show'>&nbsp;&nbsp;</span>
    </fe:topTable>
    
  <fe:span>
    <html:form action="/saveMessageSend_abdf.do" styleId="MessageSendEditForm" method="post">
    <html:hidden name="formObject" property="id" styleId="id" />
    <html:hidden name="formObject" property="acceptOrgIds" styleId="acceptOrgIds" />
    <html:hidden name="formObject" property="acceptOrgTypes" styleId="acceptOrgTypes"/>
    <html:hidden name="formObject" property="folderId" styleId="folderId" />
    <input type="hidden" name="createTime" value="<bean:write name="formObject" property="createTime" format="yyyy-mm-dd HH:MM:SS"/>" id="createTime" />
    
    <br/><center><font size="4"><b>信息编辑</b></font></center><br/>
    <table border="0" width="98%" align="center">
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
    
             <tr>
                <td width="16%" ><span id="acceptOrgNames_span">接收人：</span></td>
                <td width="29%" colspan="3">
                  <html:text name="formObject" styleClass="formStyleall"  property="acceptOrgNames" styleId="acceptOrgNames"  size="60" readonly="true"/>
                  &nbsp;&nbsp;<input type='button' name='power_button'  value='选择'   class='Button3'  onclick="selectOrg()">
                </td>
              </tr>
              <tr>
                <td width="16%" ><span id="htmlTitle_span">标题：</span></td>
                <td width="29%" colspan="3">
                  <html:text name="formObject" styleClass="formStyleall"  property="htmlTitle" styleId="htmlTitle"  size="60"/>
                </td>
              </tr>
               <tr>
                <td width="16%" ><span id="isSend_span">是否下发：</span></td>
                <td width="29%" colspan="3">
                  <fe:dropDown dictType="abdf_yesno" name="formObject" property="isSend" disabled="false" dynamic="false"  struts="true" valueType="alias"/>
                </td>
              </tr>  
              <tr>
                <td width="16%" ><span id="htmlContent_span">正文：</span></td>
                <td width="29%" colspan="3">
                  <html:textarea name="formObject" property="htmlContent" rows="5" style="width:100%" styleId="htmlContent"></html:textarea>
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
    <fe:bottomTable></fe:bottomTable>
</fe:body>
</html>

