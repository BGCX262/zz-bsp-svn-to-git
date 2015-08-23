<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<%@include file="/bsp/abdf/common.jsp"%>
<style type="text/css">
<!--
body {
    margin-left: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    background-image: url(<%=baseURL%>/bsp/abdf/skins/default/img/public/Iconbg.gif);
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function resizeLeft()
{
    var leftImg=document.getElementById("left")
    var srcImg="";
    if(leftImg.src.indexOf("close.gif")>0)
    {
        if(parent.document.getElementById("mainFrame").cols=='183,10,*')
        {
            parent.document.getElementById("mainFrame").cols='0,10,*'
        }
        else if(parent.document.getElementById("mainFrame").cols=='183,10,*')
        {
            parent.document.getElementById("mainFrame").cols='0,10,*'
        }
        srcImg='<%=baseURL%>/bsp/abdf/skins/default/img/public/open.gif'
    }

    if(leftImg.src.indexOf("open.gif")>0)
    {
        if(parent.document.getElementById("mainFrame").cols=='0,10,*')
        {
            parent.document.getElementById("mainFrame").cols='183,10,*'
        }
        else if(parent.document.getElementById("mainFrame").cols=='0,10,*')
        {
            parent.document.getElementById("mainFrame").cols='183,10,*'
        }
        srcImg='<%=baseURL%>/bsp/abdf/skins/default/img/public/close.gif'
    }
    leftImg.src=srcImg
}
//-->
</script>
</head>

<body>
<div id="Layer1" style="position:absolute; left:0px; top:40%; width:71px; height:73px; z-index:1"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/public/close.gif" width="10" height="106" onClick="resizeLeft()" id="left" style="cursor:hand "></div>
</body>
</html>
