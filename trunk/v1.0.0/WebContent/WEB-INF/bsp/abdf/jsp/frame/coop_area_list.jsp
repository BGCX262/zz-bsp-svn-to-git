<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.urss.model.CoopArea"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>
<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>

<html>

<fe:body >
	
	    <fe:topTable></fe:topTable>
		<fe:span>

		<table border="0" width="90%" align="center">
			<tr>
			 <%List listCoopArea = (List)request.getAttribute("coopAreaList");
				   if(listCoopArea!=null && listCoopArea.size()>0) {
					   for(int i=0;i<listCoopArea.size();i++) {
						   CoopArea coopArea =(CoopArea)listCoopArea.get(i);
						  List listRes =  coopArea.getResourceList();
				   %>
				   
				<td width="<%=(100/listCoopArea.size())%>%" valign="top">
				     <fieldset style='width:100%'><legend><B><%=coopArea.getCoopAreaName()%></B></legend>
				      <br>
	                   <TABLE cellspacing="0" cellpadding="0" width="100%"  align="center">
						
						    <%if (listRes!=null && listRes.size()>0) { 
						    	for (int j=0;j<listRes.size();j++) {
						    		Resource resource = (Resource)listRes.get(j);
						    		//if(resource.getCoopImg()==null || !resource.getCoopImg().equals("")) {
						  			//  resource.setCoopImg("/bsp/abdf/skins/default/img/toolbar/label.gif");
						  		  //}
						    	    if(resource.getImplUrl()==null || resource.getImplUrl().equals("")) continue;
						    %>
						    <tr>
						    <td width="100%"   nowrap="nowrap" height="25" valign="middle"><img alt="" src="<%=baseURL+resource.getCoopImg()%>" border="0"/><a href="<%=baseURL+resource.getImplCoopUrl()%>"><%=resource.getResourceName()%></a></td>
						    </tr>
							<%		
						    	}
						    }
						    %>
						
					</table>
                    </fieldset>
				</td>
				 <%	   
					   }
				   } %>
				</tr>
                   
				
		</table>
         
		 </fe:span>

	
	 <fe:bottomTable>
		<B>协同功能区</B>
	</fe:bottomTable>
</fe:body>
</html>

