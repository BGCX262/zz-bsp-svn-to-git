<%@page language="java" contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <%String baseURL=request.getContextPath();%>
    <link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/login.css" >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>通信基站建设进度项目管理系统</title>
    
<script>
function openWin(){
    var hWnd1=window.open("", "MAIN_WIN_FRAME", 'height='+ new String(screen.availHeight-28) + ',top=0,left=0,width=' + new String(screen.availWidth-10) + ',location=no,menubar=no,resizable=no,toolbar=no,states=no');
    return  hWnd1;
}

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

<body text="#000000" bgcolor="#cccccc">
<form action="<%=baseURL%>/userLogonOn_abdf.do" name="loginForm" id="loginForm" method="post" >
    <input type="hidden" name="screenHeight" id="screenHeight">
    <input type="hidden" name="screenWidth" id="screenWidth">
    <input type="hidden" name="lt" value="<%= request.getAttribute("edu.yale.its.tp.cas.lt") %>" />
    
    <table align="center" height="100%"><tbody><tr><td>
    <table width="783" align="center" border="0" cellpadding="0" cellspacing="0">
          <tbody><tr> 
            <td colspan="3"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_top.gif" width="783" height="45"></td>
          </tr>
         <tr> 
            <td colspan="3" height="68"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_topp.jpg" width="782" height="68"></td>
          </tr>
         <tr> 
            <td colspan="3" height="38"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/lvpp.gif" width="782" height="38"></td>
          </tr>
          <tr> 
            <td width="262" height="214"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_01.gif" width="262" height="214"></td>
            <td width="258" bgcolor="#ffffff"><table width="258" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <TR>
                <TD height="20">&nbsp;&nbsp;<font color="red"><strong>
                    <%
                        if(request.getAttribute("hintMessage")!= null){
                            out.println(request.getAttribute("hintMessage"));
                        }
                    %>
                </strong></font></TD>
                </TR>
                <tr> 
                      <td><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_06.gif"></td>
                   </tr>
                <tr> 
                  <td align="center"><table width="230" border="0" cellpadding="1" cellspacing="1">
                    <tbody><tr> 
                          <td width="50" align="right">用户名：</td>
                           <td> <!-- 
                               <input name="username" size="20" class="rec_form" tabindex="1" type="text" onkeydown="javascript:filterKey();" value="lzr">
                               -->
                               <select name="username" id="username">
                                <OPTION value="lzr">刘正仁</OPTION>
                                <OPTION value="wm">王敏</OPTION>
                                <OPTION value="lyj">林颖军</OPTION>
                                <OPTION value="zxs">周旭顺</OPTION>
                                </select>
                               </td>
                    </tr>
                    <tr> 
                          <td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                          <td> <input name="password" size="22" class="rec_form" tabindex="2" type="password" onkeydown="javascript:filterKey();" value="888888"> 
                          </td>
                    </tr>
                    <tr> 
                          <td height="30">&nbsp;</td>
                          <td><input name="Login" src="<%=baseURL%>/bsp/abdf/skins/default/img/login/login.gif" onClick="login()" type="image" width="80" border="0" height="20"></td>
                       </tr>
                    <tr>
                          <td align="center"></td>
                    </tr>
                    </tbody></table></td>
                </tr>
              </tbody></table></td>
                   <td width="262"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_03.gif" width="262" height="214"></td>
              </tr>
              <tr> 
                <td colspan="3"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_04.gif" width="782" height="26"></td>
              </tr>
              <tr align="center">
                <td colspan="3" background="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_05.gif" height="47"> <p>版权所有 &#169; <br>
                </p>
              </td>
              </tr>
            </tbody></table>
        </td></tr>
        </tbody></table>
    </form>
</body></html>
