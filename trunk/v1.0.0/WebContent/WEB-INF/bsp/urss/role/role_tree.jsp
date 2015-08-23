<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.core.urss.model.Role"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.Constants"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>


<%@taglib uri="/WEB-INF/fireeagle.tld" prefix="fe"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>
<%!
  private void buildRoleTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session,String appId) {
    try {
          String baseURL = request.getContextPath();
         //根据模块名来行分类
          if(appId.equals(""))
         {
           List rightApp=(List)request.getAttribute("rightApp");
           if(rightApp!=null&&rightApp.size()>0)
           {
             appId=((App)rightApp.get(0)).getAppId();
           }
         }
         IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
         out.println("var t0 = new WebFXTree('角色树','javascript:doChangeMainRoot(\\'"+appId+"\\')')");
        
           if(!appId.equals(""))
           {
        
              
              List allRole=urssServiceFacade.getRoleByAppIdAndComId(appId, WebHelper.getTopOrgId(session, Constants.GLOBAL_GS));
             if(allRole!=null&&allRole.size()>0)
             {
                for(int i=0;i<allRole.size();i++)
                {
                   Role role=(Role)allRole.get(i);
                  out.println("var t"+role.getRoleId()+" = new WebFXTreeItem('"+role.getRoleName()+"','javascript:doChangeMain(\\'"+role.getRoleId()+"\\',\\'"+role.getRoleName()+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                    
                }
             }
             
           }
        
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }

%>

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<script type="text/javascript">
var webFXTreeConfig = {
	rootIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	openRootIcon    : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	folderIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png',
	openFolderIcon  : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	fileIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	iIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/I.png',
	lIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/L.png',
	lMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lminus.png',
	lPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lplus.png',
	tIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/T.png',
	tMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tminus.png',
	tPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tplus.png',
	blankIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/blank.png',
	defaultText     : 'Tree Item',
	defaultAction   : 'javascript:void(0);',
	defaultBehavior : 'classic',
	usePersistence	: false
};

function doChangeMain(roleId,roleName){
     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/showRole_urss.do?roleId="+roleId;
     else
     {
       parent.main.document.getElementById("moveToDataId").value=roleId;
       parent.main.document.getElementById("moveToDataName").value=roleName;
     }
        
  }
 function doChangeMainRoot(appId)
 {
     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/getTopRoleByAppIdAndComId_urss.do?appd="+appId;
     else
     {
        
     }
      
 }
function doNothing()
{
  
}
function changeApp()
{
    location.href="<%=baseURL%>/forwardRoleTree_urss.do?appId="+event.srcElement.value;
}
</script>
</head>
<body class="clsTreeBody" >
<%String appId=request.getParameter("appId");
if(appId==null) appId="";
%>
<fe:dropDown dictType="app" property="appId" defaultValue="<%=appId%>" dynamic="true" struts="false" require="true" onchange="changeApp()"/>
<hr>
<script>
<%   buildRoleTreeSrc(out,request,session,appId);%>
        document.write(t0)
        t0.expandAll();
        <%
           String reloadMid=request.getParameter("reloadMid");
           if(reloadMid==null) reloadMid="";
           if(appId==null || appId.equals(""))
           {
	           List rightApp=(List)request.getAttribute("rightApp");
	           if(rightApp!=null&&rightApp.size()>0)
	           {
	             appId=((App)rightApp.get(0)).getAppId();
	           }
	      }
	      
	   if(!reloadMid.equals("false"))
	   {
    %>
      parent.main.location.href="<%=baseURL%>/getTopRoleByAppIdAndComId_urss.do?appId=<%=appId%>";
      <%}%>
  </script></body>
</html>
