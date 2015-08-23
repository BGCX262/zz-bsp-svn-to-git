<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IAbdfServiceFacade"%>

<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.model.DictTree"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
  String treeType=request.getParameter("treeType");
%>

<html>

<%!
  private void buildDictTreeTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
          String treeType=request.getParameter("treeType");
        IAbdfServiceFacade abdfServiceFacade=(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
        DictTree controlTreeRoot=abdfServiceFacade.getDictTreeRoot(treeType);
         out.println("var t0 = new WebFXTree('"+controlTreeRoot.getTreeName()+"','javascript:doChangeMainRoot()')");
         List allDictTree=abdfServiceFacade.getAllDictTreeByType(treeType);
             if(allDictTree!=null&&allDictTree.size()>0)
             {
                for(int i=0;i<allDictTree.size();i++)
                {
                   DictTree controlTree=(DictTree)allDictTree.get(i);
                   if(controlTree.getParentId()==null||controlTree.getParentId().equals(""))
                   {
                       out.println("var t"+controlTree.getTreeId()+" = new WebFXTreeItem('"+controlTree.getTreeName()+"','javascript:doChangeMain(\\'"+controlTree.getTreeId()+"\\',\\'"+controlTree.getTreeName()+"\\',\\'"+StringHelper.doWithNull(controlTree.getAllParentId())+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildSubDictTree(controlTree,allDictTree,baseURL,out);
                   }
                }
             }
             

         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTreeSrc.\n" + ex);
    }
  }
 private void buildSubDictTree(DictTree controlTree,List allDictTree,String baseURL,JspWriter out) throws Exception
 {
   if(allDictTree!=null&&allDictTree.size()>0)
    {
      for(int i=0;i<allDictTree.size();i++)
      {
                   DictTree subDictTree=(DictTree)allDictTree.get(i);
                   if(!StringHelper.doWithNull(subDictTree.getParentId()).equals("")&&subDictTree.getParentId().equals(controlTree.getTreeId()))
                   {
                       out.println("var t"+subDictTree.getTreeId()+" = new WebFXTreeItem('"+subDictTree.getTreeName()+"','javascript:doChangeMain(\\'"+subDictTree.getTreeId()+"\\',\\'"+subDictTree.getTreeName()+"\\',\\'"+StringHelper.doWithNull(subDictTree.getAllParentId())+"\\')',t"+controlTree.getTreeId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildSubDictTree(subDictTree,allDictTree,baseURL,out);
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
    usePersistence    : false
};

function doChangeMain(controlTreeId,controlTreeName,allParentId){

      

     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/showDictTree_abdf.do?treeId="+controlTreeId+"&treeType=<%=treeType%>";
     else
     {
       parent.main.document.getElementById("moveToDataId").value=controlTreeId;
       parent.main.document.getElementById("moveToDataAllId").value=allParentId;
       parent.main.document.getElementById("moveToDataName").value=controlTreeName;
     }
        
  }
 function doChangeMainRoot()
 {
     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/getTopDictTreeByType_abdf.do?treeType=<%=treeType%>";
     else
     {
        alert("移动时，不能选择根!");
     }
      
 }
function doNothing()
{
  
}
</script>
</head>
<body class="clsTreeBody" >
<script>
<%   buildDictTreeTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll(); 
  </script></body>
</html>
