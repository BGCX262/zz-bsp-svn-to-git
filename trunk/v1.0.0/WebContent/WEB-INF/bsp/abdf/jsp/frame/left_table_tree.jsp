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

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
    function openWorkItemDoing(){
       top.main.location.href="<%=baseURL%>/listWorkItemDoing_wfss.do"
    }
    function openWorkItemDoen(){
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

    function doChangeMain(url,fold){
        if(url!=""){
           top.main.location.href="<%=baseURL%>"+url;
        }        
      }

    function doNothing(){
      
    }
</script>

<%!
    private void buildMenuTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
        List topMenuList = new LinkedList();
        Map menuMap = new LinkedHashMap();
        try {
            String baseURL = request.getContextPath();
            //根据模块名来行分类
            String funId = (String) request.getAttribute("funId");
            Org org = (Org) session.getAttribute(Constants.GLOBAL_ORG);
            String orgId = org.getOrgId();
            App app = WebHelper.getApp();
            String appId = app.getAppId();
            boolean appStates = WebHelper.projectIsOnLine(session);
            List haveMenuList = null;
            if (appStates)
                haveMenuList = (List) session.getAttribute(appId + "_" + orgId + "_" + Constants.Menu);
            if (haveMenuList == null) {
                IPortalUrssServiceFacade portalUrssServiceFacade = (IPortalUrssServiceFacade) SpringHelper
                        .getBean("portalUrssServiceFacade");
                haveMenuList = portalUrssServiceFacade.getUserMenuByAppIdOrgId(
                        appId, org.getOrgId());
                session.setAttribute(appId + "_" + orgId + "_" + Constants.Menu,haveMenuList);
            }

            if (haveMenuList != null && haveMenuList.size() > 0) {
                //找根
                Function function = null;
                for (int i = 0; i < haveMenuList.size(); i++) {
                    function = (Function) haveMenuList.get(i);
                        
                    //查找是否为父类，目前支持两级的菜单
                    if (function.getParentId() == null|| function.getParentId().equals("")) {
                        topMenuList.add(function);
                    }
                    else{
                        List subFunctionList = (List)menuMap.get(function.getParentId());
                        if(subFunctionList == null){
                            subFunctionList = new LinkedList();
                            menuMap.put(function.getParentId(),subFunctionList);
                        }
                        subFunctionList.add(function);
                    }
                }
            }
            renderTableMenu(topMenuList,menuMap,out);
        } 
        catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
        }
    }
    private void renderTableMenu(List topMenu,Map menuMap,JspWriter out) throws Exception {
        int topMenuLen = topMenu.size();
        
        //生成脚本
        out.println("<script language='javascript' type='text/javascript'>");
        out.println("function showsubmenu(sid){");
        for(int i = 0; i < topMenuLen; i++){
            out.println("submenu" + (i + 1) +".style.display='none';");
        }
        out.println("eval(\"submenu\" + sid + \".style.display='block'\");");
        out.println("}");
        out.println("</script>");
        
        //生成table tree
        out.println("<table cellspacing='0' cellpadding='3' width='100%' border='0'>");
        for(int i =0; i < topMenuLen; i++){
            Function topFunction = (Function)topMenu.get(i);
            
            out.println("<tr>\n<td align='middle' height='30'>");
            out.println("<table class='tableborder' cellspacing='0'  cellpadding='0' width='100%' border='0'>\n<tr>");
            out.println("<td align='middle' class='left_table_tree_topmenu_td'>");
            out.println("<a class='aa' style='CURSOR: hand' href=\"javascript:showsubmenu('" + (i + 1) +"');\">");
            out.println("<span style='FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #fff'>" + topFunction.getFunModuleName() + "</span></a></td></tr>");
            
            //构建子树
            List subFunctionList = (List)menuMap.get(topFunction.getFunModuleId());
            if(subFunctionList != null && subFunctionList.size() > 0){
                int subLen = subFunctionList.size();
                
                String styleBlock ="none";
                if(i == 0){
                    styleBlock ="block";
                }
                out.println("<tr id='submenu" + (i + 1) +"' style='DISPLAY: " + styleBlock + "'>\n<td>");
                out.println("<table cellspacing='0' cellpadding='0'  width='100%' border='0'>");
                for(int ii = 0; ii < subLen; ii++){
                    Function subFunction = (Function)subFunctionList.get(ii);
                    
                    out.println("<tr>");
                    String bgcolor = "#ffffff";
                    if(ii%2 == 1){
                        bgcolor = "#ffe5e5";
                    }
                    out.println("<td bgcolor='" + bgcolor + "' height='25'>");
                    String url=subFunction.getImplUrl();{
                       if(url==null) url="";
                    }
                    out.println("<a href=\"javascript:doChangeMain('" + url + "','N');\">" + subFunction.getFunModuleName() + "</a>\n</td>\n</tr>");
                }
                out.println("</table>\n</td>\n</tr>");
            }
            
            out.println("</table>\n</td>\n</tr>");
            
            if( (i + 1) != topMenuLen){
                out.println("<tr>\n<td height='5'></td></tr>");
            }
        }
        out.println("</table>");
    }
%>

</HEAD>
<!--  ondragstart=self.event.returnValue=false onselectstart=self.event.returnValue=false oncontextmenu=self.event.returnValue=false-->
<body class="right_body_left">
<SPAN class="right_middle_left" id="cccc">
    <%buildMenuTreeSrc(out, request, session);%>
 </span>
<script language="javascript" type="text/javascript">
    function hidesubmenu(sid){
        eval("submenu" + sid + ".style.display=\"none\";");
    }

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
        <td align="center" height="60px">在线人数:6</td>
    </tr>
</table>
</BODY>
</HTML>

