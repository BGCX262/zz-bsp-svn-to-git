<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <%@ page import="java.util.*"%>	
    <script> 
      var notAddToRloeTbodyObj=parent.document.getElementById("notAddToRloeTbody");
      var addToRloeTbodyObj=parent.document.getElementById("addToRloeTbody")
      
        for(var i=notAddToRloeTbodyObj.rows.length-1;i>=1;i--)
        {
            notAddToRloeTbodyObj.removeChild(notAddToRloeTbodyObj.rows[i]);
        }
        
         for(var i=addToRloeTbodyObj.rows.length-1;i>=1;i--)
        {
            addToRloeTbodyObj.removeChild(addToRloeTbodyObj.rows[i]);
        }
       
      
       <logic:notEmpty name="noAddList">
	  <logic:iterate id="noAddOrg" name="noAddList">
		  var notAddToRloeTbodyObjLength=notAddToRloeTbodyObj.rows.length;
	      var myrow=notAddToRloeTbodyObj.insertRow(notAddToRloeTbodyObjLength);
	      var mycell=myrow.insertCell();
	      mycell.className="";
		  mycell.setAttribute("align","center");
		  var html="<input type='checkBox'  name='notAddOrg' value='<bean:write name="noAddOrg" property="orgId"/>' onclick='selectParentAll()'>";
		  html=html+"<input type='checkBox' style='display:none' name='allParentNames' value='<bean:write name="noAddOrg" property="allParentName"/>'/>";
		  html=html+"<input type='checkBox' style='display:none' name='orgNames' value='<bean:write name="noAddOrg" property="orgName"/>'/>";
		 
		  mycell.innerHTML=html;
		  mycell=myrow.insertCell();
		  mycell.className="";
		  mycell.innerHTML="<bean:write name="noAddOrg" property="allParentName"/>";
		  mycell=myrow.insertCell();
		  mycell.className="";
		  mycell.innerHTML="<bean:write name="noAddOrg" property="orgName"/>";
	      
	  </logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="addList">
	  <logic:iterate id="roleOrg" name="addList">
		  var addToRloeTbodyObjLength=addToRloeTbodyObj.rows.length;
	      var myrow=addToRloeTbodyObj.insertRow(addToRloeTbodyObjLength);
	      var mycell=myrow.insertCell();
	      mycell.className="";
		  mycell.setAttribute("align","center");
		  var html="<input type='checkBox'  name='addOrg' orgId='<bean:write name="roleOrg" property="orgId"/>'  value='<bean:write name="roleOrg" property="roleOrgId" />' onclick='selectParentAll()'>";
		  html=html+"<input type='checkBox' style='display:none' name='allParentNames_del' value='<bean:write name="roleOrg" property="allParentName"/>'/>";
		  html=html+"<input type='checkBox' style='display:none' name='orgNames_del' value='<bean:write name="roleOrg" property="orgName"/>'/>";
		  html=html+"<input type='checkBox' style='display:none' name='orgIds_del' value='<bean:write name="roleOrg" property="orgId"/>'/>";
		  mycell.innerHTML=html;
		  mycell=myrow.insertCell();
		  mycell.className="";
		  mycell.innerHTML="<bean:write name="roleOrg" property="allParentName"/>";
		  mycell=myrow.insertCell();
		  mycell.className="";
		  mycell.innerHTML="<bean:write name="roleOrg" property="orgName"/>";
		  mycell=myrow.insertCell();
		  mycell.className="";
		  mycell.innerHTML="<bean:write name="roleOrg" property="createName"/>";
		  mycell=myrow.insertCell();
		  mycell.className="";
		  mycell.innerHTML="<bean:write name="roleOrg" property="createTime" format="yyyy-MM-dd"/>";
	  </logic:iterate>
	</logic:notEmpty>
	 
    </script>
	</head>
	<html>
	<body>
	
	</body>
    </html>


