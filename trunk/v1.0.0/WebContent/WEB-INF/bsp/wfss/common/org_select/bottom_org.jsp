<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<html>
	<head>
		<title>接钮操作</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
    <script type="text/javascript" language="javascript">
       function closeWindow()
       {
          top.window.close();
       }
        function affirmClose()
        {
          parent.affirmClose();
        }
    </script>
	<body>
	 
		<table border="0" width="98%" align="center" >
			<tr>
			<td align="center"  width="50%">
				 操作对象：<input size="16" name="orgName" class="formStyleall" type="text"  id="orgName" readonly="true">
				 类型：<input size="4" name="orgType" class="formStyleall" type="text"  id="orgType" readonly="true">
			</td>
			
				<td align="right" width="50%" valign="middle">
				  <input type='button' name='Submit'   value='确定' class='Button3' onclick="affirmClose()">
				  <input type='button' name='Submit'   value='关闭' class='Button3' onclick="closeWindow()">
				</td>
			</tr>
		  </table>
		
	</body>
</html>

