<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.youthor.bsp.view.urss.dict.OrgTypeDict"%>
<%@ page import="com.youthor.bsp.view.abdf.common.criterion.IDictDynamic"%>
<%@ page import="com.youthor.bsp.core.abdf.model.Item"%>

<%
String path = request.getContextPath();
IDictDynamic dictDynamic=new OrgTypeDict();
List orgTypes=dictDynamic.execute(request);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT type="text/javascript" language="javascript">
   var orgVo=window.dialogArguments.orgVo;
   function affirmClose()
        {
          var orgSelectTbody=selectedFrame.document.getElementById("orgSelectTbody");
           var objTableLength=orgSelectTbody.rows.length;
          if(objTableLength==1) 
           {
               orgVo.clearSubOrgVos();
           }
           else
           {
            orgVo.clearSubOrgVos();
            var subList=orgVo.getSubOrgVos();
           for(var i=1;i<objTableLength;i++)
           {
            
            
             var orgItemObject=orgSelectTbody.rows[i].children[0].children[0];
             var orgVoSub=new window.dialogArguments.OrgVo();
             orgVoSub.setOrgId(orgItemObject.getAttribute("orgId"));
             orgVoSub.setOrgName(orgItemObject.getAttribute("orgName"));
             orgVoSub.setOrgType(orgItemObject.getAttribute("orgType"));
             
             orgVoSub.setOrgParentId(orgItemObject.getAttribute("allParentIds"));
             orgVoSub.setOrgParentName(orgItemObject.getAttribute("allParentNames"));
             orgVoSub.setOrgParentType(orgItemObject.getAttribute("allParentTypes"));
             subList[i-1]=orgVoSub;
           }
          }
          returnValue=true;
          window.close();
        }
        
function getOrgNameByOrgType(orgType)
{
   var orgTypeName="";
   <%for(int i=0;i<orgTypes.size();i++)
   {
      Item item=(Item)orgTypes.get(i);
      %>
      if(orgType=='<%=item.getKey()%>')
         orgTypeName='<%=item.getValue()%>';
      <%
   }
   %>
   return orgTypeName
}
</SCRIPT>
<title>组织架构选择</title>
</head>
<frameset rows="*,40" frameborder="no" border="0" framespacing="0">
  <frameset cols="*,75,*" frameborder="no" border="0" framespacing="0">
	  <frame src="<%=path%>/forwardOfferOrgSelect_urss.do" name="offerSelectFrame" scrolling="NO" noresize>
	  <frame src="<%=path%>/forwardSelectHandle_urss.do" name="selectHandleFrame" scrolling="NO" noresize>
	  <frame src="<%=path%>/forwardSelectOrg_urss.do" name="selectedFrame" scrolling="NO" noresize id="selectedFrame">
   </frameset>
  <frame src="<%=path%>/forwardBottomOrg_urss.do" name="bottomFrame" scrolling="NO" noresize id="bottomFrame">
</frameset>
<noframes><body>
</body></noframes>
</html>

