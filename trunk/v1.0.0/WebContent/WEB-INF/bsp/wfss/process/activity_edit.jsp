<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
      function openEditField()
      {
          var appFormIdValue=document.getElementById("appFormId").value;
          if(appFormIdValue=='')
          {
             alert("请先选择业务类型.");
             return;
          }
          var returnValue=showModalDialog('<%=baseURL%>/forwardEditFieldFrame_wfss.do?appFormId='+appFormIdValue, window,'dialogHeight:500px;dialogWidth:350px;status=off');
          if(returnValue!=undefined)
          {
             var arrValue=returnValue.split("{}");
             document.getElementById("editFields").value=arrValue[0];
             document.getElementById("editFieldsName").value=arrValue[1];
          }
      }
      function openNotNullFields()
      {
         if(document.getElementById("editFields").value=="")
         {
            alert("请先选择编辑字段!");
            return;
         }
          var returnValue=showModalDialog('<%=baseURL%>/forwardNotNullFieldFrame_wfss.do', window,'dialogHeight:500px;dialogWidth:350px;status=off');
          if(returnValue!=undefined)
          {
             var arrValue=returnValue.split("{}");
             document.getElementById("notNullFields").value=arrValue[0];
             document.getElementById("notNullFieldsName").value=arrValue[1];
          }
        
      }
      
      
     function selectUser()
    {
       orgVo=new OrgVo();
       orgVo.setOrgId("<bean:write name="process" property="orgId"/>"); //根节点id设置 
       orgVo.setOrgName("<bean:write name="process" property="orgName"/>");//根节点名称设置 
       orgVo.setOrgType("<bean:write name="process" property="orgTypeCode"/>");//根节组织架构类型 
       orgVo.setSelectOrgType("YG");//设置可以选择的组织架构类型 
       orgVo.setSize(0);
        
         if(document.getElementById("partUserIds").value!="")
         {
               var ids=document.getElementById("partUserIds").value;
               var names=document.getElementById("partUserNames").value;
               
               var idsArr=ids.split(",");
               var namesArr=names.split(",");
               for(var i=0;i<idsArr.length;i++)
               {
               
                   var orgVoTemp=new  OrgVo();
                   orgVoTemp.setOrgId(idsArr[i]);
                   orgVoTemp.setOrgName(namesArr[i]);
                   orgVoTemp.setOrgType("YG");
                   orgVo.getSubOrgVos()[i]=orgVoTemp;
                } 
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
        
           
        document.getElementById("partUserIds").value=ids;
        document.getElementById("partUserNames").value=names;
       
    }
    
     function selectOrg()
    {
       orgVo=new OrgVo();
       orgVo.setOrgId("<bean:write name="process" property="orgId"/>"); //根节点id设置 
       orgVo.setOrgName("<bean:write name="process" property="orgName"/>");//根节点名称设置 
       orgVo.setOrgType("<bean:write name="process" property="orgTypeCode"/>");//根节组织架构类型 
       orgVo.setSelectOrgType("!YG");//设置可以选择的组织架构类型 
       orgVo.setSize(0);
        
         if(document.getElementById("partOrgIds").value!="")
         {
               var ids=document.getElementById("partOrgIds").value;
               var names=document.getElementById("partOrgNames").value;
               var codes=document.getElementById("partOrgTypeCodes").value;
                var codesArr=codes.split(",");
               var idsArr=ids.split(",");
               var namesArr=names.split(",");
               for(var i=0;i<idsArr.length;i++)
               {
               
                   var orgVoTemp=new  OrgVo();
                   orgVoTemp.setOrgId(idsArr[i]);
                   orgVoTemp.setOrgName(namesArr[i]);
                   orgVoTemp.setOrgType(codesArr[i]);
                   orgVo.getSubOrgVos()[i]=orgVoTemp;
                } 
         }
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
        if(returnValue==null) return ;
        var subOrgList=orgVo.getSubOrgVos();
        var ids="";
        var names="";
        var codes="";
         for(var i=0;i<subOrgList.length;i++)
         {
            var valueObj=subOrgList[i];
            ids=ids+valueObj.getOrgId()+"," ;
            names=names+valueObj.getOrgName()+"," ;
            codes=codes+valueObj.getOrgType()+"," ;
        }
        if(ids!="")
           ids=ids.substring(0,ids.length-1);
        if(names!="")
           names=names.substring(0,names.length-1);
        if(codes!="")
           codes=codes.substring(0,codes.length-1);
        document.getElementById("partOrgIds").value=ids;
        document.getElementById("partOrgNames").value=names;
         document.getElementById("partOrgTypeCodes").value=codes;
    }
    
    function addRoute(){
    var activityIdValue = document.getElementById("activityId").value;
    if (activityIdValue == "") {
       alert("请先保存环节后，再新增路由!")
       return;
    }
     buttomOnClick('<%=baseURL%>/initRoute_wfss.do?activityId=<bean:write name="ActivityForm" property="activityId"/>','self');
    }
    function backProcess(obj) {
        buttomOnClick('<%=baseURL%>/queryPageProcess_wfss.do','parent');
    }
    </script>
    </head>
    <html> 
    <fe:body formId="activityEdit" moduleName="wfss">
    <fe:topTable>
      <fe:powerTool funCode="wfss_process_mrg" groupName="activity_edit"/>
    </fe:topTable>
    <html:form action="/saveActivity_wfss.do"   styleId="activityEdit" method="post" style="margin: 0px">
    <fe:span>
      <br />
        <center>
            <font size=4><b>流程管理</font>
        </center>
        <br />
    <table border="0" width="96%" align="center">
    <tr>
        <td>
        <div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
        <div class="tab-page" id="tabPage2">
        <h2 class="tab">基本信息</h2>
        <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
        
    <table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
    
             <tr >
                <td width="15%" ><span id="activityName_span">活动名称：</span></td>
                <td width="35%" colspan="3">
                  <html:hidden name="ActivityForm" property="activityId" styleId="activityId" />
                   <html:hidden name="ActivityForm" property="appId" styleId="appId" />
                  <html:hidden name="ActivityForm" property="processId" styleId="processId"/>
                  <input type="hidden" name="activityOldName" value="<bean:write name="ActivityForm" property="activityName"/>" id="activityOldName">
                 
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="activityName" styleId="activityName"  size="70" />
                </td>
                </tr>
                <tr>
                <td width="15%" ><span id="activityAlias_span">活动编号：</span></td>
                <td width="35%" >
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="activityAlias" styleId="activityAlias"  size="30" />
                </td>
                <td width="15%" ><span id="orderIndex_span">排序号：</span></td>
                <td width="35%">
                
                 <input type="hidden" name="orderIndexOld" value="<bean:write name="ActivityForm" property="orderIndex"  format="0.00"/>" id="orderIndexOld">
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="30" />
                </td>
              </tr> 
              <tr >
                <td width="15%" ><span id="appFormId_span">业务表单：</span></td>
                <td width="35%" >
                <fe:dropDown dictType="appForm" name="ActivityForm" property="appFormId" struts="true" dynamic="true" />
                </td>
                <td width="15%" ><span id="startProcess_span">是否能启动流程：</span></td>
                <td width="35%" >
                  <html:radio property="startProcess" value="Y"/>是&nbsp;
                  <html:radio property="startProcess" value="N"/>否&nbsp;
                </td>
                </tr>
                <tr>
                <td width="15%" ><span id="splitMode_span">分支类型：</span></td>
                <td width="35%" colspan="3">
                
                  <html:radio property="splitMode" value="AND"/>全部分支&nbsp;
                  <html:radio property="splitMode" value="XOR"/>单一分支&nbsp;
                  <html:radio property="splitMode" value="OR" />多路分支
                  
                </td>
              </tr>
              
              <tr  >
                <td width="15%" ><span id="operateStrategy_span">分支策略：</span></td>
                <td width="35%">
                <html:select name="ActivityForm" property="operateStrategy">   
                      <html:option value="">请选择--</html:option>   
               </html:select> 
                 </td>
                <td width="15%" ><span id="splitId_span">分支ID：</span></td>
                <td width="35%" colspan="3">
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="splitId" styleId="splitId"  size="30" />
                </td>
              </tr>
              <tr  >
                <td width="15%" ><span id="joinMode_span">聚合类型：</span></td>
                <td width="35%" colspan="1">
                
                <html:radio property="joinMode" value="AND"/>全部聚合&nbsp;
                <html:radio property="joinMode" value="XOR"/>单一聚合&nbsp;
                <html:radio property="joinMode" value="OR"/>多路聚合

                     </td>
                      <td width="15%" ><span id="joinId_span">聚合ID：</span></td>
                <td width="35%" >
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="joinId" styleId="joinId"  size="2" maxlength="1"/>
                </td>
                     </tr>
                <tr >
                <td width="15%" ><span id="joinStrategy_span">聚合策略(前)：</span></td>
                <td width="35%" >
                 <html:text name="ActivityForm" styleClass="formStyleall"  property="joinStrategy" styleId="joinStrategy"  size="30" />
                
                </td>
              
                <td width="15%" ><span id="joinId_span">聚合策略(后)：</span></td>
                <td width="35%" >
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="joinStrategyBack" styleId="joinStrategyBack"  size="30" />
                </td>
                    </tr>
                <tr>
                <td width="15%" ><span id="operateMode_span">操作类型：</span></td>
                <td width="35%" colspan="3">
        <html:radio property="operateMode" value="XOR"/>单人处理&nbsp;
        <html:radio property="operateMode" value="OR"/>多个消息一人处理&nbsp;
        <html:radio property="operateMode" value="AND"/>并行会签&nbsp;
        <html:radio property="operateMode" value="LOOP"/>顺序会签
        <html:radio property="operateMode" value="LYHD"/>路由分单</td>
        
                </tr>
              <tr >
                  <td width="15%" ><span id="routeSplitId_span">路由分单ID：</span></td>
                <td width="35%" colspan="3">
       <html:text name="ActivityForm" styleClass="formStyleall"  property="routeSplitId" styleId="routeSplitId"   />
        
                </td>
              </tr>
              <tr >
                <td width="15%" ><span id="operation_span">辅助按钮：</span></td>
                <td width="35%" colspan="3">
                 <fe:checkBox dictType="wfssOperation" property="operation" name="ActivityForm" dynamic="true"/>
                
                </td>
                
              </tr>
              
              <tr >
                <td width="15%" ><span id="isFirstNode_span">是否流程首操作：</span></td>
                <td width="35%" colspan="3">
                     <html:radio property="isFirstNode" value="Y"/>是&nbsp;
                     <html:radio property="isFirstNode" value="N"/>否
                    </td>
              </tr>
              
                <tr >
                <td width="15%" ><span id="onStartEvent_span">活动启动前事件：</span></td>
                <td width="35%">
               <html:text name="ActivityForm" styleClass="formStyleall"  property="onStartEvent" styleId="onStartEvent"   />
                 </td>
                <td width="15%" ><span id="onCompleteEvent_span">活动结束后事件：</span></td>
                <td width="35%">
                  <html:text name="ActivityForm" styleClass="formStyleall"  property="onCompleteEvent" styleId="onCompleteEvent"   />
                
                     </td>
              </tr>
              
              
              
               <tr >
                <td width="15%" ><span id="attachPrivilege_span">附件权限：</span></td>
                <td width="35%" colspan="3">
                <html:radio property="attachPrivilege" value="NONE"/>无附件&nbsp;
                <html:radio property="attachPrivilege" value="VIEW"/>查看附件&nbsp;
                <html:radio property="attachPrivilege" value="EDIT_OWN"/>管理自己附件&nbsp;
                <html:radio property="attachPrivilege" value="EDIT_ALL"/>管理所有附件&nbsp;
                </td>
                
              </tr>
              
               <tr >
                <td width="15%" ><span id="attachType_span">附件字典类型：</span></td>
                <td width="35%" colspan="3">
                 <html:text name="ActivityForm" styleClass="formStyleall"  property="attachType" styleId="attachType"   />
                </td>
              </tr>
              
                  <tr >
                <td width="15%" ><span id="attachTypeDynamic_span">动态字典类型：</span></td>
                <td width="35%">
                     <html:radio property="attachTypeDynamic" value="Y"/>是&nbsp;
                     <html:radio property="attachTypeDynamic" value="N"/>否
                 </td>
                <td width="15%" ><span id="attachTypeValueMode_span">字典类型值方式：</span></td>
                <td width="35%">
                     <html:radio property="attachTypeValueMode" value="VALUE"/>别名值&nbsp;
                     <html:radio property="attachTypeValueMode" value="ID"/>ID值
                     </td>
              </tr>
              
               <tr >
                <td width="15%" ><span id="isBatch_span">批量处理：</span></td>
                <td width="35%" colspan="3">
                 <html:radio property="isBatch" value="Y"/>是&nbsp;
                 <html:radio property="isBatch" value="N"/>否
                </td>
              </tr>
              
              <tr >
                <td width="15%" ><span id="notifyType_span">通知方式：</span></td>
                <td width="35%" colspan="3">
                   <html:radio property="notifyType" value="EMAIL"/>Email&nbsp;
                     <html:radio property="notifyType" value="NOTE"/>手机短信
                     <html:radio property="notifyType" value="BOTH"/>手机短信+Email
                     <html:radio property="notifyType" value="NONE"/>无
                </td>
              </tr>
              
               <tr >
                <td width="15%" ><span id="processButtonMode_span">待办流程按钮：</span></td>
                <td width="35%" colspan="3">
                   <html:radio property="processButtonMode" value="ONLY_SUBMIT"/>只有提交;
                     <html:radio property="processButtonMode" value="ALL_ROUTE"/>全部路由转按钮
                     <html:radio property="processButtonMode" value="BY_ROUTE"/>根据路由设定
                </td>
              </tr>
              
               <tr >
                <td width="15%" ><span id="initFormEvent_span">初始化表单事件：</span></td>
                <td width="35%" colspan="1">
                 <html:text name="ActivityForm" styleClass="formStyleall"  property="initFormEvent" styleId="initFormEvent"   />
                </td>
                
                <td width="15%" ><span id="initFormEvent_span">回退时表单事件：</span></td>
                <td width="35%" colspan="1">
                 <html:text name="ActivityForm" styleClass="formStyleall"  property="backFormEvent" styleId="backFormEvent"   />
                </td>
                
            
              </tr>
              
              
               <tr >
                <td width="15%" title="点击选择"><span id="reDoEvent_span">重处理事件：</span></td>
                <td width="35%" colspan="3">
                 <html:text name="ActivityForm" styleClass="formStyleall"  property="reDoEvent" styleId="reDoEvent"   />
                </td>
                
              </tr>
              
              <tr >
                <td width="15%" onclick="openEditField()" title="点击选择"><span id="editFieldsName_span">编辑字段：</span></td>
                <td width="35%" colspan="3">
                 <html:hidden name="ActivityForm" property="editFields" styleId="editFields" />
                <html:textarea name="ActivityForm" style="width=100%" readonly="true" rows="5" property="editFieldsName" styleId="editFieldsName"></html:textarea>
                  
                </td>
                
              </tr>
              
               <tr >
                
                <td width="15%" onclick="openNotNullFields()" title="点击选择"><span id="notNullFieldsName_span">必填字段：</span></td>
                <td width="35%" colspan="3">
                 <html:hidden name="ActivityForm" property="notNullFields" styleId="notNullFields" />
                <html:textarea name="ActivityForm" style="width=100%" rows="5" readonly="true" property="notNullFieldsName" styleId="notNullFieldsName"></html:textarea>
                </td>
              </tr>
              
             
             
        </table>
        </div>
        
        <div class='tab-page' id='tabPage5'>
        <h2 class='tab'>参与者</h2>
          <script type="text/javascript">tp1.addTabPage( document.getElementById( 'tabPage5' ));</script>
          <table width="100%" <%=tableStyle%>>
    
            
              
              <tr >
                <td width="10%" onclick="selectUser()">人员：</td>
                <td width="90%" colspan="3">
                  <html:hidden name="ActivityForm" property="partUserIds" styleId="partUserIds" />
                <html:textarea name="ActivityForm" style="width=100%" rows="5" readonly="true" property="partUserNames" styleId="partUserNames"></html:textarea>
                
                </td>
                
              </tr>
              
               <tr style="display:none">
                
                <td width="10%" onclick="selectOrg()">组织：</td>
                <td width="90%" colspan="3">
                
                <html:hidden name="ActivityForm" property="partOrgTypeCodes" styleId="partOrgTypeCodes" />
                <html:hidden name="ActivityForm" property="partOrgIds" styleId="partOrgIds" />
                <html:textarea name="ActivityForm" style="width=100%" rows="5" readonly="true" property="partOrgNames" styleId="partOrgNames"></html:textarea>
                
                </td>
              </tr>
              
              <tr style="display:none">
                
                <td width="10%" ><a href="#">角色：</a></td>
                <td width="90%" colspan="3">
                <html:hidden name="ActivityForm" property="partRoleIds" styleId="partRoleIds" />
                <html:textarea name="ActivityForm" style="width=100%" rows="5" readonly="true" property="partRoleNames" styleId="partRoleNames"></html:textarea>
                
                </td>
              </tr>
              
              <tr style="display:none">
                
                <td width="10%" ><a href="#">虚拟团队：</a></td>
                <td width="90%" colspan="3">
                <html:hidden name="ActivityForm" property="partTeamIds" styleId="partTeamIds" />
                <html:textarea name="ActivityForm" style="width=100%" rows="5" readonly="true" property="partTeamNames" styleId="partTeamNames"></html:textarea>
                
                </td>
              </tr>
              
              
               <tr style="display:none">
                
                <td width="10%" ><a href="#">岗位：</a></td>
                <td width="90%" colspan="3">
                <html:hidden name="ActivityForm" property="partPostIds" styleId="partPostIds" />
                <html:textarea name="ActivityForm" style="width=100%" rows="5" readonly="true" property="partPostNames" styleId="partPostNames"></html:textarea>
                
                </td>
              </tr>
             
        </table>
        </div>
        
        </div>
        </td>
    </tr>
</table>

 </fe:span>
  <fe:bottomTable>
        
  </fe:bottomTable>
 </html:form>
</fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardProcessEditTree_wfss.do?processId=<bean:write name="ActivityForm" property="processId"/>";
         <%
      }
      %>
    </script>    
</html>

