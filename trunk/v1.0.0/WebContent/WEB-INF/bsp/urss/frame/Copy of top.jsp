<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>

<%String baseURL=request.getContextPath();%>
<html >
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link id="loadCss" href="<%=baseURL%>/bsp/abdf/skins/frame/css/fe/fe0.css" rel="stylesheet" type="text/css" />

<title>TOP</title>
	


<script>

function loadCss(cssFile){
    var cssTag = document.getElementById('loadCss');
    var head = document.getElementsByTagName('head').item(0);
    if(cssTag) head.removeChild(cssTag);
    css = document.createElement('link');
    css.href = cssFile;
    css.rel = 'stylesheet';
    css.type = 'text/css';
    css.id = 'loadCss';
    head.appendChild(css);
}




function closeWindows()
{
   document.getElementById("logoutSystem").src="<%=baseURL%>/logout?flag=close";
   //onbeforeunload="closeWindows()"
}
function reloadMain()
{
   top.main.location.reload();
}

function admin_left(appId){
	top.left.location.href="<%=baseURL%>/left.do?appId="+appId;
}

</script>
</head>
<BODY >

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="75%" valign="top"><table   border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" width="100%"><img src="<%=baseURL%>/bsp/abdf/skins/frame/images/fe/top_log.gif" /></td>
             
            </tr>
        </table></td>
        <td width="25%" valign="top"><div align="right">
            <table width="168" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8"><img src="<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_05.gif" width="8" height="32" /></td>
                <td width="42" align="center" valign="bottom"><a href="#" onclick="javascript:top.close();return;">关闭</a></td>
                <td width="8"><img src="<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_05.gif" width="8" height="32" /></td>
                <td width="42" align="center" valign="bottom"><a href="#">帮助</a></td>
                
               
              </tr>
            </table>
        </div></td>
      </tr>
    </table></td>
    <td width="276" valign="top" class="infor"><div id="infor-text"><nobr><div id="onLineUserNu"><span style="color:#ff6600;">刘正仁</span>您好！</div></nobr></div></td>
  </tr>
  <tr>
    <td colspan="2" valign="bottom" class="nav-bg"><table id="menu-table"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        
        
       
      		<td width="100" class="nav-menu"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td width="6" height="25" class="nav-text0_p" ></td>
            <td id="menu-0" height="25"   class="nav-text0_s" style="cursor:hand"  onclick="loadCss('<%=baseURL %>/bsp/abdf/skins/frame/css/fe/fe0.css');ev_main()">统一定义平台</td>
            <td width="6" height="25"   class="nav-text0_n" ></td> 
          </tr>
        </table></td>
        
       
       
         
        
  </tr>
  
</table>
  <tr><td  colspan="2" >
<div id="sub-menu" class="nav-div">
	
</div>
</td>
  <%--<tr>
    <td height="8" colspan="2" background="<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_83.gif"></td>
  </tr>
--%></table>
</BODY>
<script>
function LogOutSystem()
{
   top.location.href="<%=baseURL%>/logout";
}

	function updateOnLinUserNu(number){
		var divContent="当前在线人数("+number+") 刘正仁 您好！"
		var unmDiv=document.getElementById("onLineUserNu").innerText=divContent; 
	}
	
	function ev_changeCSS(obj){
		
	
		var f_img_1 = "<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_10.gif";
		var f_img_2 = "<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_13.gif";
		var b_img_1 = "<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_15.gif";
		var b_img_2 = "<%=baseURL%>/bsp/abdf/skins/frame/images/fe/index_18.gif";
		
		
		
		var table = document.getElementById("menu-table");
		
		var tds = table.getElementsByTagName("TD");
		for(var i=0;i<tds.length;i++){
			var td = tds[i];
			if(td.getAttribute("id").indexOf("menu-")==0){
				var parent = td.previousSibling;
				var next = td.nextSibling;
				parent.children[0].src=b_img_1;
				next.children[0].src=b_img_2;
				td.className="nav";
			}
		}
		
		var parent = obj.previousSibling;
		var next = obj.nextSibling;
		
		parent.children[0].src=f_img_1;
		next.children[0].src=f_img_2;
		obj.className="nav-text";
		
	}
	
	function ev_changeMenu(obj){
		var sub_menu = document.getElementById("sub-menu");
		//sub_menu.innerHTML = obj.innerHTML;
		//协同区配置的链接url
		var coopUrl = obj.getAttribute("coopUrl");
		if(coopUrl==null||coopUrl==""){
			return false;
		}
		top.main.location.href="<%=baseURL%>/"+coopUrl;
	}
	
	function ev_main(){
		
	}
</script>
</html>
