<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.facade.IPortalUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.Org"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.Constants"%>



<HTML>
<HEAD>
<%@include file="/bsp/abdf/common.jsp"%>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<script>
      function openWorkItemDoing()
      {
         top.main.location.href="<%=baseURL%>/listWorkItemDoing_wfss.do"
      }
       function openWorkItemDoen()
      {
         top.main.location.href="<%=baseURL%>/listWorkItemDoen_wfss.do"
      }
     
	 Menu.prototype.cssFile = "<%=baseURL%>/bsp/abdf/skins/default/css/popmenu/officexp.css";
  	var eMenu = new Menu();
    eMenu.add(new MenuItem('修改密码', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
    eMenu.add(new MenuItem('常用意见', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
   eMenu.add(new MenuItem('常用联系人', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
   eMenu.add(new MenuItem('通讯录', "", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );


function showContextMenuShowBuzi() {
    	var el = window.event.srcElement;
    	var left = window.event.screenX;
    	var top = window.event.screenY;
    	eMenu.show(left,top);
  	}

var webFXTreeConfig = {
	rootIcon        : '<%=baseURL%>/bsp/abdf/skins/images/function/42.jpg',
	openRootIcon    : '<%=baseURL%>/bsp/abdf/skins/images/function/42.jpg',
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

function doChangeMain(url,fold){
    if(url!="")
    {
           top.main.location.href="<%=baseURL%>"+url;
		   //if(fold=='Y')
		  // {
		    //  top.leftIcon.resizeLeft();
		  // }
    }
        
  }

function doNothing()
{
  
}

    </script>
    <%!
  private void buildMenuTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
         //根据模块名来行分类
         String funId=(String)request.getAttribute("funId");
         //if(funId==null) funId="ff8080811759435c011759487a470001";
          Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
          String orgId=org.getOrgId();
	    App app=WebHelper.getApp();
	    String appId=app.getAppId();
	    boolean appStates=WebHelper.projectIsOnLine(session);
	    List haveMenuList=null;
	    if(appStates)
	    	haveMenuList=(List)session.getAttribute(appId+"_"+orgId+"_"+Constants.Menu);
    	if(haveMenuList==null)
    	{
    	    IPortalUrssServiceFacade portalUrssServiceFacade=(IPortalUrssServiceFacade)SpringHelper.getBean("portalUrssServiceFacade");
    		haveMenuList=portalUrssServiceFacade.getUserMenuByAppIdOrgId(appId,org.getOrgId());
    		session.setAttribute(appId+"_"+orgId+"_"+Constants.Menu,haveMenuList);
    	}
    	
           
             if(haveMenuList!=null&&haveMenuList.size()>0)
             {
                //找根
                Function function=null;
                if(funId!=null&&!funId.equals(""))
                {
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
	             else
	             {
	               out.println("var t0 = new WebFXTree('您的权限菜单','')");
	               out.println("var t1 = new WebFXTreeItem('协同功能','javascript:doChangeMain(\\'/userCoopArea_abdf.do\\',\\'\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
	               
	                 for(int i=0;i<haveMenuList.size();i++)
	                {
	                    function=(Function)haveMenuList.get(i);
	                   
	                   if(function.getParentId()==null||function.getParentId().equals(""))
	                   {
	                    String url=function.getImplUrl();
	                     if(url==null) url="";
	                    String fold=function.getFoldArea();
	                       if(fold==null) fold="Y";
	                       String samllImg1 = function.getSmallImg();
	                       if(samllImg1==null || samllImg1.equals("")) {
	                    	   samllImg1 = "/bsp/abdf/skins/default/img/xloadtree/openfolder.png";	   
	                       }
	                      out.println("var t"+function.getFunModuleId()+" = new WebFXTreeItem('"+function.getFunModuleName()+"','javascript:doChangeMain(\\'"+url+"\\',\\'"+fold+"\\')',t0,'"+baseURL+samllImg1+"','"+baseURL+samllImg1+"')");
	                       for(int n=0;n<haveMenuList.size();n++)
	                {
	                   Function functionSub=(Function)haveMenuList.get(n);
	                   if(functionSub.getParentId()!=null&&functionSub.getParentId().equals(function.getFunModuleId()))
	                   {
	                         url=functionSub.getImplUrl();
	                        if(url==null) url="";
	                        fold=functionSub.getFoldArea();
	                       if(fold==null) fold="Y";
	                       String samllImg = functionSub.getSmallImg();
	                       if(samllImg==null || samllImg.equals("")) {
	                    	   samllImg = "/bsp/abdf/skins/default/img/xloadtree/openfolder.png";	   
	                       }
	                       out.println("var t"+functionSub.getFunModuleId()+" = new WebFXTreeItem('"+functionSub.getFunModuleName()+"','javascript:doChangeMain(\\'"+url+"\\',\\'"+fold+"\\')',t"+functionSub.getParentId()+",'"+baseURL+samllImg+"','"+baseURL+samllImg+"')");
	                       buildSubMenuTree(functionSub,haveMenuList,baseURL,out);
	                   }
	                }
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
                       String samllImg = subfunction.getSmallImg();
                       if(samllImg==null || samllImg.equals("")) {
                    	   samllImg = "/bsp/abdf/skins/default/img/xloadtree/openfolder.png";	   
                       }
                       
                       out.println("var t"+subfunction.getFunModuleId()+" = new WebFXTreeItem('"+subfunction.getFunModuleName()+"','javascript:doChangeMain(\\'"+url+"\\',\\'"+fold+"\\')',t"+function.getFunModuleId()+",'"+baseURL+samllImg+"','"+baseURL+samllImg+"')");
                       buildSubMenuTree(subfunction,haveMenuList,baseURL,out);
                   }
                }
             }
 }
%>

</HEAD>
<!--  ondragstart=self.event.returnValue=false onselectstart=self.event.returnValue=false oncontextmenu=self.event.returnValue=false-->
<body class="right_body_left" >
 <SPAN class="right_middle_left" id="cccc">
	<script>
<%   buildMenuTreeSrc(out,request,session);%>
        try
        {
        document.write(t0)
        //t0.expandAll();
        }
        catch(e)
        {
        }
       
  </script>
	 
	</span>
<script language=javascript>
	document.getElementById("cccc").style.height=document.body.clientHeight-20;
	window.onresize = onresizeBB;
	function onresizeBB() {
	 document.getElementById("cccc").style.height=document.body.clientHeight-20;
	}
	document.body.height=document.body.clientHeight-4;
	oldresize = window.onresize;
	window.onresize = function() {
	  document.body.height=document.body.clientHeight-4;
	  if (oldresize) oldresize();
	  }
</script>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="right_bottom_left">
<tr>
 <td align=center height="60px">在线人数:6</td>
</tr>
</table>
</BODY>
</HTML>

