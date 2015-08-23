<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>	
<%@ page import="com.youthor.bsp.core.urss.model.Function"%>
<%@ page import="com.youthor.bsp.core.urss.model.Right"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
	
<%@ page import="java.util.*"%>	
<%!
private String  getAllLinkAssignResource(List resourceList,Resource resource,StringBuffer sbHaveLoop) {
	
    if(StringHelper.doWithNull(resource.getParentResId()).equals("")&&StringHelper.doWithNull(resource.getLinkAssignValue()).equals(""))
       return "";
    sbHaveLoop.append(resource.getResourceId()+",");
    StringBuffer sb=new StringBuffer();
    //父资源是必需联带分配的
    if(!StringHelper.doWithNull(resource.getParentResId()).equals(""))
    {
       sb.append(resource.getParentResId()+",");
    }
    //本身有的要联带分配的
    if(!StringHelper.doWithNull(resource.getLinkAssignValue()).equals(""))
    {
       sb.append(resource.getLinkAssignValue()+",");
    }
    if(sb.toString().equals("")) return "";
    //过滤相同的
    String [] topLink=StringHelper.split(sb.toString(),",");
    String [] sbHaveLoopArr=StringHelper.split(sbHaveLoop.toString(),",");
    for(int i=0;i<topLink.length;i++)
    {
      if(topLink[i].equals("")) continue;
       Resource resourceTemp=getResourceById(resourceList,topLink[i]);
       boolean loop = true;
       for(int n=0;n<sbHaveLoopArr.length;n++) {
    	   if(sbHaveLoopArr[n].equals(resourceTemp.getResourceId())) {
    		   loop = false;
    		   break;
    	   }
       }
       if(loop) {
	   String sbString=getAllLinkAssignResource(resourceList,resourceTemp,sbHaveLoop);
		   if(sbString!=null&&!sbString.equals(""))
		   {
		      sb.append(sbString+",");
		   }
       }
    }
    return StringHelper.arrToString(filterSame(sb));
  }


 private Resource getResourceById(List resourceList,String resourceId)
 {
    for(int i=0;i<resourceList.size();i++)
    {
       Resource resource=(Resource)resourceList.get(i);
       if(resource.getResourceId().equals(resourceId))
         return resource;
    }
    return null;
 }
 private String [] filterSame(StringBuffer sb)
 {
    String all=sb.toString();
    if(all.endsWith(",")) all=all.substring(0,all.length()-1);
    String [] allStr=StringHelper.split(all,",");
    return StringHelper.filterSameString(allStr);
 }
%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <SCRIPT language="javascript" type="text/javascript">
      function selectFunctionResource(evt)
	 {
	     var td=evt.parentElement.parentElement.children[1];
	     var chkObjs=td.children;
	     for(var i=0;i<chkObjs.length;i++)
	     {
	        if(chkObjs[i].type=='checkbox')
	        {
	           chkObjs[i].checked=evt.checked;
	        }
	     }
	 }
    function selectAllResource(evt)
    {
       var functionChk=document.getElementsByTagName("input");
       for(var i=0;i<functionChk.length;i++)
       {
           if(functionChk[i].type=='checkbox')
	        {
	           functionChk[i].checked=evt.checked;
	        }
       }
    }  
    
    function submitUserRight(evt)
    {
       evt.disabled=true;
       document.getElementById("userRightForm").submit();
    }
    <%String appId=(String)request.getAttribute("appId");%>
    function displayFunctionTree()
    {
       
           parent.right.location.href="<%=baseURL%>/forwardRightFunctionTree_urss.do?appId=<%=appId%>";
           parent.document.getElementById("mainFrame").cols="220,*,220";
        
       
    }
    
    function changeApp(evt)
    {
        var orgIdVaule=document.getElementById("orgId").value;
        location.href="<%=baseURL%>/showUserRight_urss.do?appId="+evt.value+"&orgId="+orgIdVaule;
        parent.document.getElementById("mainFrame").cols="220,*,220";
    }
    
    function changeRole()
    {
        var orgIdVaule=document.getElementById("orgId").value;
        var appIdVaule=document.getElementById("appId").value;
        var rowid=getCheckBoxValue("roles","&");
        location.href="<%=baseURL%>/showUserRight_urss.do?appId="+appIdVaule+"&orgId="+orgIdVaule+"&"+rowid;
    }
    function selectAllRoles()
    {
      selectAllCheckBox("roles");
      changeRole();
    }
    </SCRIPT>
   
	</head>
	<html>
	<fe:body onload="displayFunctionTree()">
	<fe:topTable> 
	<input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitUserRight(this)" id='UserRight_SAVE'>&nbsp;&nbsp;
                     <iframe name="userRightFrame" style="display:none" src="" id="userRightFrame"> </iframe>  
	</fe:topTable>
	
	 <form action="<%=baseURL%>/saveUserRight_urss.do" target="userRightFrame" method="post" name="userRightForm" id="userRightForm" style="margin: 0">	
		<table cellspacing="0" cellpadding="3" width="100%" class="tform" align=center>
		 
			<tr >
				<td colspan="1" width="15%">
				 所属系统：
               </td>
               <td colspan="3" width="20">
                 
                   <input type="hidden" name="orgId" id="orgId" value="<bean:write name="org" property="orgId"/>"/>
				   <fe:dropDown dictType="app" property="appId" dynamic="true" defaultValue="<%=appId%>" onchange="changeApp(this)" struts="false" require="true"/>
               </td>
              
			</tr>
			
			<tr >
				
               <td colspan="1" width="20%">
				<INPUT type="checkbox" onclick="selectAllRoles()">包含角色权限：
               </td>
               
               <td colspan="3" width="45%">
				  <fe:checkBox dictType="userRole" property="roles" dynamic="true" onclick="changeRole()" struts="false" defaultValue="<%=(String)request.getAttribute("rolesStr")%>"/>
                  &nbsp;
               </td>
			</tr>
    </table>
	
<TABLE cellspacing="0" cellpadding="0" width="100%" class="tlist" align="center">
    <thead>
		<tr>
			<th align="center"  width="25%"><INPUT type="checkBox" name="allFunction" onclick="selectAllResource(this)"><b>功能名称</b></th>
			<th width="75%" align="center"  nowrap="nowrap"><b>资源</b></th>
		</tr>
		</thead>
		<tbody id="roleRightTbody">
		<%
		List userResList=(List)request.getAttribute("userResList");
		if(userResList==null) userResList=new ArrayList();
		List functionList=(List)request.getAttribute("functionList");
		if(functionList!=null&&functionList.size()>0)
		{
		  for(int i=0;i<functionList.size();i++)
		  {
		   Function function=(Function)functionList.get(i);
		%>	
	
		<tr allParentId="<%=function.getAllParentId()%>:<%=function.getFunModuleId()%>">
			<td   width="45%" align="center" title="<%=function.getAllParentName()%>">
			<INPUT type="checkBox" name="allFunctionItem" onclick="selectFunctionResource(this)">
			<%=function.getFunModuleName()%>
			</td>
			<td width="35%"   nowrap="nowrap">
			 <%List resourceList=(List)function.getResourceList();
			 for(int j=0;j<resourceList.size();j++)
			 {
			   Resource resource=(Resource)resourceList.get(j);
			   if(StringHelper.doWithNull(resource.getLinkAssign()).equals("N"))
			   {
			        String checked="";
			        for(int r=0;r<userResList.size();r++)
			        {
			           Right rigth=(Right)userResList.get(r);
			          if(rigth.getResourceId().equals(resource.getResourceId()))
			          {
			             checked=" checked ";
			             break;
			          }
			        }
			 %>
			     <INPUT type="checkBox" name="resources" <%=checked%> value="<%=resource.getResourceId()%>:<%=function.getFunModuleId()%>"/>
			      <!-- 处理联带分配资源 -->
			     <%
				     String allLinkAssign=getAllLinkAssignResource(resourceList,resource,new StringBuffer());
				     if(!allLinkAssign.equals(""))
				     {
			     %>
			        <INPUT type="hidden" name="linkAssign_<%=resource.getResourceId()%>" value="<%=allLinkAssign%>">
			       <%}%>
			      <!-- 处理组织架构权限 -->
			      <%if(StringHelper.doWithNull(resource.getHaveOrgRight()).equals("N"))
			       {
			       %>
			       <%=resource.getResourceName()%><br>
			       <%}else{%>
			         <INPUT type="hidden" name="orgRight_<%=resource.getResourceId()%>" value="">
			        <a href="#" title="点击选择组织架构权限"><%=resource.getResourceName()%></a><br>
			     <%}%>
			 <%}
			 }
			 %>
			</td>
		</tr>
		
		<%}
		}
		%>
		</tbody>
	</form>
</table>
<fe:bottomTable>
  	<strong>
		<bean:write name="org" property="allParentName"/><bean:write name="org" property="orgName"/>
    </strong>
</fe:bottomTable>
</fe:body>
</html>


