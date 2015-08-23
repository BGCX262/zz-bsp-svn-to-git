<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>


<HTML>
<HEAD>
<%@include file="/bsp/abdf/common.jsp"%>
<link id="loadCss"
	href="<%=baseURL%>/bsp/abdf/skins/frame/css/fe/fe9.css"
	rel="stylesheet" type="text/css" />
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<script>
      function openWorkItemDoing()
      {
         top.main.location.href="<%=baseURL%>/listWorkItemDoing.do"
      }
       function openWorkItemDoen()
      {
         top.main.location.href="<%=baseURL%>/listWorkItemDoen.do"
      }
     
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


    </script>
</HEAD>
<body ondragstart=self.event.returnValue=false
	onselectstart=self.event.returnValue=false
	oncontextmenu=self.event.returnValue=false>
<TABLE cellSpacing=1 cellPadding=0 width="100%" bgColor=#3366FF border=0>
	<TBODY>

		<TR>
			<TD align=middle bgColor=#ffd83b height=24>
			<P><A href="#" onclick="openWorkItemDoing()">我的待办</A></P>
			</TD>
			<TD align=middle bgColor=#ffd83b><A
				href="#" onclick="openWorkItemDoen()">我的已办</A></TD>
		</TR>
		<TR>
			<TD align=middle bgColor=#ffd83b height=24>
			<P><A href="#">我的传阅</A></P>
			</TD>
			<TD align=middle bgColor=#ffd83b><A
				href="#">我的已阅</A></TD>
		</TR>
		<TR>
			<TD align=middle bgColor=#ffd83b height=24>
			<P><A href="#">快捷方式</A></P>
			</TD>
			<TD align=middle bgColor=#ffd83b><A
				href="#" onclick="showContextMenuShowBuzi()">个人设置</A></TD>
		</TR>
	</TBODY>
</TABLE>

</BODY>
</HTML>

