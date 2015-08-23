<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@ page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@page import="com.youthor.bsp.view.wfss.common.FlowEngineView"%>
<%@page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.wfss.model.Participant"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>


<%@ page import="java.util.*"%>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xtree.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xmlextras.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xloadtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<%String routeId=request.getParameter("routeId");
Activity activity = null;
if (routeId!=null&&!routeId.equals("")) {
	activity = FlowEngineView.getToActivityByRouteId(routeId);
}else {
	String activityId=request.getParameter("activityId");
	IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
	activity = wfCacheEngine.getActivityById(activityId);
}
IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
List list=wfssServiceFacade.getParticipantByAId(activity.getActivityId());
if(list==null) list=new ArrayList();
boolean user=false;
boolean org=false;
boolean js=false;
boolean team=false;
boolean post=false;
for(int i=0;i<list.size();i++)
{
   Participant participant=(Participant)list.get(i);
   if(participant.getMemberType().equals("USER"))
   {
      user=true;
   }
   if(participant.getMemberType().equals("ORG"))
   {
      org=true;
   }
}
%>
<script type="text/javascript">

function doChangeMain(orgId,orgName,orgType,allParentIds,allParentNames,allParentTypes)
{
   
   var orgNameObj=parent.bottomFrame.document.getElementById("orgName");
    orgNameObj.value=orgName;
   orgNameObj.setAttribute("orgId",orgId);
   orgNameObj.setAttribute("orgName",orgName);
   orgNameObj.setAttribute("orgType",orgType);
    var orgTypeName=parent.getOrgNameByOrgType(orgType);
   orgNameObj.setAttribute("orgTypeName",orgTypeName);
   parent.bottomFrame.document.getElementById("orgType").value=orgTypeName;
   
}

function doChangeSelect(orgId,orgName,orgType)
{
   var orgNameObj=parent.bottomFrame.document.getElementById("orgName");
    orgNameObj.value=orgName;
   orgNameObj.setAttribute("orgId",orgId);
   orgNameObj.setAttribute("orgName",orgName);
   orgNameObj.setAttribute("orgType",orgType);
    var orgTypeName=parent.getOrgNameByOrgType(orgType);
   orgNameObj.setAttribute("orgTypeName",orgTypeName);
   parent.bottomFrame.document.getElementById("orgType").value=orgTypeName;
}

webFXTreeConfig.rootIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png";
webFXTreeConfig.openRootIcon  = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
webFXTreeConfig.folderIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png";
webFXTreeConfig.openFolderIcon  = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
webFXTreeConfig.fileIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
webFXTreeConfig.lMinusIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lminus.png";
webFXTreeConfig.lPlusIcon   = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lplus.png";
webFXTreeConfig.tMinusIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tminus.png";
webFXTreeConfig.tPlusIcon   = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tplus.png";
webFXTreeConfig.iIcon     = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/I.png";
webFXTreeConfig.lIcon     = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/L.png";
webFXTreeConfig.tIcon     = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/T.png";
webFXTreeConfig.blankIcon   = '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/blank.png';
</script>
<html>
	<head>
		<title>可供选择参与者</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
</style>

	</head>
	<body>

		<table border="0" width="100%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="OGR_SELECT_tabPane1" style="height:390">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("OGR_SELECT_tabPane1"));</script>
						<%if(user){%>
						<div class="tab-page" id="OGR_SELECT_tabPage2" style="height:390" style="overflow:hidden">
							<h2 class="tab" >人员</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("OGR_SELECT_tabPage2" ) );</script>
						       <div   style="height:350" style="overflow:auto">
						       <script language="javascript" type="text/javascript">
						         var tree1 = new WebFXLoadTree("人员","<%=baseURL%>/wfOrgAsynSpread_wfss.do?flag=USER&activityId=<%=activity.getActivityId()%>","",null);
						           document.write(tree1)
                                
						        </script>
						       </div>
						      
						</div>
						<%}%>
						<%if(org){%>
							<div class="tab-page" id="OGR_SELECT_tabPage3" style="height:390" style="overflow:hidden">
							<h2 class="tab" >组织</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("OGR_SELECT_tabPage3" ) );</script>
						       <div  style="height:350" style="overflow:auto">
						       <script language="javascript" type="text/javascript">
						         var tree2 = new WebFXLoadTree("组织","<%=baseURL%>/wfOrgAsynSpread.do?flag=ORG&activityId=<%=activity.getActivityId()%>","",null);
						           document.write(tree2)
						        </script>
						       </div>
						     
						     
						</div>
						<%}%>
						<%if(js){%>
						<div class="tab-page" id="OGR_SELECT_tabPage4" style="height:390" style="overflow:hidden">
							<h2 class="tab" >角色</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("OGR_SELECT_tabPage4" ) );</script>
						   
						       <div  id="OGR_Tree" style="height:350" style="overflow:auto">
						       <script language="javascript" type="text/javascript">
						         
						        </script>
						       </div>
						      
						</div>
						<%}%>
						<%if(team){%>
						<div class="tab-page" id="OGR_SELECT_tabPage5" style="height:390" style="overflow:hidden">
							<h2 class="tab" >虚拟团队</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("OGR_SELECT_tabPage5" ) );</script>
						       <div  id="OGR_Tree" style="height:350" style="overflow:auto">
						       <script language="javascript" type="text/javascript">
						         
						        </script>
						       </div>
						      
						     
						</div>
						<%}%>
						<%if(post){%>
						<div class="tab-page" id="OGR_SELECT_tabPage6" style="height:390" style="overflow:hidden">
							<h2 class="tab" ><span onclick="changeHandleType('orgTree')">岗位</span></h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("OGR_SELECT_tabPage6" ) );</script>
						       <div  id="OGR_Tree" style="height:350" style="overflow:auto">
						       <script language="javascript" type="text/javascript">
						         
						        </script>
						       </div>
						    
						     
						</div>
						<%}%>
						
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

