<%
  String baseURL = request.getContextPath();      
%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@taglib uri="/WEB-INF/fireeagle.tld" prefix="fe"%>
<script language="javascript" type="text/javascript">

  var baseURL='<%=baseURL%>';       
 </script>
<%
  String tableStyle=" border=\"1\" cellSpacing=\"0\" cellpadding=\"1\"   bordercolorlight=\"#E2D7CF\" bordercolordark=\"#FAF8F6\"";
  String onbeforeunload ="onbeforeunload='javacript:return(isClose())'";
   String red="&nbsp;&nbsp;<font color='red' size='4'>*</font>";
  

%>

<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/feWin.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/public.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/ValidateMethodFactory.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/ValidationForm.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/ValidationField.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/Validation.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/Param.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/SubForm.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/ValidationFramework.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/validation/ValidationFramework.js"></script>
<script type="text/javascript"src="<%=baseURL%>/bsp/abdf/js/prototype.js"></script>
<script type="text/javascript"src="<%=baseURL%>/bsp/abdf/js/tab/tabpane.js"></script>
 <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/org/OrgVo.js" language="javascript"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/calendar.js" language="javascript"></script>
 <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/jquery.js" language="javascript"></script>
 <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/thickbox.js" language="javascript"></script>
 
 <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/scrollbutton.js"></script>
   <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/menu4.js"></script>
   <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/cb2.js"></script> 
   <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/popmenu/poslib.js"></script>
    <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/Item.js"></script>
    <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/wfField.js"></script>
      <script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/toolbar/toolbar.js"></script>
 

<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/thickbox.css" >
<link rel="StyleSheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/tab/tab.css">
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/mian.css" >
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/style.css" >
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/cb2.css" >

