<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String appFormId=request.getParameter("appFormId");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT type="text/javascript" language="javascript">
 var parentArg=window.dialogArguments;
function affirmClose()
{
  var selectValue=selectedFrame.document.getElementsByName("itemIdCheckBox");
  var values="";
  var names="";
  if(selectValue!=null&&selectValue.length>0)
  {
     for(var i=0;i<selectValue.length;i++)
     {
        var itemObj=selectValue[i];
        if(itemObj.checked)
        {
            values=values+itemObj.value+",";
            names=names+itemObj.getAttribute("fieldName")+"("+itemObj.value+"),";
        }
     }
     values=values.substring(0,values.length-1);
     names=names.substring(0,names.length-1);
  }
  returnValue=values+"{}"+names;
  window.close();
}
</SCRIPT>
<title>选择可编辑域</title>
</head>
<frameset rows="*,40" frameborder="no" border="0" framespacing="0">
   <frame src="<%=path%>/forwardEditFieldOffer_wfss.do?appFormId=<%=appFormId%>" name="selectedFrame" scrolling="NO" noresize id="selectedFrame">
  <frame src="<%=path%>/forwardEditFieldBottom_wfss.do" name="bottomFrame" scrolling="NO" noresize id="bottomFrame">
</frameset>
<noframes><body>
</body></noframes>
</html>

