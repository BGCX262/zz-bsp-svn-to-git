<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>	
<%@ page import="com.youthor.bsp.core.urss.model.Function"%>
<%@ page import="com.youthor.bsp.core.urss.model.Right"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@ page import="java.util.*"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
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
    
    function submitRoleRight(evt)
    {
       evt.disabled=true;
       document.getElementById("roleRightForm").submit();
    }
    </SCRIPT>
   
	</head>

	<fe:body>
	 <fe:topTable>
	  <fe:powerTool funCode="urss_assign_role" groupName="edit" favorite="false"/>
      <iframe name="roleRightFrame" style="display:none" src="" id="roleRightFrame"> </iframe>  
	</fe:topTable>
	<form action="<%=baseURL%>/saveRoleRight_urss.do" target="roleRightFrame" style="margin: 0" method="post" name="roleRightForm" id="roleRightForm">	
	
	
		
		<input type="hidden" name="appId" value="<bean:write name="app" property="appId"/>"/>
			<input type="hidden" name="roleId" value="<bean:write name="role" property="roleId"/>"/>
	<TABLE width="100%" cellspacing="0" cellpadding="0" width="96%" class="tlist"  align="center" >
	<thead>
		<tr>
			<td align="center"  width="35%"><INPUT type="checkBox" name="allFunction" onclick="selectAllResource(this)"><b>功能名称</b></th>
			<td width="65%" align="center"  nowrap="nowrap"><b>资源</b></th>
		
		</tr>
		</thead>
			
		<tbody id="roleRightTbody">
		<%
		List roleList=(List)request.getAttribute("roleList");
		if(roleList==null) roleList=new ArrayList();
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
			<td width="55%"   nowrap="nowrap">
			 <%List resourceList=(List)function.getResourceList();
			 for(int j=0;j<resourceList.size();j++)
			 {
			   Resource resource=(Resource)resourceList.get(j);
			   if(StringHelper.doWithNull(resource.getAssignMethod()).equals("display"))
			   {
			        String checked="";
			        for(int r=0;r<roleList.size();r++)
			        {
			           Right rigth=(Right)roleList.get(r);
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
</table>
	

</form>
<fe:bottomTable>
		<strong>
			为<bean:write name="app" property="appName"/>系统下<bean:write name="role" property="roleName"/>角色分配权限
       </strong>
	</fe:bottomTable>


</fe:body>
</html>