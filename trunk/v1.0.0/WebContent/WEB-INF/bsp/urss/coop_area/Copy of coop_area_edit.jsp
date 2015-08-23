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
        location.href="<%=baseURL%>/initCoopArea.do?parentId="+parentId;
    }
     function downAdd()
    {
       
        var coopAreaId=document.getElementById("coopAreaId").value;
        location.href="<%=baseURL%>/initCoopArea.do?parentId="+coopAreaId;
    }
    
     function deleteCoopArea()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
          alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
           document.getElementById("CoopAreaEdit").action="<%=baseURL%>/deleteCoopArea.do";
           document.getElementById("CoopAreaEdit").submit();
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
                 if(checkBoxObj[i].value==mtdObj.value)
                 {
                    alert("选择移动的角色中不能移动到自己的平级或下级");
                    return;
                 }
             }
           }
           var formObj=document.getElementById("CoopAreaEdit");
           formObj.action="<%=baseURL%>/moveCoopArea.do";
           formObj.submit();
        }
    }
}
    </script>
    </head>
    <html>
    <table <%=tableStyle%> width="100%">
            <tr class="ListTableHeader">
                <td colspan="4">
                    <div align="center">
                            <strong>
                            <logic:notEmpty name="CoopAreaForm" property="coopAreaId">修改协同区</logic:notEmpty> 
                            <logic:empty name="CoopAreaForm" property="coopAreaId">新增协同区</logic:empty> 
                             </strong>
                    </div>
                </td>
            </tr>
            <tr class=ListTableRow>
                <td colspan="4">
                
                    <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'CoopAreaEdit',0,'urss')" id='CoopAreaEdit_SAVE'>&nbsp;&nbsp;
                     
                   <logic:notEmpty name="CoopAreaForm" property="coopAreaId">
                    <input type='button' name='power_button'  value='新增平级'   class='Button3'  onclick="equalAdd()" id='CoopAreaEdit_SAVE'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='新增下级'   class='Button3'  onclick="downAdd()" id='CoopAreaEdit_SAVE'>&nbsp;&nbsp;
                    <logic:present name="subCoopAreaList">
                    <logic:notEmpty name="subCoopAreaList">
                    <input type='button' name='power_button'  value='移动'   class='Button3'  onclick="move()" id='CoopAreaEdit_move'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="deleteCoopArea()" id='delete_del'>&nbsp;&nbsp;
                   </logic:notEmpty>
                    </logic:present>
                  </logic:notEmpty> 
                  
                   </td>
            </tr>
    </table>
    
    <table width="100%" <%=tableStyle%>>
    <html:form action="/saveCoopArea.do"   styleId="CoopAreaEdit" method="post">
             <tr class="ListTableRow">
                <td width="20%" >所属父名称：</td>
                <td width="80%" colspan="3">
                  <html:hidden name="CoopAreaForm" property="parentId" styleId="parentId" />
                  <html:hidden name="CoopAreaForm" property="allParentId" styleId="allParentId" />
                  <html:hidden name="CoopAreaForm" property="regComId" styleId="regComId" />
                  <html:hidden name="CoopAreaForm" property="coopAreaId" styleId="coopAreaId" />
                  <input type="hidden" name="coopAreaNameOld" size="30" value="<bean:write name="CoopAreaForm"   property="coopAreaName"/>" id="coopAreaNameOld" class="formStyleall">
                 
                  <html:text name="CoopAreaForm" styleClass="formStyleall"  property="allParentName" styleId="allParentName"  size="60" readonly="true"/>
                </td>
              </tr>
              <tr class="ListTableRow">
                <td width="16%" >协同定义名称：</td>
                <td width="29%" colspan="1">
                     <html:text name="CoopAreaForm" styleClass="formStyleall"  property="coopAreaName" styleId="coopAreaName"  size="30" /><%=red%>
                </td>
                
                <td width="16%" >是否动态：</td>
                <td width="29%" colspan="1">
                <html:radio name="CoopAreaForm"   property="isDynamic" value="Y">是</html:radio>
                <html:radio name="CoopAreaForm"   property="isDynamic" value="N">否</html:radio>
                </td>
              </tr>
              
              
              <tr class="ListTableRow">
                <td width="16%" >图标：</td>
                <td width="29%" colspan="1">
                     <html:text name="CoopAreaForm" styleClass="formStyleall"  property="coopAreaImg" styleId="coopAreaImg"  size="40" /><%=red%>
                </td>
                
                <td width="16%" >排序号：</td>
                <td width="29%" colspan="1">
                   <html:text name="CoopAreaForm" styleClass="formStyleall"  property="orderShow" styleId="orderShow"  size="20" />
                </td>
              </tr>
              
             
    </table>
    <logic:present name="subCoopAreaList">
    <logic:notEmpty name="subCoopAreaList">
    <TABLE width="100%" <%=tableStyle%> align="center">
        <tr>
            <th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
            <th width="75%" align="center" class="ListTableHeader" nowrap="nowrap"><b>协同区名称</b></th>
            <th width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b>是否公用</b></th>
        </tr>
        
        <logic:iterate name="subCoopAreaList" id="coopArea" scope="request">
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="coopArea" property="coopAreaId"/>" >&nbsp;</td>
            <td >
            <a href="#" onclick="buttomOnClick('<%=baseURL%>/showCoopArea.do?coopAreaId=<bean:write name="coopArea" property="coopAreaId"/>','self')" >
              <bean:write name="coopArea" property="coopAreaName"/>&nbsp;
             </a>
             </td>
             <td  >
              <logic:equal name="coopArea" property="isDynamic" value="Y">是</logic:equal>
              <logic:equal name="coopArea" property="isDynamic" value="N">否</logic:equal>
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
                        <font color='#0000FF'>移到: <input type="hidden" name="moveToDataId" id="moveToDataId"> <input type="text" name="moveToDataName" size="30" value="" class="formStyleall" id="moveToDataName" readonly="true"> 之<input type='radio' checked name='upAndDown'
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
    <script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
           parent.left.location="<%=baseURL%>/bsp/urss/coop_area/coop_area_tree.jsp?reloadMid=false";
         <%
      }
      %>
    </script>
</html>


