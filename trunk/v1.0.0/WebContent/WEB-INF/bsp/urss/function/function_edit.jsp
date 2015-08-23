<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
        <style type="text/css">
        <!--
        #MOVE_Div {
        position: absolute;
        left: 20%;
        top: 15%;
        width: 300px;
        height: 165px;
        background-color: #FFFFFF;
        }
         -->
      </style>
    <script>
    function equalAdd()
    {
        var parentId=document.getElementById("parentId").value;
        var appId=document.getElementById("appId").value;
        location.href="<%=baseURL%>/initFunction_urss.do?parentId="+parentId+"&appId="+appId;
    }
     function downAdd()
    {
        var funModuleId=document.getElementById("funModuleId").value;
         var appId=document.getElementById("appId").value;
        location.href="<%=baseURL%>/initFunction_urss.do?parentId="+funModuleId+"&appId="+appId;
    }
     function deleteFunction()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
          alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("如果确定删除此数据\n\n 1:将联带删除所有子数据 \n 2:数据将不能恢复\n\n确定要删除选中的记录吗？")){
           document.getElementById("FunctionEdit").action="<%=baseURL%>/deleteFunction_urss.do";
           document.getElementById("FunctionEdit").submit();
        }
      
    }
    function move()
    {
      document.getElementById("MOVE_Div").style.display='';
    }
    function closeMove()
   {
    document.getElementById("MOVE_Div").style.display='none'
   }
   function Move_OK()
{
    var mtdObj=document.getElementById("moveToDataId");
    var mtdObjParent=document.getElementById("moveToDataParentId");
    
    if(mtdObj.value=='')
    {
        
        alert('请先在右边树中选择移入到的节点!');
        return;
    }
    else
    {
        if(getCheckBoxNum("itemIdCheckBox")==0)
        {
            
            alert('请选择要移动的数据!');
            return;
        }
        else
        {
            var checkBoxObj=document.getElementsByName("itemIdCheckBox");
          var checkBoxObj=document.getElementsByName("itemIdCheckBox");
           for(var i=0;i<checkBoxObj.length;i++)
           {
             if(checkBoxObj[i].checked)
             {
                
                
                 if(checkBoxObj[i].value==mtdObj.value||mtdObjParent.value.indexOf(checkBoxObj[i].value)>=0)
                 {
                    alert("选择移动的功能中不能移动到本身或者本身下级的平级或下级");
                    return;
                 }
                
             }
           }
           var formObj=document.getElementById("FunctionEdit");
           formObj.action="<%=baseURL%>/moveFunction_urss.do";
           formObj.submit();
        }
    }
}

function changeWindowInfo()
{
   if(event.srcElement.value=='YM')
   {
      document.getElementById("windowInfo").style.display='';
   }
   else
   {
      document.getElementById("windowInfo").style.display='none';
   }
}
    </script>
    </head>
    <fe:body moduleName="urss" formId="FunctionEdit" prompt="true">
     <fe:span subHeight="20">
     <br />
        <center>
            <font size=4><b>功能/资源管理</font>
        </center>
        <br />
        
    <table border="0" width="96%" align="center">
    <tr>
        <td>
        <div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
        <div class="tab-page" id="tabPage2">
        <h2 class="tab">基本信息</h2>
        <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
        <fe:topTable width="100%">

                  <fe:powerTool funCode="urss_function" groupName="edit_fun"/>
                     
                   
                 
    </fe:topTable>
    <table cellspacing="0" cellpadding="3" width="100%" class="tform" align=center>
    <html:form action="/saveFunction_urss.do"   styleId="FunctionEdit" method="post">
             <tr >
                <td width="20%" >所属父名称：</td>
                <td width="80%" colspan="3">
                  <html:hidden name="FunctionForm" property="parentId" styleId="parentId" />
                  <html:hidden name="FunctionForm" property="allParentId" styleId="allParentId" />
                  <html:hidden name="FunctionForm" property="appId" styleId="appId" />
                  <html:hidden name="FunctionForm" property="funModuleId" styleId="funModuleId" />
                  <input type="hidden" name="funModuleNameOld" size="30" value="<bean:write name="FunctionForm"   property="funModuleName"/>" id="funModuleNameOld" class="formStyleall">
                  <html:text name="FunctionForm" styleClass="formStyleall"  property="allParentName" styleId="allParentName"  size="60" readonly="true"/>
                </td>
              </tr>
              <tr >
                <td width="16%" ><span id="funModuleName_span">功能名称:</span></td>
                <td width="29%" colspan="1">
                  
                 <input type="hidden" name="functionNameOld" value="<bean:write name="FunctionForm" property="funModuleName"/>" id="functionNameOld">
                     <html:text name="FunctionForm" styleClass="formStyleall"  property="funModuleName" styleId="funModuleName"  size="30" />
                </td>
                
                <td width="16%" ><span id="funCode_span">功能编号:</span></td>
                <td width="29%" colspan="1">
                  <html:text name="FunctionForm" styleClass="formStyleall"  property="funCode" styleId="funCode"  size="30" />
                </td>
              </tr>
              
              <tr >
                <td width="16%" ><span id="isMenu_span">是否菜单:</span></td>
                <td width="29%" colspan="1">
                    <html:radio name="FunctionForm"   property="isMenu" value="Y">是</html:radio>
                <html:radio name="FunctionForm"   property="isMenu" value="N">否</html:radio>
                </td>
                
                <td width="16%" ><span id="isPublic_span">是否公用:</span></td>
                <td width="29%" colspan="1">
                <html:radio name="FunctionForm"   property="isPublic" value="Y">是</html:radio>
                <html:radio name="FunctionForm"   property="isPublic" value="N">否</html:radio>
                
                </td>
              </tr>
              
             
              
               <tr >
                <td width="20%" ><span id="smallImg_span">菜单图标:</span></td>
                <td width="80%" colspan="3">
                 <html:text name="FunctionForm" styleClass="formStyleall"  property="smallImg" styleId="smallImg"  size="60" />
                </td>
              </tr>
              
              <tr >
                <td width="20%" ><span id="bigImg_span">桌面图标:</span></td>
                <td width="80%" colspan="3">
                 <html:text name="FunctionForm" styleClass="formStyleall"  property="bigImg" styleId="bigImg"  size="60" />
                </td>
              </tr>
              
              <tr >
                <td width="20%" ><span id="implUrl_span">实现的URL:</span></td>
                <td width="80%" colspan="3">
                 <html:text name="FunctionForm" styleClass="formStyleall"  property="implUrl" styleId="implUrl"  size="60" />
                </td>
              </tr>
              
              <tr >
                <td width="16%" ><span id="orderIndex_span">排序号:</span></td>
                <td width="29%" colspan="1">
                 <html:text name="FunctionForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="6" />
                </td>
                
                <td width="16%" ><span id="windowStyle_span">窗口打开方式:</span></td>
                <td width="29%" colspan="1">
                <html:select name="FunctionForm"   property="windowStyle" styleId="windowStyle" onchange="changeWindowInfo()">
                   <html:option value="I">内嵌</html:option>
                    <html:option value="YM">模态窗口</html:option>
                     <html:option value="NM">非态式窗口</html:option>
                </html:select>
                
                <logic:equal name="FunctionForm"   property="windowStyle" value="YM">
                <span id="windowInfo"  >
                高度 <html:text name="FunctionForm" styleClass="formStyleall"  property="windowHeight" styleId="windowHeight"  size="4" />
                宽度 <html:text name="FunctionForm" styleClass="formStyleall"  property="windowWidth" styleId="windowWidth"  size="4" />
                </div>
                </logic:equal>
                <logic:notEqual name="FunctionForm"   property="windowStyle" value="YM">
                <span id="windowInfo" style="display:none">
                高度 <html:text name="FunctionForm" styleClass="formStyleall"  property="windowHeight" styleId="windowHeight"  size="4"/>
                宽度 <html:text name="FunctionForm" styleClass="formStyleall"  property="windowWidth" styleId="windowWidth"  size="4" />
                </div>
                </logic:notEqual>
                
                </td>
              </tr>
                <tr >
                <td width="16%" ><span id="foldArea_span">是否自动收缩:</span></td>
                <td width="29%" colspan="3" >
                    <html:radio name="FunctionForm"   property="foldArea" value="Y">是</html:radio>
                <html:radio name="FunctionForm"   property="foldArea" value="N">否</html:radio>
                </td>
                
                
              </tr>
             
    </table>
    <logic:present name="subFunctionList">
    <logic:notEmpty name="subFunctionList">
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
     <thead>
        <tr>
            <th align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
            <th width="40%" align="center"  nowrap="nowrap"><b>功能名称</b></th>
            <th width="35%" align="center"  nowrap="nowrap"><b>功能编号</b></th>
            <th width="20%" align="center"  nowrap="nowrap"><b>是否公用</b></th>
        </tr>
         </thead>
        <logic:iterate name="subFunctionList" id="function" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="function" property="funModuleId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showFunction_urss.do?funModuleId=<bean:write name="function" property="funModuleId"/>','self')" >
              <bean:write name="function" property="funModuleName"/>&nbsp;
             </a>
             </td>
              <td>
               <bean:write name="function" property="funCode"/>&nbsp;
               
             </td>
             <td>
              <logic:equal name="function" property="isPublic" value="Y">是</logic:equal>
              <logic:equal name="function" property="isPublic" value="N">否</logic:equal>
             </td>
        </tr>
        </logic:iterate>
        
    </table>
    
    </logic:notEmpty>
    </logic:present>
    
    <DIV id='MOVE_Div' style='display:none'>
        <iframe src='' style='position:absolute; visibility:inherit; top:0px; left:0px; width:380px; height:220px; z-index:-1;' filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';></iframe>
        <TABLE width='380' align='center' border='1' cellSpacing='0' cellpadding='3' bordercolorlight='#E2D7CF' bordercolordark='#FAF8F6'>
            <TR>
                <TD align="center">
                    <img src='<%=baseURL%>/bsp/abdf/skins/default/img/public/right.gif'>
                    <br>
                    请在左边树中选择移入到的节点
                </TD>
            </TR>
            <TR>
                <iframe style='display:none'></iframe>
                <TD height='21'>
                    <div align='center'>
                        <font color='#0000FF'>移到: <input type="hidden" name="moveToDataId" id="moveToDataId">
                        <input type="hidden" name="moveToDataParentId" id="moveToDataParentId"> 
                         <input type="text" name="moveToDataName" size="30" value="" class="formStyleall" id="moveToDataName" readonly="true"> 之<input type='radio' checked name='upAndDown'
                                value='down' />下级&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='upAndDown' value='equals' />平级 </font>
                    </div>
                </TD>
            </TR>
            <TR>
                <iframe style='display:none'></iframe>
                <TD height='21'>
                    <div align='center'>
                        <input type='button' name='Submit' value='确定' class='Button3' onclick='Move_OK()'>
                        <input type='button' name='Submit' value='关闭' class='Button3' onclick='closeMove()'>
                    </div>
                </TD>
            </TR>
        </TABLE>
    </div>
    
     </html:form>
        </div>
        <logic:notEmpty name="FunctionForm" property="funModuleId">
        <div class='tab-page' id='tabPage3' height="350">
        <h2 class='tab'>权限资源</h2>
        <script type="text/javascript">tp1.addTabPage( document.getElementById( 'tabPage3' ));</script>
         <IFRAME height="350" width="98%" scrolling="auto" frameborder="0" src="<%=baseURL%>/getAllResourceByFunId_urss.do?funModuleId=<bean:write name="FunctionForm" property="funModuleId"/>&appId=<bean:write name="FunctionForm" property="appId"/>"></IFRAME>
        </div>
        
        <div class='tab-page' id='tabPage4' height="350">
        <h2 class='tab'>查询字段</h2>
        <script type="text/javascript">tp1.addTabPage( document.getElementById( 'tabPage4' ));</script>
         <IFRAME height="350" width="98%" scrolling="auto" frameborder="0" src="<%=baseURL%>/getAllReportQueryParaByFunId_urss.do?funModuleId=<bean:write name="FunctionForm" property="funModuleId"/>&appId=<bean:write name="FunctionForm" property="appId"/>"></IFRAME>
        </div>
        
        <div class='tab-page' id='tabPage5' height="350">
        <h2 class='tab'>附件资源</h2>
        <script type="text/javascript">tp1.addTabPage( document.getElementById( 'tabPage5' ));</script>
         <IFRAME height="350" width="98%" scrolling="auto" frameborder="0" src="<%=baseURL%>/getAllReportFileByFunId_urss.do?funModuleId=<bean:write name="FunctionForm" property="funModuleId"/>&appId=<bean:write name="FunctionForm" property="appId"/>"></IFRAME>
        </div>
        </logic:notEmpty>
        
    
        
        
        </div>
        </td>
    </tr>
</table>
 </fe:span>
<fe:bottomTable>
    <strong>
        <logic:notEmpty name="FunctionForm" property="funModuleId">修改功能</logic:notEmpty> 
            <logic:empty name="FunctionForm" property="funModuleId">新增功能</logic:empty> 
    </strong>
</fe:bottomTable>
</fe:body>
    <script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/forwardFunctionTree_urss.do?appId=<bean:write name="FunctionForm" property="appId"/>&reloadMid=false";
         <%
      }
      %>
    </script>
</html>


