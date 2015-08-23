<%@page language="java" contentType="text/html;charset=UTF-8"%>
<% 
String baseURL=request.getContextPath();
%><head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>


<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td we><img id="image" src="<%=baseURL%>/gd/images/public/background_ms.jpg" border="0" usemap="#Map" width="30" height="768"></td>
    <td width="6">
      <table height="100%" border="0" width="100%">
        <tr>
          <td height="30" width="100%">&nbsp;</td>
        </tr>
        <tr>
          <td width="100%">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  
</table>
<script>
function menuright(id){
   if (id == 'ms') {
        top.mainRight.mainLeft.location.href='<%=baseURL%>/forwardLeft_abdf.do';
   }
   else {
       top.mainRight.mainLeft.location.href='<%=baseURL%>/leftCoopBarCode_abdf.do?coopCode='+id; 
   }
}
</script>
<map name="Map">
  <area shape="rect" coords="0,44,33,126" href="#" onClick="image.src='<%=baseURL%>/gd/images/public/background_ms.jpg';menuright('ms')" onFocus="if(this.blur) this.blur()">
  <area shape="rect" coords="2,125,29,211" href="#" onClick="image.src='<%=baseURL%>/gd/images/public/background_new.jpg';menuright('ADD')"  onFocus="if(this.blur) this.blur()">
  <area shape="rect" coords="2,210,29,295" href="#" onClick="image.src='<%=baseURL%>/gd/images/public/background_list.jpg';menuright('LIST')"  onFocus="if(this.blur) this.blur()">
  <area shape="rect" coords="2,295,29,380" href="#" onClick="image.src='<%=baseURL%>/gd/images/public/background_report.jpg';menuright('STAT')"  onFocus="if(this.blur) this.blur()">
</map>