<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>


<HTML>
	<HEAD>
	
	<%String baseURL=request.getContextPath();%>
	<style type="text/css">
<!--
BODY{
	
	margin:0 0 0 0 ;
	font-family: "Arial";
	font-size:12px ; 
	SCROLLBAR-FACE-COLOR: #f6f6f6; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #cccccc; SCROLLBAR-3DLIGHT-COLOR: #cccccc; SCROLLBAR-ARROW-COLOR: #330000; SCROLLBAR-TRACK-COLOR: #f6f6f6; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; 
}

td{
	
	font-family: "Arial";
	font-size:12px ; 
}
a{color:#000; text-decoration:none;}
a:hover{color:#ff6600; text-decoration:underline;}
-->
</style>

      <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/scrollbutton.js"></script>
   <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/menu4.js"></script>
   <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/cb2.js"></script> 
   <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/poslib.js"></script>
		<SCRIPT language=javascript>
	 Menu.prototype.cssFile = "<%=baseURL%>/bsp/abdf/skins/default/css/popmenu/officexp.css";
  	var eMenu = new Menu();
    eMenu.add(new MenuItem('修改密码', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
    eMenu.add(new MenuItem('常用意见', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
   eMenu.add(new MenuItem('常用联系人', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
   eMenu.add(new MenuItem('通讯录', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );


function showContextMenuShowBuzi() {
    	var el = window.event.srcElement;
    	var left = window.event.screenX;
    	var top = window.event.screenY;
    	eMenu.show(left,top);
  	}



</SCRIPT>

	</HEAD>

	<body ondragstart=self.event.returnValue=false onselectstart=self.event.returnValue=false oncontextmenu=self.event.returnValue=false>
		
             <table  width="183" border="0" cellspacing="0" cellpadding="0" >
				<tr>
					<td style="border-bottom:1px #CCCCCC solid;" bgcolor="EEEEEE">
						<strong>常用功能</strong>
					</td>
				</tr>
				<tr>
					<td align="left">
						&nbsp;&nbsp;<img src="<%=baseURL%>/images/pms/icon1.gif" width="5" height="5" vspace="3" />
						<a href="#" onclick="">快捷方式
						</a>
						
					</td>
				</tr>
				<tr>
					<td align="left">
						&nbsp;&nbsp;<img src="<%=baseURL%>/images/pms/icon1.gif" width="5" height="5" vspace="3" />
						<a href="#" onclick="showContextMenuShowBuzi()">个人设置
						</a>
					</td>
				</tr>
				
				
				
		</table>



		
	</BODY>
</HTML>
