<%@ page contentType="text/html; charset=UTF-8" %>



<% String baseURL=request.getContextPath();%><head>



<style type="text/css">



<!--



body {



	margin-left: 0px;



	margin-top: 0px;



	margin-right: 0px;



	margin-bottom: 0px;



	background-color: #FFFFFF;



}



-->



</style>



<script language="javascript">



function yuan(ID){
 document.getElementById('tableset').src='<%=baseURL%>/gd/images/mainmenu/backmanage/btn_tableset_1.jpg'
 document.getElementById('consumeset').src='<%=baseURL%>/gd/images/mainmenu/backmanage/btn_consumeset_1.jpg'
 document.getElementById('otherset').src='<%=baseURL%>/gd/images/mainmenu/backmanage/btn_otherset_1.jpg'
 document.getElementById('asset').src='<%=baseURL%>/gd/images/mainmenu/backmanage/btn_asset_1.jpg'
 document.getElementById('system').src='<%=baseURL%>/gd/images/mainmenu/backmanage/btn_system_1.jpg'

 //top.mainRight.location.href='../mainRightFrame.jsp?ID='+ID
}
function quit(){

if (window.confirm("您确认要退出吗？")){
	top.location.href="<%=baseURL%>/userLogOut_abdf.do"
}
}

function toUrl(hrefStr){
 top.mainRight.right.location.href=hrefStr;
}
function toUrl1(hrefStr){
 top.mainRight.right.location.href=hrefStr;

}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" background="<%=baseURL%>/gd/images/public/top1.gif">
     <div align="left" style="margin-top:-2px"><img src="<%=baseURL%>/gd/images/public/top.gif"></div>
    </td>
  </tr>



  <tr>



    <td height="45" background="<%=baseURL%>/gd/images/public/topBgM.gif">



      <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">



        <tr>



		  <td width="20" background="<%=baseURL%>/gd/images/public/topBgL.gif">&nbsp;</td>

          <td style="padding-top:10px; " width="40%">

		    <!--按钮 工作向导-->
             <!-- 
		  	<img src="<%=baseURL%>/gd/images/button/buttom_work_1.gif" onMouseOver="this.src=this.src.slice(0,this.src.length-5)+'2.gif'" onMouseDown="this.src=this.src.slice(0,this.src.length-5)+'3.gif'" onMouseUp="this.src=this.src.slice(0,this.src.length-5)+'2.gif'"  onMouseOut="this.src=this.src.slice(0,this.src.length-5)+'1.gif'"  onClick="javascirpt:toUrl('<%=baseURL%>/blank1.jsp');">
             -->
			<!--按钮 餐台设置-->

			<img src="<%=baseURL%>/gd/images/button/buttom_tableSet_1.gif" onMouseOver="this.src=this.src.slice(0,this.src.length-5)+'2.gif'" onMouseDown="this.src=this.src.slice(0,this.src.length-5)+'3.gif'" onMouseUp="this.src=this.src.slice(0,this.src.length-5)+'2.gif'"  onMouseOut="this.src=this.src.slice(0,this.src.length-5)+'1.gif'" onClick="javascirpt:toUrl('<%=baseURL%>/listWorkItemDoing_wfss.do');" style="cursor:pointer ">

			<!--按钮 消费项目总表-->

			<img src="<%=baseURL%>/gd/images/button/buttom_consume_1.gif" onMouseOver="this.src=this.src.slice(0,this.src.length-5)+'2.gif'" onMouseDown="this.src=this.src.slice(0,this.src.length-5)+'3.gif'" onMouseUp="this.src=this.src.slice(0,this.src.length-5)+'2.gif'"  onMouseOut="this.src=this.src.slice(0,this.src.length-5)+'1.gif'" onClick="javascirpt:toUrl('<%=baseURL%>/listWorkItemDoen_wfss.do');" style="cursor:pointer ">

			<img src="<%=baseURL%>/gd/images/button/spanLine.gif">
			<!--按钮 分隔线-->
            

			<!--按钮 后退-->

            <img src="<%=baseURL%>/gd/images/button/buttom_break_1.gif"  onMouseOver="this.src=this.src.slice(0,this.src.length-5)+'2.gif'" onMouseDown="this.src=this.src.slice(0,this.src.length-5)+'3.gif'" onMouseUp="this.src=this.src.slice(0,this.src.length-5)+'2.gif'"  onMouseOut="this.src=this.src.slice(0,this.src.length-5)+'1.gif'" onClick="history.go(-1)" style="cursor:pointer " >

			<!--按钮 前进-->

		    <img src="<%=baseURL%>/gd/images/button/buttom_ahead_1.gif"  onMouseOver="this.src=this.src.slice(0,this.src.length-5)+'2.gif'" onMouseDown="this.src=this.src.slice(0,this.src.length-5)+'3.gif'" onMouseUp="this.src=this.src.slice(0,this.src.length-5)+'2.gif'"  onMouseOut="this.src=this.src.slice(0,this.src.length-5)+'1.gif'" onClick="history.go(1)" style="cursor:pointer ">

			<!--按钮 退出-->

			<img src="<%=baseURL%>/gd/images/button/buttom_exit_1.gif"  onMouseOver="this.src=this.src.slice(0,this.src.length-5)+'2.gif'" onMouseDown="this.src=this.src.slice(0,this.src.length-5)+'3.gif'" onMouseUp="this.src=this.src.slice(0,this.src.length-5)+'2.gif'"  onMouseOut="this.src=this.src.slice(0,this.src.length-5)+'1.gif'" onClick="javascript:quit()" style="cursor:pointer ">			  			
           <img src="<%=baseURL%>/gd/images/button/spanLine.gif">
		  </td>
		    <td style="padding-top:10px; " align="left">
&nbsp;
			
			</td>
        </tr>

    </table></td>



  </tr>



</table>



