<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>
 <script>
 
  function deleteDictTree()
    {
     var editModel_fireeagleTemp=editModel_fireeagle;
       editModel_fireeagle=false;
       var formObj=document.getElementById("<bean:write name="dictTreeType" property="formId"/>");
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
          alert("请选择一条记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
            formObj.action="<%=baseURL%>/deleteTreeNodeObject_abdf.do";
           formObj.submit();
        }
    }
    
    function equalAdd()
    {
        var parentId=document.getElementById("parentId").value;
        location.href="<%=baseURL%>/initTreeNodeObject_abdf.do?treeType=<bean:write name="dictTreeType" property="treeTypeCode" />&parentId="+parentId;
    }
     function downAdd()
    {
        var parentId=document.getElementById("id").value;
       location.href="<%=baseURL%>/initTreeNodeObject_abdf.do?treeType=<bean:write name="dictTreeType" property="treeTypeCode" />&parentId="+parentId;
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
        
        alert('请先在右边树中选择移入到的<bean:write name="dictTreeType" property="treeTypeName"/>!');
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
                    alert("选择移动的<bean:write name="dictTreeType" property="treeTypeName"/>中不能移动到本身或者本身下级的平级或下级");
                    return;
                 }
                
             }
           }
           var formObj=document.getElementById("<bean:write name="dictTreeType" property="formId"/>");
           formObj.action="<%=baseURL%>/moveTreeNode_abdf.do";
           formObj.submit();
        }
    }
}
 </script>
</head>
<bean:define id="formId" name="dictTreeType" property="formId" />

<bean:define id="moduleCode" name="dictTreeType" property="moduleCode" />

<fe:body formId="<%=formId.toString()%>"
    moduleName="<%=moduleCode.toString()%>">
    <fe:topTable>
        <input type='button' name='power_button' value='保存' class='Button3'
            onclick="submitForm(this,'<%=formId.toString()%>',0,'<%=moduleCode.toString()%>')" id='<%=formId.toString()%>_save'>&nbsp;&nbsp; 
        <logic:notEmpty name="TreeForm" property="id">
                    <input type='button' name='power_button'  value='新增平级'   class='Button3'  onclick="equalAdd()" >&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='新增下级'   class='Button3'  onclick="downAdd()" >&nbsp;&nbsp;
                    <logic:present name="subTreeNodes">
                    <logic:notEmpty name="subTreeNodes">
                    <input type='button' name='power_button'  value='移动下级'   class='Button3'  onclick="move()" >&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='删除下级'   class='Button3'  onclick="deleteDictTree()" id='delete_del'>&nbsp;&nbsp;
                   </logic:notEmpty>
                    </logic:present>
       </logic:notEmpty>       
    </fe:topTable>

    <fe:span>

        <br />
        <center><font size=4><b><bean:write name="dictTreeType" property="treeTypeName" /></font></center>
        <br />
        <table border="0" width="80%" align="center">
            <tr>
                <td>
                <div class="tab-pane" id="tabPane1"><script
                    type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
                <div class="tab-page" id="tabPage2">
                <h2 class="tab">基本属性</h2>
                <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
                <form name="<bean:write name="dictTreeType" property="formId"/>"
                    method="post" action="<%=baseURL%>/saveTreeNodeObject_abdf.do"
                    style="margin: 0px"
                    id="<bean:write name="dictTreeType" property="formId"/>">
                    <html:hidden name="TreeForm" property="id" styleId="id" />
                    <html:hidden name="TreeForm" property="parentId" styleId="parentId" />
                    <html:hidden name="TreeForm" property="deleteFlag" styleId="deleteFlag" />
                    
                    <html:hidden name="TreeForm" property="allParentId" styleId="allParentId" />
                    <html:hidden name="dictTreeType" property="treeTypeCode" styleId="treeTypeCode" />
                    
                    <input type="hidden" name="nameOld" value="<bean:write name="TreeForm" property="name"/>" id="nameOld"/>
                    <input type="hidden" name="orderIndexOld" value="<bean:write name="TreeForm" property="orderIndex" format="#.##"/>" id="orderIndex"/>
                    
                <table cellspacing="0" cellpadding="3" width="100%" class="tform"
                    align=center>
                    <tr>
                        <td width="15%" >所属父：</td>
                        <td width="35%" colspan="3"><html:text name="TreeForm"
                            property="allParentName" styleId="allParentName" size="50"
                            styleClass="formStyleall" readonly="true" /></td>
                        
                    </tr>
                    <tr>
                        <td width="15%"><span id="name_span">名称：</span></td>
                        <td width="35%"><html:text name="TreeForm"
                            property="name" styleId="name" size="30"
                            styleClass="formStyleall"  /></td>
                        <td width="15%"><span id="orderIndex_span">排序号：</span></td>
                        <td width="35%"><html:text name="TreeForm"
                            property="orderIndex" styleId="orderIndex" size="6"
                            styleClass="formStyleall"  /></td>
                    </tr>
                </table>    <logic:notEmpty name="subTreeNodes" scope="request">
                    <TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
    <thead>
    <tr>
        
            <td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
        <td align="center" ><font color="#000000"><b><bean:write name="dictTreeType" property="treeTypeName"/>名称</b></font></td>
            </tr>
    </thead>    
            
        
        <logic:iterate name="subTreeNodes" id="itemTree" scope="request" >
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
        
            <td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="itemTree" property="id"/>" ></td>
            
            <td  >
                 <A href = "<%=baseURL %>/showTreeNodeObject_abdf.do?id=<bean:write name="itemTree" property="id"/>&treeTypeCode=<bean:write name="dictTreeType" property="treeTypeCode"/>"><bean:write name="itemTree" property="name"/> </A>
             </td>
        </tr>
        </logic:iterate>
        
    </table>
    </logic:notEmpty>
                
                </div>

                </div>
                </td>
            </tr>
        </table>
 <DIV id='MOVE_Div' style='display:none' >
        <TABLE width='10' align='center' border='1' cellSpacing='0' cellpadding='3' bordercolorlight='#E2D7CF' bordercolordark='#FAF8F6'>
            <TR>
                <TD align="center">
                    请在左边树中选择移入到的节点
                </TD>
            </TR>
            <TR>
                
                <TD >
                    <div align='center'>
                        <font color='#0000FF'>移到 <input type="hidden" name="moveToDataId" id="moveToDataId"> 
                        <input type="hidden" name="moveToDataParentId" id="moveToDataParentId"> 
                        <input type="hidden" name="moveToDataAllId" id="moveToDataAllId"> 
                        <input type="text" name="moveToDataName" size="30" value="" class="formStyleall" id="moveToDataName" readonly="true"> 之<input type='radio' checked name='upAndDown'
                                value='down' />下级&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='upAndDown' value='equals' />平级 </font>
                    </div>
                </TD>
            </TR>
            <TR>
                
                <TD >
                    <div align='center'>
                        <input type='button' name='Submit' value='确定' class='Button3' onclick='Move_OK()'>
                        <input type='button' name='Submit' value='关闭' class='Button3' onclick='closeMove()'>
                    </div>
                </TD>
            </TR>
        </TABLE>
        </div>
        
        </form>
    </fe:span>
    
    <fe:bottomTable>
        <logic:notEmpty name="TreeForm" property="id">修改<bean:write name="dictTreeType" property="treeTypeName" /></logic:notEmpty> 
        <logic:empty name="TreeForm" property="id">新增<bean:write name="dictTreeType" property="treeTypeName" /></logic:empty>
    </fe:bottomTable>
</fe:body>
 <script>
      <%String reloadTree=(String)request.getAttribute("reloadTree");
      if(reloadTree!=null&&reloadTree.equals("true"))
      {
         %>
          
           parent.left.location="<%=baseURL%>/forwardSyncTree_abdf.do?treeType=<bean:write name="dictTreeType" property="treeTypeCode" />";
         <%
      }
      %>
    </script>
</html>

