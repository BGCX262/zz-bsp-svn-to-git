<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@page import="com.youthor.bsp.core.wfss.model.Process"%>
<%@page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@page import="com.youthor.bsp.core.wfss.model.Route"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>

<%@taglib uri="/WEB-INF/fireeagle.tld" prefix="fe"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>
<html>
<%!
  private void buildAppTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
          String processId=request.getParameter("processId");
          if(!StringHelper.doWithNull(processId).equals("")){
         //根据模块名来行分类
        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        Process process=wfssServiceFacade.getProcessById(processId);
         out.println("var t0 = new WebFXTree('"+process.getProcessName()+"','javascript:doChangeMainRoot(\\'"+process.getProcessId()+"\\')')");
             List allActivity=wfssServiceFacade.getActivityByProcessId(processId);
             List allRoute=wfssServiceFacade.getRouteByProcessId(processId);
             
             if(allActivity!=null&&allActivity.size()>0)
             {
                for(int i=0;i<allActivity.size();i++)
                {
                	Activity activity=(Activity)allActivity.get(i);
                  
                       out.println("var t"+activity.getActivityId()+" = new WebFXTreeItem('"+activity.getActivityName()+"','javascript:doChangeMain(\\'"+activity.getActivityId()+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/wf/node.gif','"+baseURL+"/bsp/abdf/skins/default/img/wf/node.gif')");
                       buildSubFormTree(activity,allRoute,baseURL,out);
                }
             }

          }else{
        	  
        	  out.println("var t0 = new WebFXTree('新增流程','javascript:doNothing()')");
          }
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }
 private void buildSubFormTree(Activity activity,List allRoute,String baseURL,JspWriter out) throws Exception
 {
     for(int i=0;i<allRoute.size();i++)
     {          
    	 Route route=(Route)allRoute.get(i);
    	 if(route.getActivityId().equals(activity.getActivityId()))
         out.println("var t"+route.getRouteId()+" = new WebFXTreeItem('"+route.getRouteName()+"','javascript:doChangeMainByRouteID(\\'"+route.getRouteId()+"\\',\\'"+route.getRouteName()+"\\')',t"+activity.getActivityId()+",'"+baseURL+"/bsp/abdf/skins/default/img/wf/route.gif','"+baseURL+"/bsp/abdf/skins/default/img/wf/route.gif')");
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

function doChangeMainRoot(processId){
    parent.main.location.href="<%=baseURL%>/showProcess_wfss.do?processId="+processId;
}

function doChangeMainByRouteID(routeId){
    parent.main.location.href="<%=baseURL%>/showRoute_wfss.do?routeId="+routeId;
}

function doChangeMain(activityId){
    parent.main.location.href="<%=baseURL%>/showActivity_wfss.do?activityId="+activityId;
}
function doNothing()
{
}
</script>
</head>
<body class="clsTreeBody">
<script>
<%   buildAppTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll();
  </script></body>
</html>
