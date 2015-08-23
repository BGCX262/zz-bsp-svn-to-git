<%@ page contentType="text/html; charset=utf-8" language="java"  %>

<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT  language=javascript>
<!--
function  Year_Month()
{
        var  now  =  new  Date();
        var  yy  =  now.getYear();
        var  mm  =  now.getMonth();
    var  mmm=new  Array();
    mmm[0]="1";
    mmm[1]="2";
    mmm[2]="3";
    mmm[3]="4";
    mmm[4]="5";
    mmm[5]="6";
    mmm[6]="7";
    mmm[7]="8";
    mmm[8]="9";
    mmm[9]="10";
    mmm[10]="11";
    mmm[11]="12";
    mm=mmm[mm];
        return(mm  );
}
function  thisYear(){
    var  now  =  new  Date();
    var  yy  =  now.getYear();
    if(yy<200) yy+=1900;
    return(yy);
}
function Date_of_Today(){
    var  now  =  new  Date();
    return(now.getDate()  );
}
function Day_of_Today(){
    var  now  =  new  Date();
    var day  =  now.getDay();
    if(day==0){  var  weekday  =  "  星期日 "}
    if(day==1){  var  weekday  =  "  星期一 "}
    if(day==2){  var  weekday  =  "  星期二 "}
    if(day==3){  var  weekday  =  "  星期三 "}
    if(day==4){  var  weekday  =  "  星期四 "}
    if(day==5){  var  weekday  =  "  星期五 "}
    if(day==6){  var  weekday  =  "  星期六 "}
    return weekday;
}


 function  CurentTime()
  {
        var  now  =  new  Date();
        var  hh  =  now.getHours();
        var  mm  =  now.getMinutes();
        var  ss  =  now.getTime()  %  60000;
        ss  =  (ss  -  (ss  %  1000))  /  1000;
        var  clock  =  hh+':';
        if  (mm  <  10)  clock  +=  '0';
        clock  +=  mm+':';
        if  (ss  <  10)  clock  +=  '0';
        clock  +=  ss;
        return(clock);
 }
function  refreshCalendarClock()
{
  document.getElementById("calendarClock1").innerHTML  =thisYear()+"年"+Year_Month()+"月"+Date_of_Today()+"日 "+Day_of_Today()+CurentTime();
}

setInterval('refreshCalendarClock()',1000);
/-->
</SCRIPT>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15%"  background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif" >当前在线人员总数:</td>
    <td width="1%" background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/public/botSplit.gif" width="8" height="23"></td>
    <td width="45%" background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif">当前操作员:刘正仁</td>
    <td width="1%" background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/public/botSplit.gif" width="8" height="23"></td>
    <td width="17%" background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif"><div id="calendarClock1"></div></td>
  <td width="1%" background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/public/botSplit.gif" width="8" height="23"></td>
  <td width="20%" background="<%=baseURL%>/bsp/abdf/skins/default/img/public/botBg.gif">用户状态&nbsp;&nbsp;&nbsp; <input name="radiobutton" type="radio" value="radiobutton" checked>
    正常
    <input type="radio" name="radiobutton" value="radiobutton">
    忙碌
    <input type="radio" name="radiobutton" value="radiobutton">
    隐身</td>
  </tr>
</table>
</body>
</html>
