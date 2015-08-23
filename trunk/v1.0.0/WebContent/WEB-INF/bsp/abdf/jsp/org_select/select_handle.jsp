<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<script type="text/javascript">
<!--
function isCanAdd(orgType)
{
  var canSelectedOrgType=parent.orgVo.getSelectOrgType();
  if(canSelectedOrgType=='!YG')
  {
      if(orgType=="YG")
      {
         return false
      }
      else
      {
         return true;
      }
  }
  var tempArr=canSelectedOrgType.split(",");
  for(var i=0;i<tempArr.length;i++)
  {
    if(orgType==tempArr[i])
    {
       return true;
    }
  }
  return false;
}

function addOrg()
{
    var orgSelectTbody=parent.selectedFrame.document.getElementById("orgSelectTbody");
    var objTableLength=orgSelectTbody.rows.length;
   var handleTypeObj=parent.offerSelectFrame.document.getElementById("handleType");
   var handleTypeValue=handleTypeObj.value;
   if(handleTypeValue=='orgTree')
   {
      var orgNameObj=parent.offerSelectFrame.document.getElementById("orgName");
      var orgType=orgNameObj.getAttribute("orgType");
      var orgId=orgNameObj.getAttribute("orgId");
      if(orgId==null||orgId=='')
      {
        alert("请先在组织织架构树中选择一个组织！")
        return;
      }
      var canAdd=isCanAdd(orgType);
      if(!canAdd)
      {
         alert("系统设定不能选择的组织!");
         return;
      }
      if(objTableLength>1&&parent.orgVo.getSize()==1)
      {
         alert("系统设定只能选择一个，请确认!");
         return;
      }
      if(!isExistSelected(orgId))
         createOrgRow(orgNameObj,orgSelectTbody);
   }
}
function isExistSelected(orgId)
{
   var orgSelectTbody=parent.selectedFrame.document.getElementById("orgSelectTbody");
   var objTableLength=orgSelectTbody.rows.length;
   var add=true;
   var rowObj=null;
   for(var i=1;i<objTableLength;i++)
   {
    var orgIdTemp=orgSelectTbody.rows[i].children[0].children[0].value;
    if(orgId==orgIdTemp)
    {
       add=false;
       rowObj=orgSelectTbody.rows[i];
    }
    orgSelectTbody.rows[i].setAttribute("bgColor","");
   }
      if(!add)
      {
           rowObj.setAttribute("bgColor","#FF0000");
           alert("当前操作对象已添加，请确认！");
           return true;
      }
  return false;
}
function createOrgRow(valueObj,tbodyObj)
{
      var orgId=valueObj.getAttribute("orgId");
      var orgName=valueObj.getAttribute("orgName");
      var allParentIds=valueObj.getAttribute("allParentIds");
      var allParentNames=valueObj.getAttribute("allParentNames");
      var allParentTypes=valueObj.getAttribute("allParentTypes");
      var orgTypeName=valueObj.getAttribute("orgTypeName");
      var orgType=valueObj.getAttribute("orgType");
      var objTableLength=tbodyObj.rows.length;
      var myrow=tbodyObj.insertRow(objTableLength);
      var mycell=myrow.insertCell();
      mycell.className="";
      mycell.setAttribute("align","center");
      mycell.innerHTML="<input type='checkBox'  name='orgItem' orgId='"+orgId+"' orgName='"+orgName+"' orgType='"+orgType+"' value='"+orgId+"' allParentIds='"+allParentIds+"' allParentNames='"+allParentNames+"' allParentTypes='"+allParentTypes+"'>";
      mycell=myrow.insertCell();
      mycell.className="";
      mycell.innerHTML=orgName;
      mycell=myrow.insertCell();
      mycell.className="";
      mycell.innerHTML=orgTypeName;
}

 function moveDown()
  {
      var orgSelectTbody=parent.selectedFrame.document.getElementById("orgSelectTbody");
      var objTableLength=orgSelectTbody.rows.length;
      var rowObj=null;
      var totalSelectNum=0;
      var index=0;
      for(var i=1;i<objTableLength;i++)
      {
         var orgItem=orgSelectTbody.rows[i].children[0].children[0];
         if(orgItem.checked)
         {
            totalSelectNum=totalSelectNum+1;
            index=i;
         }
      }
      if(totalSelectNum!=1)
       {
          alert("请选择一条要移动的记录，请确认！")
          return;
       }
      if(index==objTableLength-1)
      {
          alert("当前记录已是最底端记录，请确认！")
          return;
      }
     orgSelectTbody.moveRow(index+1,index);
  }
  
    function moveUp()
    {
      var orgSelectTbody=parent.selectedFrame.document.getElementById("orgSelectTbody");
      var objTableLength=orgSelectTbody.rows.length;
      var rowObj=null;
      var totalSelectNum=0;
      var index=0;
      for(var i=1;i<objTableLength;i++)
      {
         var orgItem=orgSelectTbody.rows[i].children[0].children[0];
         if(orgItem.checked)
         {
           totalSelectNum=totalSelectNum+1;
           index=i;
         }
      }
    if(totalSelectNum!=1)
    {
         alert("请选择一条要移动的记录，请确认！")
         return;
    }
    if(index==1)
    {
        alert("当前记录已是最顶端记录，请确认！")
        return;
    }
    orgSelectTbody.moveRow(index-1,index);
 }
 
 function delAllOrg()
  {
      var orgSelectTbody=parent.selectedFrame.document.getElementById("orgSelectTbody");
      var orgItems=parent.selectedFrame.document.getElementsByName("orgItem");
      if(orgItems==null || orgItems.length==0) return;
      var totalSelectNum=0;
      
      for(var i=orgSelectTbody.rows.length-1;i>=1;i--)
      {
        var orgItem=orgSelectTbody.rows[i].children[0].children[0];
        orgItem.checked=true;
       
      }
    delOrg();
  }
  
   function delOrg()
         {
             var orgSelectTbody=parent.selectedFrame.document.getElementById("orgSelectTbody");
             var orgItems=parent.selectedFrame.document.getElementsByName("orgItem");
             if(orgItems==null || orgItems.length==0) return;
             var totalSelectNum=0;
             var objCheck=parent.offerSelectFrame.document.getElementsByTagName("INPUT");
             for(var i=orgSelectTbody.rows.length-1;i>=1;i--)
             {
                var orgItem=orgSelectTbody.rows[i].children[0].children[0];
                if(orgItem.checked)
                {
                    for(var ii=0;ii<objCheck.length;ii++)
                    {
                       if((objCheck[ii].value==orgItem.value))
                       {
                            objCheck[ii].checked=false;
                            break;
                       }
                    }
                   totalSelectNum=totalSelectNum+1;
                   orgSelectTbody.removeChild(orgSelectTbody.rows[i]);
                }
             }
             if(totalSelectNum==0)
             {
                alert("请在'已选组织'中选择至少一项进行删除！")
             }
         }
         
         function disabledBatch()
         {
             
             if(parent.orgVo.getSize()==1)
              {
                document.getElementById("addBacth").disabled=true;
                document.getElementById("allChild").disabled=true;
                document.getElementById("moveDown").disabled=true;
                document.getElementById("moveUp").disabled=true;
                document.getElementById("delOrg").disabled=true;
                
             }
         }
//-->
</script>
<html>
    <head>
        <title>接钮操作</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        -->
     </style>
    </head>

    <body onload="disabledBatch()">
        <table border="0" width="100%" align="center" >
            <tr>
                <td valign="middle" height="380">
                    <input type='button' name='Submit'   value='新增' class='Button3' onclick="addOrg()"><br><br>
                    <input type="checkbox" name="checkbox" value="checkbox" id="allChild">所有下级
                    <input type='button' name='Submit'   value='批量新增' class='Button3' onclick="delOrg()" id="addBacth"><br><br>
                   <input type='button' name='Submit'   value='删除' class='Button3' onclick="delOrg()" id="delOrg"><br><br>
                   <input type='button' name='Submit'   value='全删' class='Button3' onclick="delAllOrg()"><br><br>
                    <input type='button' name='Submit'   value='上移' class='Button3' onclick="moveUp()" id="moveUp"><br><br>
                    <input type='button' name='Submit'   value='下移' class='Button3' onclick="moveDown()" id="moveDown"><br><br>
                   
                </td>
            </tr>
          </table>
    </body>
</html>

