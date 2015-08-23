<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<script type="text/javascript">
<!--
function addPost()
{
  
    var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
    var objTableLength=postSelectTbody.rows.length;
    var postItems=parent.offerSelectFrame.document.getElementsByName("postItem");
    for(var i=0;i<postItems.length;i++)
    {
       if(postItems[i].checked)
       {
          if(!isExistSelected(postItems[i].value))
              createPostRow(postItems[i],postSelectTbody);
           else
           {
              return;
           }
       }
    }
}


function addAllPost()
{
  
  
    var postItems=parent.offerSelectFrame.document.getElementsByName("postItem");
    for(var i=0;i<postItems.length;i++)
    {
       postItems[i].checked=true;
    }
    addPost();
}

function createPostRow(valueObj,tbodyObj)
{
      var postId=valueObj.getAttribute("postId");
      var postName=valueObj.getAttribute("postName")
      var objTableLength=tbodyObj.rows.length;
      var myrow=tbodyObj.insertRow(objTableLength);
      var mycell=myrow.insertCell();
      mycell.className="";
	  mycell.setAttribute("align","center");
	  mycell.innerHTML="<input type='checkBox'  name='postItem' value='"+postId+"' postId='"+postId+"' postName='"+postName+"' >";
	  mycell=myrow.insertCell();
	  mycell.className="";
	  mycell.setAttribute("align","center");
	  mycell.innerHTML=postName;
	  mycell=myrow.insertCell();
}


function isExistSelected(postId)
{
   var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
   var objTableLength=postSelectTbody.rows.length;
   var add=true;
   var rowObj=null;
   for(var i=1;i<objTableLength;i++)
   {
	var postIdTemp=postSelectTbody.rows[i].children[0].children[0].value;
	if(postId==postIdTemp)
	{
	   add=false;
	   rowObj=postSelectTbody.rows[i];
	}
	postSelectTbody.rows[i].setAttribute("bgColor","");
   }
	  if(!add)
	  {
	       rowObj.setAttribute("bgColor","#FF0000");
	       alert("当前操作对象已添加，请确认！");
	       return true;
	  }
  return false;
}

 function delPost()
         {
             var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
             var postItems=parent.selectedFrame.document.getElementsByName("postItem");
             if(postItems==null || postItems.length==0) return;
             var totalSelectNum=0;
             var objCheck=parent.offerSelectFrame.document.getElementsByTagName("INPUT");
             for(var i=postSelectTbody.rows.length-1;i>=1;i--)
             {
                var postItem=postSelectTbody.rows[i].children[0].children[0];
                if(postItem.checked)
                {
                    for(var ii=0;ii<objCheck.length;ii++)
                    {
                       if((objCheck[ii].value==postItem.value))
                       {
                            objCheck[ii].checked=false;
                            break;
                       }
                    }
                   totalSelectNum=totalSelectNum+1;
                   postSelectTbody.removeChild(postSelectTbody.rows[i]);
                }
             }
             if(totalSelectNum==0)
             {
                alert("请在'已选岗位'中选择至少一项进行删除！")
             }
         }
         
 function delAllPost()
  {
      var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
      var postItems=parent.selectedFrame.document.getElementsByName("postItem");
      if(postItems==null || postItems.length==0) return;
      var totalSelectNum=0;
      
      for(var i=postSelectTbody.rows.length-1;i>=1;i--)
      {
        var postItem=postSelectTbody.rows[i].children[0].children[0];
        postItem.checked=true;
       
      }
    delPost();
  }
  
  function moveDown()
  {
      var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
      var objTableLength=postSelectTbody.rows.length;
      var rowObj=null;
      var totalSelectNum=0;
      var index=0;
	  for(var i=1;i<objTableLength;i++)
	  {
	     var postItem=postSelectTbody.rows[i].children[0].children[0];
	     if(postItem.checked)
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
     postSelectTbody.moveRow(index+1,index);
  }
  
    function moveUp()
    {
      var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
      var objTableLength=postSelectTbody.rows.length;
      var rowObj=null;
      var totalSelectNum=0;
      var index=0;
	  for(var i=1;i<objTableLength;i++)
	  {
	     var postItem=postSelectTbody.rows[i].children[0].children[0];
	     if(postItem.checked)
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
    postSelectTbody.moveRow(index-1,index);
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

	<body >
		<table border="0" width="100%" align="center" >
			<tr>
				<td valign="middle" height="380">
				    <input type='button' name='Submit'   value='新增' class='Button3' onclick="addPost()"><br><br>
				     <input type='button' name='Submit'   value='全增' class='Button3' onclick="addAllPost()"><br><br>
				    <input type='button' name='Submit'   value='删除' class='Button3' onclick="delPost()" id="delOrg"><br><br>
				    <input type='button' name='Submit'   value='全删' class='Button3' onclick="delAllPost()"><br><br>
				    <input type='button' name='Submit'   value='上移' class='Button3' onclick="moveUp()" id="moveUp"><br><br>
				    <input type='button' name='Submit'   value='下移' class='Button3' onclick="moveDown()" id="moveDown"><br><br>
				   
				</td>
			</tr>
		  </table>
	</body>
</html>

