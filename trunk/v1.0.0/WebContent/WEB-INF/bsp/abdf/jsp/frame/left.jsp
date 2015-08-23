<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.urss.model.App"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.core.facade.IPortalUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.Org"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.Constants"%>
<html>

<HEAD>
<%
  String baseURL = request.getContextPath();      
%>
<script language="javascript" type="text/javascript">
  var baseURL='<%=baseURL%>/gd';       
 </script>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">

<script language="JavaScript" src="<%=baseURL%>/gd/js/crossbrowser.js" type="text/javascript"></script>

<script language="JavaScript" src="<%=baseURL%>/gd/js/outlook.js" type="text/javascript"></script>

</HEAD>

<SCRIPT>

  /*

	createOutlookBar(name,x,y,width,height,bgcolor,pagecolor,bgimage)

  */

  var o = new createOutlookBar('Bar',0,0,screenSize.width,screenSize.height,'#ffffff','white','<%=baseURL%>/bsp/abdf/skins/images/frame.gif');

  o.captionheight=20;

  o.captionbgcolor='#F6F6F6';

  o.captioncolor='#000000';		//主按钮字体颜色

  o.bordercolor='#F3F3F3';		

  o.color='#000000';			//明细按钮字体颜色

  o.captionfont='宋体';

  o.captionfontsize='12px';

  o.buttonfont='宋体';

  o.buttonfontsize='12px';

  o.border='2';

  var p
  <%
 
  //根据模块名来行分类
   String funId=(String)request.getAttribute("funId");
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
        
              for(int i=0;i<haveMenuList.size();i++)
             {
                Function function=(Function)haveMenuList.get(i);
                
                if(function.getParentId()==null||function.getParentId().equals(""))
                {
                 String url=function.getImplUrl();
                  if(url==null) url="";
                 String fold=function.getFoldArea();
                    if(fold==null) fold="Y";
                    String samllImg1 = function.getSmallImg();
                    %>
                     p = new createPanel('p<%=i%>','<%=function.getFunModuleName()%>');
                    <%

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
                    
                   %> p.addButton('<%=baseURL+samllImg%>','<%=functionSub.getFunModuleName()%>','parent.frames.right.location.href="<%=baseURL+url%>"');
                     
                   <%
                }
             }
                    %>
                    o.addPanel(p);
                    <%
                }
               
             }
      }
  %>
  
 
o.draw();



function resize_op5() {

  if (bt.op5) {

    o.showPanel(o.aktPanel);

    var s = new createPageSize();

    if ((screenSize.width!=s.width) || (screenSize.height!=s.height)) {

      screenSize=new createPageSize();

      setTimeout("o.resize(0,0,screenSize.width,screenSize.height)",100);

    }

    setTimeout("resize_op5()",100);

  }

}

function myOnResize() {

  if (bt.ie4 || bt.ie5 || bt.ns5) {

    var s=new createPageSize();

    o.resize(0,0,s.width,s.height);

  }

  else

    if (bt.ns4) location.reload();

}

</SCRIPT>

<body onLoad="resize_op5();" onResize="myOnResize();">

<tr><td></td></tr>

</body>

</html>

