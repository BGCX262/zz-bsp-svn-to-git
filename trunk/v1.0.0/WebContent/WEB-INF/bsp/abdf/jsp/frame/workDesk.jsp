<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%
	String baseURL = request.getContextPath();
    System.out.println("bbbb=="+request.getParameter("bb"));
%>
<html>
<%
	response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<head>
<title></title>
<LINK media=all href="<%=baseURL%>/bsp/abdf/skins/default/css/workdesk.css" type=text/css rel=stylesheet>

</head>
<body leftmargin='2' topmargin='2'>
<DIV class="workdesk_container">

	<DIV id="my_working">
		<H2><SPAN>公告栏</SPAN></H2>
		<UL>
			<LI><A href="#" target="_self">· 公告1</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 公告2</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 公告3</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 公告4</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 公告5</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
		</UL>
	</DIV>

	<DIV id="my_worked">
		<H2><SPAN>我的信息</SPAN></H2>
		<UL>
			<LI><A href="#" target="_self">· 信息1</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 信息2</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 信息3</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 信息4</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 信息5</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
		</UL>
	</DIV>
	
	<DIV id="my_working">
		<H2><SPAN>我的代办</SPAN></H2>
		<UL>
			<LI><A href="#" target="_self">· 代办1</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 代办2</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 代办3</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 代办4</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 代办5</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
		</UL>
	</DIV>
	
	<DIV id="my_worked">
		<H2><SPAN>我的已办</SPAN></H2>
		<UL>
			<LI><A href="#" target="_self">· 已办1</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 已办2</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 已办3</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 已办4</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 已办5</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
		</UL>
	</DIV>
	
	<DIV id="my_working">
		<H2><SPAN>我的发起</SPAN></H2>
		<UL>
			<LI><A href="#" target="_self">· 发起1</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 发起2</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 发起3</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 发起4</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 发起5</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
		</UL>
	</DIV>
	<DIV id="my_worked">
		<H2><SPAN>我的评估</SPAN></H2>
		<UL>
			<LI><A href="#" target="_self">· 评估1</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 评估2</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 评估3</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 评估4</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
			<LI><A href="#" target="_self">· 评估5</A> &nbsp;&nbsp;&nbsp;&nbsp;2009-03-20</LI>
		</UL>
	</DIV>
</DIV>
</body>

</html>