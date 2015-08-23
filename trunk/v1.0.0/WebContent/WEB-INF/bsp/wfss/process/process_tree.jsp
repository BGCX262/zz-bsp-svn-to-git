<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.wfss.model.Process"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>


<%@taglib uri="/WEB-INF/fireeagle.tld" prefix="fe"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>
<%!
  private void buildProcessTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
            String baseURL = request.getContextPath();
	        App app=WebHelper.getApp();
	        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
	         List allProcess=wfssServiceFacade.getProcessByAppId(app.getAppId());
            out.println("var t0 = new WebFXTree('"+app.getAppName()+"','javascript:doChangeMain(\\'"+app.getAppId()+"\\',\\'"+app.getAppName()+"\\')')");
            buildSubProcessTree(allProcess,app.getAppId(),baseURL,out);
               
        
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }
 private void buildSubProcessTree(List allProcess,String appId,String baseURL,JspWriter out) throws Exception
 {
     for(int i=0;i<allProcess.size();i++)
     {          
    	 Process process=(Process)allProcess.get(i);
    	 if(appId.endsWith(process.getAppId()))
         out.println("var t"+process.getAppFormId()+" = new WebFXTreeItem('"+process.getProcessName()+"','javascript:doChangeMainByFormId(\\'"+process.getProcessId()+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
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

function doChangeMain(appId,appName){
    parent.main.location.href="<%=baseURL%>/queryPageProcess_wfss.do?appId="+appId;
}

function doChangeMainByFormId(processId){
    parent.location.href="<%=baseURL%>/forwardProcessEditFrame_wfss.do?processId="+processId
}

function doChangeMainRoot(){
    parent.main.location.href="<%=baseURL%>/queryPageProcess_wfss.do";
}
function doNothing()
{
}
</script>
</head>
<body class="clsTreeBody">
<script>
<%   buildProcessTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll();
  </script></body>
</html>
