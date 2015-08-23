<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>已选择岗位</title>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
 <body topmargin="0" leftmargin="0" onload="dispalySelected()">
    <script>
   function dispalySelected()
   {
       var postSelectTbody=document.getElementById("postSelectTbody");
      var itemIdCheckBox=parent.window.dialogArguments.document.getElementsByName("itemIdCheckBox");
       if(itemIdCheckBox!=null&&itemIdCheckBox.length>0)
       {
         for(var i=0;i<itemIdCheckBox.length;i++)
         {
          
             var postId=itemIdCheckBox[i].getAttribute("postId");
		      var postName=itemIdCheckBox[i].getAttribute("postName")
		      var objTableLength=postSelectTbody.rows.length;
		      var myrow=postSelectTbody.insertRow(objTableLength);
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
       }
   }
  </script>
 <table border="0" width="100%" align="center" >
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1" style="height:390">
					
					  <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2" style="height:390" style="overflow:auto">
							<h2 class="tab">
								已选岗位
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							
							       <table width="100%" <%=tableStyle%> align="center" >
								  <tbody id="postSelectTbody">
								  <tr>
								  	<td width='15%' align='center' nowrap class="ListTableHeader"><input type='CheckBox' id='selectedRowAll' name='selectedRowAll' onclick="selectAllGrid(this,'postItem')"></td>
								  	<td width='85%'style='cursor:hand'  align='center'  nowrap class="ListTableHeader"><b>岗位名称</b></td>
								  
								  </tr>
								 
								  </tbody>
								   </table>
						    
						      
							
						</div>
						
					</div>
		           </td>
		         </tr>
		       </table>

 </body>
</html>

