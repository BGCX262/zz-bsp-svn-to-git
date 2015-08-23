<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>

<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>
<%!
  private void buildMenuTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
         //根据模块名来行分类
         String funId=(String)request.getAttribute("funId");
            List haveMenuList=(List)request.getAttribute("haveMenuList");
             if(haveMenuList!=null&&haveMenuList.size()>0)
             {
                //找根
                Function function=null;
                 for(int i=0;i<haveMenuList.size();i++)
                {
                   Function functionTemp=(Function)haveMenuList.get(i);
                   if(funId.equals(functionTemp.getFunModuleId()))
                   {
                      function=functionTemp;
                      break;
                   }
                 }
                  String url=function.getImplUrl();
                   if(url==null) url="";
                 String fold=function.getFoldArea();
                       if(fold==null) fold="Y";
                 out.println("var t0 = new WebFXTree('"+function.getFunModuleName()+"','javascript:doChangeMain(\\'"+url+"\\',\\'"+fold+"\\')')");
                for(int i=0;i<haveMenuList.size();i++)
                {
                   Function functionSub=(Function)haveMenuList.get(i);
                   if(functionSub.getParentId()!=null&&functionSub.getParentId().equals(function.getFunModuleId()))
                   {
                         url=functionSub.getImplUrl();
                        if(url==null) url="";
                        fold=functionSub.getFoldArea();
                       if(fold==null) fold="Y";
                       out.println("var t"+functionSub.getFunModuleId()+" = new WebFXTreeItem('"+functionSub.getFunModuleName()+"','javascript:doChangeMain(\\'"+url+"\\',\\'"+fold+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildSubMenuTree(functionSub,haveMenuList,baseURL,out);
                   }
                }
             }
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }
 private void buildSubMenuTree(Function function,List haveMenuList,String baseURL,JspWriter out) throws Exception
 {
   if(haveMenuList!=null&&haveMenuList.size()>0)
    {
      for(int i=0;i<haveMenuList.size();i++)
      {
                   Function subfunction=(Function)haveMenuList.get(i);
                   if((!StringHelper.doWithNull(subfunction.getParentId()).equals(""))&&subfunction.getParentId().equals(function.getFunModuleId()))
                   {
                        String url=subfunction.getImplUrl();
                       if(url==null) url="";
                       String fold=subfunction.getFoldArea();
                       if(fold==null) fold="Y";
                       out.println("var t"+subfunction.getFunModuleId()+" = new WebFXTreeItem('"+subfunction.getFunModuleName()+"','javascript:doChangeMain(\\'"+url+"\\',\\'"+fold+"\\')',t"+function.getFunModuleId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildSubMenuTree(subfunction,haveMenuList,baseURL,out);
                   }
                }
             }
 }
%>
<head>
    
    <style type="text/css">
<!--
BODY{
    
    margin:0 0 0 0 ;
    font-family: "Arial";
    font-size:12px ; 
    SCROLLBAR-FACE-COLOR: #f6f6f6; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #cccccc; SCROLLBAR-3DLIGHT-COLOR: #cccccc; SCROLLBAR-ARROW-COLOR: #330000; SCROLLBAR-TRACK-COLOR: #f6f6f6; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; 
}

td{
    
    font-family: "Arial";
    font-size:12px ; 
}
a{color:#000; text-decoration:none;}
a:hover{color:#ff6600; text-decoration:underline;}
-->
</style>
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

function doChangeMain(url,fold){
    if(url!="")
    {
           top.main.location.href="<%=baseURL%>"+url;
           if(fold=='Y')
           {
              top.leftIcon.resizeLeft();
           }
    }
        
  }

function doNothing()
{
  
}

</script>
</head>
<body class="clsTreeBody" >
<script>
<%   buildMenuTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll();
       
  </script></body>
</html>
