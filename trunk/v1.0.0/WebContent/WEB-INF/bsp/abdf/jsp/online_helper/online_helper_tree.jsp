<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IAbdfServiceFacade"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.model.OnLineHelper"%>

<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>

<%!
  private void buildControlTreeTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
         
        IAbdfServiceFacade abdfServiceFacade=(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
       
         out.println("var t0 = new WebFXTree('帮助索引','javascript:doChangeMainRoot()')");
         
         List allOnLineHelper=abdfServiceFacade.getAllOnLineHelper();
             if(allOnLineHelper!=null&&allOnLineHelper.size()>0)
             {
                for(int i=0;i<allOnLineHelper.size();i++)
                {
                   OnLineHelper onLineHelper=(OnLineHelper)allOnLineHelper.get(i);
                   if(onLineHelper.getParentId()==null||onLineHelper.getParentId().equals(""))
                   {
                       out.println("var t"+onLineHelper.getOnLineHelperId()+" = new WebFXTreeItem('"+onLineHelper.getOnLineHelperName()+"','javascript:doChangeMain(\\'"+onLineHelper.getOnLineHelperId()+"\\',\\'"+onLineHelper.getOnLineHelperName()+"\\',\\'"+StringHelper.doWithNull(onLineHelper.getAllParentId())+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png')");
                       buildSubOnLineHelperTree(onLineHelper,allOnLineHelper,baseURL,out);
                   }
                }
             }
             
          
        
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildControlTreeSrc.\n" + ex);
    }
  }
 private void buildSubOnLineHelperTree(OnLineHelper onLineHelper,List allOnLineHelper,String baseURL,JspWriter out) throws Exception
 {
   if(allOnLineHelper!=null&&allOnLineHelper.size()>0)
    {
      for(int i=0;i<allOnLineHelper.size();i++)
      {
                   OnLineHelper subOnLineHelper=(OnLineHelper)allOnLineHelper.get(i);
                   if(!StringHelper.doWithNull(subOnLineHelper.getParentId()).equals("")&&subOnLineHelper.getParentId().equals(onLineHelper.getOnLineHelperId()))
                   {
                       out.println("var t"+subOnLineHelper.getOnLineHelperId()+" = new WebFXTreeItem('"+subOnLineHelper.getOnLineHelperName()+"','javascript:doChangeMain(\\'"+subOnLineHelper.getOnLineHelperId()+"\\',\\'"+subOnLineHelper.getOnLineHelperName()+"\\',\\'"+StringHelper.doWithNull(subOnLineHelper.getAllParentId())+"\\')',t"+onLineHelper.getOnLineHelperId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png')");
                       buildSubOnLineHelperTree(subOnLineHelper,allOnLineHelper,baseURL,out);
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
        parent.main.location.href="<%=baseURL%>/showOnLineHelper_abdf.do?onLineHelperId="+controlTreeId;
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
        parent.main.location.href="<%=baseURL%>/getTopOnLineHelper_abdf.do";
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
<%   buildControlTreeTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll(); 
  </script></body>
</html>
