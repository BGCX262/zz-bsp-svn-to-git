<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="/bsp/abdf/common.jsp"%>

<html:html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>精鹰中国基础服务平台--统一定义平台</title>
	<link href="<%=baseURL%>/bsp/abdf/skins/frame/css/fe/fe.css" rel="stylesheet"
		type="text/css" />
	<SCRIPT type="text/javascript" language="javascript">
function openWin(){
	var hWnd1=window.open("", "MAIN_WIN_FRAME", 'height='+ new String(screen.availHeight-28) + ',top=0,left=0,width=' + new String(screen.availWidth-10) + ',location=no,menubar=no,resizable=no,toolbar=no,states=no');
	return  hWnd1;
}
function filterKey()
{

      if (event.keyCode == 13){
		if (event.srcElement.name == "password")
			login() ;
		else{
			if (event.srcElement.name == "username")
				document.getElementById("password").select() ;
			else
				event.keyCode = 9 ;
				return false ;
			}
	}
	else{
		return true ;
	}
}

function login()
{
    //获取系统屏幕高和宽
    document.getElementById("screenHeight").value=screen.availHeight;
    document.getElementById("screenWidth").value=screen.availWidth;
  
	hWnd = openWin();	
	document.loginForm.submit();	
	//hWnd.focus();
}	
</SCRIPT>



</head>




<BODY class="login-bg" style="overflow:hidden ">
	<DIV class=login-box>
		<form action="<%=baseURL%>/mrgLogonToSystem_urss.do" name="loginForm" id="loginForm"
			method="post" target="MAIN_WIN_FRAME">
			<TABLE cellSpacing=0 cellPadding=0 width='98%' border=0>
				<TBODY>
					<TR>
					
					
					
						<TD vAlign=top>
						
							<DIV class=login-left>
								<STRONG>新公司用户：</STRONG>
								<BR>
								请点击这里进行注册，审核通过后，系统自动将用户名和密码发送到你注册的邮箱。
								<BR>
								<STRONG>禁止未授权的访问 </STRONG>
								<BR>
							</DIV>
						</TD>
						<TD class=login-img vAlign=top width=400>
							<DIV class=login-info>
								是否要将此页标记为书签? | 忘记了密码?
							</DIV>
							<DIV class=login-text>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD colSpan=2>
												用户名：
												<input style="width: 130px" name="username" class="formStyleall" type="text"  id="username"
													onkeydown="javascript:filterKey();">
												<input type="hidden" name="screenHeight" id="screenHeight">
												<input type="hidden" name="screenWidth" id="screenWidth">
											</TD>
										</TR>
										<TR>
											<TD colSpan=2>
												密&nbsp; &nbsp;&nbsp;码：
												
												<input style="width: 130px" class="formStyleall" name="password" type="password" id="password"
													 onkeydown="javascript:filterKey();">
											</TD>
										</TR>
										<TR>
											<TD width="10%" height=40>
											<img src="<%=baseURL%>/bsp/abdf/skins/frame/images/fe/login1_04.gif"  border="0" onClick="login()" align="absmiddle" style="cursor:hand ">
												
											</TD>
											<TD >
												<INPUT type=checkbox value=checkbox name=checkbox>
												<input type="checkbox" name="warn" value="true" style="display:none"/>
												记住用户名
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							<DIV class=login-bottom>
								&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;精鹰中国有限公司版权所有，本公司保留所有权利。
							</DIV>
						</TD>
						<TD vAlign=top>
							<DIV class=login-left>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD style="color:#fff; font-size:11px; text-align:left;">
												
											</TD>
										</TR>
										<TR>
											<TD align=right>
											
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</DIV>
							
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</DIV>
</BODY>








</html:html>
