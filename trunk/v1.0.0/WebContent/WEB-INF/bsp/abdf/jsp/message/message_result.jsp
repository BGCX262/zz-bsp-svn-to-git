<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>

<fe:body>
	<fe:topTable>
	</fe:topTable>
	
  	<fe:span>
  	<br/>
  	<div style="text-align: center">
  	操作成功！<Br/><br/>
  	
  	&nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='返回' class='Button3' 
  		onclick="buttomOnClick('<bean:write name="targertUrl"/>','parent');" id='baseStation_show'>&nbsp;&nbsp;</span>
  	</div>
	</fe:span>
	 <fe:bottomTable>
	   <div align="center" ><strong>操作结果</strong></div>
	 </fe:bottomTable>
</fe:body>
</html>
