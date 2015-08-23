<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <%@ page import="java.util.*"%>	
    <script> 
      var notAddToRloeTbodyObj=parent.document.getElementById("notAddToRloeTbody");
      var addToRloeTbodyObj=parent.document.getElementById("addToRloeTbody")
      
  
         for(var i=addToRloeTbodyObj.rows.length-1;i>=1;i--)
        {
          var childObj=addToRloeTbodyObj.rows[i].children[0].children[0];
        <logic:notEmpty name="noAddList">
	      <logic:iterate id="noAddOrg" name="noAddList">
	        if('<bean:write name="noAddOrg" property="orgId"/>'==childObj.getAttribute("orgId"))
               addToRloeTbodyObj.removeChild(addToRloeTbodyObj.rows[i]);
           </logic:iterate>
	     </logic:notEmpty>
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
	
	parent.document.getElementById("isUpdate").value="true";
	 
    </script>
	</head>
	<html>
	<body>
	
	</body>
    </html>


