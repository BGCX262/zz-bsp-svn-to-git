<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>

<%@taglib uri="/WEB-INF/fireeagle.tld" prefix="fe"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>
<%!
  private void buildFunctionTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session,String appId) {
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
         out.println("var t0 = new WebFXTree('功能树','javascript:doChangeMainRoot(\\'"+appId+"\\')')");
           if(!appId.equals(""))
           {
              List allFunction=urssServiceFacade.getAllFunctionByAppId(appId);
             if(allFunction!=null&&allFunction.size()>0)
             {
                for(int i=0;i<allFunction.size();i++)
                {
                   Function function=(Function)allFunction.get(i);
                   if(function.getParentId()==null||function.getParentId().equals(""))
                   {
                       out.println("var t"+function.getFunModuleId()+" = new WebFXTreeItem('"+function.getFunModuleName()+"','javascript:doChangeMain(\\'"+function.getFunModuleId()+"\\',\\'"+function.getFunModuleName()+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildSubFunctionTree(function,allFunction,baseURL,out);
                   }
                }
             }
             
           }
        
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }
 private void buildSubFunctionTree(Function function,List allFunction,String baseURL,JspWriter out) throws Exception
 {
   if(allFunction!=null&&allFunction.size()>0)
    {
      for(int i=0;i<allFunction.size();i++)
      {
                   Function subfunction=(Function)allFunction.get(i);
                   if(!StringHelper.doWithNull(subfunction.getParentId()).equals("")&&subfunction.getParentId().equals(function.getFunModuleId()))
                   {
                       out.println("var t"+subfunction.getFunModuleId()+" = new WebFXTreeItem('"+subfunction.getFunModuleName()+"','javascript:doChangeMain(\\'"+subfunction.getFunModuleId()+"\\',\\'"+subfunction.getFunModuleName()+"\\')',t"+function.getFunModuleId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildSubFunctionTree(subfunction,allFunction,baseURL,out);
                   }
                }
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

function doChangeMain(functionId,functionName){
     var roleRightTbodyObj=parent.main.document.getElementById("roleRightTbody");  
     if(roleRightTbodyObj==null)
     {
        alert("请先选择角色");
        return;
     }
     if(roleRightTbodyObj!=null&&roleRightTbodyObj.rows.length>1)
     {
        for(var i=0;i<roleRightTbodyObj.rows.length;i++)
        {
            roleRightTbodyObj.rows[i].style.display='none';
           var allParentIds=roleRightTbodyObj.rows[i].getAttribute("allParentId");
           if(allParentIds.indexOf(functionId)>=0)
           {
              roleRightTbodyObj.rows[i].style.display='';
           }
        }
     }
    
        
  }
 function doChangeMainRoot(appId)
 {
     
      
 }
function doNothing()
{
  
}

</script>
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/style.css" >
</head>
<body class="right_body_left"  >
<%String appId=request.getParameter("appId");
if(appId==null) appId="";
%>
<script>
<%   buildFunctionTreeSrc(out,request,session,appId);%>
        document.write(t0)
        t0.expandAll();
        
  </script></body>
</html>
