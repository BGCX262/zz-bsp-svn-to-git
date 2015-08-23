<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>    
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
       function changeARole()
       {
          var obj=document.getElementById("toActivityRule");
           var objToA=document.getElementById("toActivityId");
          if(obj.value=="")
          {
             document.getElementById("toActivityEvent").value="";
              document.getElementById("toActivityId").disabled=true;
               document.getElementById("toActivityEvent").readOnly=true;
             for(var i=0;i<objToA.options.length;i++)
             {
                if(objToA.options[i].value=="")
                {
                   objToA.options[i].selected=true;
                }
             }
          }
          else if(obj.value=="eventActivity")
          {
               document.getElementById("toActivityEvent").readOnly=false;
               document.getElementById("toActivityId").disabled=true;
                for(var i=0;i<objToA.options.length;i++)
                 {
                    if(objToA.options[i].value=="")
                    {
                       objToA.options[i].selected=true;
                    }
                 }
          }
          else if(obj.value=='toActivity')
          {
             document.getElementById("toActivityId").disabled=false;
             document.getElementById("toActivityEvent").value="";
             document.getElementById("toActivityEvent").readOnly=true;
          }
       }
       function backProcess(obj) {
        buttomOnClick('<%=baseURL%>/queryPageProcess_wfss.do','parent');
    }
    </script>
    </head>
    <fe:body moduleName="wfss" formId="routeEdit">
    <fe:topTable>
      <fe:powerTool funCode="wfss_process_mrg" groupName="route_edit"/>
    </fe:topTable>
    <fe:span>
      <br />
        <center>
            <font size=4><b>流程管理</font>
        </center>
        <br />
    
    <html:form action="/saveRoute_wfss.do"   styleId="routeEdit" method="post" style="margin: 0px">
        <table border="0" width="98%" align="center">
    <tr>
        <td>
        <div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
        <div class="tab-page" id="tabPage2">
        <h2 class="tab">基本信息</h2>
        <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
        <table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
    
            <tr >
                <td width="15%" ><span id="routeName_span">路由名称:</span></td>
                <td width="85%" colspan="3"/>
                        <input type="hidden" name="processId" id="processId" value="<bean:write name="activity" property="processId"/>"/>
                        <input type="hidden" name="activityId" id="activityId" value="<bean:write name="activity" property="activityId"/>"/>
                        <html:hidden name="RouteForm" property="routeId" styleId="routeId" />
                        <INPUT type="hidden" value="<bean:write name="RouteForm" property="routeName"/>" name="routeNameOld">
                        <html:text name="RouteForm" styleClass="formStyleall"  property="routeName" styleId="routeName"  size="60" />
                </td>
                </tr>
                <tr>
                <td width="15%"><span id="routeAlias_span">路由别名:</span></td>
                <td width="35%">               
                  <html:text name="RouteForm" styleClass="formStyleall"  property="routeAlias" styleId="routeAlias"  size="25" />
                </td>
                <td width="20%"><span id="orderIndex_span">排序号：</td>
                <td width="35%">    
                  <INPUT type="hidden" value="<bean:write name="RouteForm" property="orderIndex" format="0.00"/>" name="orderIndexOld">            
                  <html:text name="RouteForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="25" />
                </td>
            </tr>
            <tr >
                <td width="16%" ><span id="toProcessId_span">所指向下游流程：</td>
                <td width="29%">
                   <fe:dropDown disabled="true"  dictType="ProcessByAppId" property="toProcessId" name="RouteForm" dynamic="true" struts="true" onchange="Control_LinkDropDown(this,'toActivityId','activity')"/>
                 
                        </td>
                <td width="20%"><span id="toActivityRule_span">所指向下游活动规则：</td>
                <td width="35%">
                
                <html:select name="RouteForm" property="toActivityRule" onchange="changeARole()" styleId="toActivityRule" disabled="true">   
                      <html:option value="">--请选择--</html:option>   
                      <html:option value="toActivity">--指定环节--</html:option> 
                      <html:option value="eventActivity">--自定义事件--</html:option>  
               </html:select>
               </td>
            </tr>
                
            <tr >
                <td width="16%" ><span id="toActivityId_span">所指向下游活动：</td>
                <td width="29%" colspan="3">
                <fe:dropDown dictType="activity" property="toActivityId" name="RouteForm" dynamic="true" struts="true" disabled="true"/>
                   </td>
                
            </tr>
            
             <tr >
            
                <td width="20%"><span id="routeAlias_span">所指向下游活动规则事件：</td>
                <td width="35%" colspan="3">           
                  <html:text name="RouteForm" styleClass="formStyleall"  property="toActivityEvent" styleId="toActivityEvent"  size="25" readonly="true"/>
                </td>
            </tr>
            
            
            <tr >
            
                        <td width="20%"><span id="isRejectRoute_span">是否驳回路由：</td>
                <td width="35%">
                         <html:radio property="isRejectRoute" value="Y"/>是&nbsp;
                            <html:radio property="isRejectRoute" value="N"/>否               
                  </td>
                <td width="20%"><span id="isPointToEnd_span">是否指向流程结束：</td>
                <td width="35%">
                    <html:radio property="isPointToEnd" value="Y"/>是&nbsp;
                    <html:radio property="isPointToEnd" value="N"/>否               
                  </td>
            </tr>
            <tr style="display:none">
                <td width="16%" ><span id="isDefaultRoute_span">是否默认路由：</td>
                <td width="29%">
                           <html:radio property="isDefaultRoute" value="Y"/>是&nbsp;
                           <html:radio property="isDefaultRoute" value="N"/>否
                </td>
                <td width="16%" ><span id="fliterExpr_span">过滤策略：</td>
                <td width="29%">
                <html:text name="RouteForm" styleClass="formStyleall"  property="fliterExpr" styleId="fliterExpr"  size="25" />
                 
                    </td>
            </tr>

            <tr style="display:none">
                <td width="16%" ><span id="andRoute_span">并选路由：</td>
                <td width="29%">    
                        <html:text name="RouteForm" styleClass="formStyleall"  property="andRoute" styleId="andRoute"  size="25" />
                </td>
                <td width="20%"><span id="xorRoute_span">互斥路由：</td>
                <td width="35%">               
                  <html:text name="RouteForm" styleClass="formStyleall"  property="xorRoute" styleId="xorRoute"  size="25" />
                </td>
            </tr>
            
             <tr >
                <td width="16%" ><span id="isButto_span">是否按钮：</td>
                <td width="29%">    
                  <html:radio property="isButton" value="Y"/>是&nbsp;
                  <html:radio property="isButton" value="N"/>否            
                </td>
                <td width="20%"><span id="xorStrategy_span">会签流转策略：</td>
                <td width="35%">    
                           
                <html:radio property="xorStrategy" value="BY_VALUE"/>指定值&nbsp;
                  <html:radio property="xorStrategy" value="BY_END_USER"/>最后会签人决定        
                 
                </td>
            </tr>
             <tr >
                <td width="15%" ><span id="xorStrategyScale_span">会签流转策略值：</td>
                <td width="35%" colspan="1">    
                        <html:text name="RouteForm" styleClass="formStyleall"  property="xorStrategyScale" styleId="xorStrategyScale"  size="4" />%
                </td>
                
                <td width="15%" ><span id="batchFlag_span">批量处理标示：</td>
                <td width="35%" colspan="1">    
                        <html:text name="RouteForm" styleClass="formStyleall"  property="batchFlag" styleId="batchFlag"  size="25" />
                </td>
                
            </tr>    
            
             <tr style="display:none">
                <td width="15%" ><span id="participantExpr_span">参与者策略(选择之前)：</td>
                <td width="85%" colspan="3">    
                        <html:text name="RouteForm" styleClass="formStyleall"  property="participantExpr" styleId="participantExpr"  size="25" />
                </td>
                
            </tr>        
            
                        <tr >
                <td width="15%" ><span id="memo_span">备注：</td>
                <td width="85%" colspan="3">
                        <html:textarea name="RouteForm"   property="memo" styleId="memo" rows="6" style="width:100%"></html:textarea>    
                        
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
      <strong>
        <logic:notEmpty name="RouteForm" property="routeId">修改路由定义</logic:notEmpty> 
        <logic:empty name="RouteForm" property="routeId">新增路由定义</logic:empty> 
     </strong>
    </fe:bottomTable>
    </fe:body>
<script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardProcessEditTree_wfss.do?processId=<bean:write name="activity" property="processId"/>";
         <%
      }
      %>
      changeARole();
    </script>    
</html>

