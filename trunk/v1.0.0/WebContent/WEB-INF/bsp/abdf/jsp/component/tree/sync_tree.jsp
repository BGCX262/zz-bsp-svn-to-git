<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IAbdfServiceFacade"%>

<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.model.DictTree"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.abdf.model.DictTreeType"%>
<%@ page import="com.youthor.bsp.core.abdf.common.AbdfCache"%>
<%@ page import="com.youthor.bsp.core.abdf.common.model.Tree"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  
  String treeType=request.getParameter("treeType");
%>

<html>

<%!
  private void buildDictTreeTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
          String treeType=request.getParameter("treeType");
        IAbdfServiceFacade abdfServiceFacade=(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
        DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
         out.println("var t0 = new WebFXTree('"+dictTreeType.getTreeTypeName()+"','javascript:doChangeMainRoot()')");
         List allNodeTreeData=abdfServiceFacade.getAllNodeDataByDictTreeType(dictTreeType);
             if(allNodeTreeData!=null&&allNodeTreeData.size()>0)
             {
                for(int i=0;i<allNodeTreeData.size();i++)
                {
                   Tree tree=(Tree)allNodeTreeData.get(i);
                   if(tree.getParentId()==null||tree.getParentId().equals(""))
                   {
                       out.println("var t"+tree.getId()+" = new WebFXTreeItem('"+tree.getName()+"','javascript:doChangeMain(\\'"+tree.getId()+"\\',\\'"+tree.getName()+"\\',\\'"+StringHelper.doWithNull(tree.getAllParentId())+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildTree(tree,allNodeTreeData,baseURL,out);
                   }
                }
             }
             

         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTreeSrc.\n" + ex);
    }
  }
 private void buildTree(Tree tree,List allNodeTreeData,String baseURL,JspWriter out) throws Exception
 {
   if(allNodeTreeData!=null&&allNodeTreeData.size()>0)
    {
      for(int i=0;i<allNodeTreeData.size();i++)
      {
                   Tree subTree=(Tree)allNodeTreeData.get(i);
                   if(!StringHelper.doWithNull(subTree.getParentId()).equals("")&&subTree.getParentId().equals(tree.getId()))
                   {
                       out.println("var t"+subTree.getId()+" = new WebFXTreeItem('"+subTree.getName()+"','javascript:doChangeMain(\\'"+subTree.getId()+"\\',\\'"+subTree.getName()+"\\',\\'"+StringHelper.doWithNull(subTree.getAllParentId())+"\\')',t"+tree.getId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       buildTree(subTree,allNodeTreeData,baseURL,out);
                   }
                }
             }
 }
%>

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/bsp/abdf/common.jsp"%>
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

function doChangeMain(controlTreeId,controlTreeName,allParentId){

      

     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/showTreeNodeObject_abdf.do?id="+controlTreeId+"&treeTypeCode=<%=treeType%>";
     else
     {
       parent.main.document.getElementById("moveToDataId").value=controlTreeId;
       parent.main.document.getElementById("moveToDataParentId").value=allParentId;
       parent.main.document.getElementById("moveToDataName").value=controlTreeName;
     }
        
  }
 function doChangeMainRoot()
 {
     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/listTopNodeObjectByType_abdf.do?treeType=<%=treeType%>";
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
<body class="right_body_left" >
<script>
<%   buildDictTreeTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll(); 
  </script>
  </body>
</html>
