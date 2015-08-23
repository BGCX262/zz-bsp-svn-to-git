<%@page language="java" contentType="text/html;charset=UTF-8"%>
<html>
<head>
   <%String baseURL=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统_后台管理</title>
<style type="text/css">
<!--
body{
	margin-left:0px;
	margin-top:0px;
	margin-right:0px;
	margin-bottom:0px;
}
body,td,th {
	font-size: 12px;
}
-->
</style>
<script language="javascript">
function login()
{
    //获取系统屏幕高和宽

    document.getElementById("screenHeight").value=screen.availHeight;
    document.getElementById("screenWidth").value=screen.availWidth;

    document.loginForm.submit();    
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
</script>
</head>
<body>
<form action="<%=baseURL%>/userLogonOn_abdf.do" name="loginForm" id="loginForm" method="post" target="_top">
 <input type="hidden" name="screenHeight" id="screenHeight">
    <input type="hidden" name="screenWidth" id="screenWidth">
<div align="center">
  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" valign="middle"><table width="998" height="604" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="573" align="right" valign="top"><table width="573" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="568" align="right" valign="top" background="<%=baseURL%>/gd/images/login/login_1024/left_image.jpg"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="569" height="568">
                    <param name="movie" value="<%=baseURL%>/gd/flash/index.swf">
                    <param name=quality value=high>
                    <param name="wmode" value="transparent">
                    <embed src="<%=baseURL%>/gd/flash/index.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="569" height="568"></embed>
                </object></td>
              </tr>
              <tr>
                <td width="573" height="35" align="right" valign="top" background="<%=baseURL%>/gd/images/login/login_1024/left_bottom.jpg">&nbsp;</td>
              </tr>
          </table></td>
          <td width="425" align="left" valign="top" bgcolor="#F7FAFF"><table width="425" height="603" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="89"><table width="425" height="89" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="right" valign="middle"><img src="<%=baseURL%>/gd/images/logo/logo.gif" width="146" height="49"></td>
                      <td width="25">&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td width="425" height="46" background="<%=baseURL%>/gd/images/login/login_1024/rtms.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td height="33">&nbsp;</td>
              </tr>
              <tr>
                <td width="425" height="106" align="center" valign="top" background="<%=baseURL%>/gd/images/login/login_1024/fruit.gif">&nbsp;</td>
              </tr>
              <tr>
                <td height="50">&nbsp;</td>
              </tr>
              <tr>
                <td height="168" align="center" valign="middle"><table width="425" height="168" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="20" rowspan="3">&nbsp;</td>
                      <td width="385" height="40" align="center" valign="top" background="<%=baseURL%>/gd/images/login/login_1024/login_top.jpg">&nbsp;</td>
                      <td width="20" rowspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="center" valign="top"><table width="385" height="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="20" rowspan="3" background="<%=baseURL%>/gd/images/login/login_1024/login_left_bg.jpg">&nbsp;</td>
                            <td height="20">&nbsp;&nbsp;<font color="red"><strong>
                    <%
                        if(request.getAttribute("hintMessage")!= null){
                            out.println(request.getAttribute("hintMessage"));
                        }
                    %>
                </strong></font></td>
                            <td width="20" rowspan="3" background="<%=baseURL%>/gd/images/login/login_1024/login_right_bg.jpg">&nbsp;</td>
                          </tr>
                          <tr>
                            <td><table width="345" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td align="center"><table  border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="20" height="35" align="left">&nbsp;<img src="<%=baseURL%>/gd/images/login/login_1024/ico.gif" width="4" height="10"></td>
                                        <td width="70">&nbsp;用户名：</td>
                                        <td>
                                        <input name="username" size="20"  tabindex="1" type="text" onkeydown="javascript:filterKey();" value="">
                                       </td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="3" background="<%=baseURL%>/gd/images/login/login_1024/line.gif"></td>
                                      </tr>
                                      <tr>
                                        <td height="35" align="left">&nbsp;<img src="<%=baseURL%>/gd/images/login/login_1024/ico.gif" width="4" height="10"></td>
                                        <td height="20">&nbsp;密　码： </td>
                                        <td height="20"><input name="password" size="22"  tabindex="2" type="password" onkeydown="javascript:filterKey();" value=""> </td>
                                      </tr>
                                  </table></td>
                                  <td width="81"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td></td>
                                      </tr>
                                      <tr>
                                      
                                        <td id="01" width="81" height="67" align="left" valign="top"><img src="<%=baseURL%>/gd/images/login/login_1024/login_buttom_01_1.jpg" id="login" border="0" onMouseDown="javascript:document.all.login.src='<%=baseURL%>/gd/images/login/login_1024/login_buttom_01_3.jpg'" onMouseOut="javascript:document.all.login.src='<%=baseURL%>/gd/images/login/login_1024/login_buttom_01_1.jpg'" onMouseOver="javascript:document.all.login.src='<%=baseURL%>/gd/images/login/login_1024/login_buttom_01_2.jpg'" style="cursor:hand" align="middle" onclick="javascript:document.loginForm.submit();" /></td>
                                      </tr>
                                      <tr>
                                        <td></td>
                                      </tr>
                                  </table></td>
                                  <td width="5">&nbsp;</td>
                                </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td width="385" height="35" align="center" valign="bottom" background="<%=baseURL%>/gd/images/login/login_1024/login_bottom.jpg">&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="425" height="78" valign="top" background="<%=baseURL%>/gd/images/login/login_1024/right_bottom.jpg">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
</form>
</body>
</html>
