<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.core.urss.model.Role"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.Constants"%>
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
              List allRole=urssServiceFacade.getRoleByAppIdAndComId(appId, WebHelper.getTopOrgId(session, Constants.GLOBAL_GS).trim());
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
    usePersistence    : false
};

function changeApp()
{
    location.href="<%=baseURL%>/forwardRoleRightTree_urss.do?appId="+event.srcElement.value;
     parent.right.location.href="<%=baseURL%>/forwardRightFunctionTree_urss.do?appId="+event.srcElement.value;
      parent.main.location.href="<%=baseURL%>/forwardRoleRightDes_urss.do";
}
</script>
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/style.css" >
</head>
<body class="right_body_left">
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
           if(appId.equals(""))
           {
               List rightApp=(List)request.getAttribute("rightApp");
               if(rightApp!=null&&rightApp.size()>0)
               {
                 appId=((App)rightApp.get(0)).getAppId();
               }
          }
          %>
          parent.right.location.href="<%=baseURL%>/forwardRightFunctionTree_urss.do?appId=<%=appId%>"
          parent.main.location.href="<%=baseURL%>/forwardRoleRightDes_urss.do";
          
 function doChangeMain(roleId,roleName){
      parent.main.location.href="<%=baseURL%>/getFunctionByRoleId_urss.do?roleId="+roleId+"&appId=<%=appId%>";   
  }
 function doChangeMainRoot(appId)
 {
    
      
 }
function doNothing()
{
  
}
  </script></body>
</html>
