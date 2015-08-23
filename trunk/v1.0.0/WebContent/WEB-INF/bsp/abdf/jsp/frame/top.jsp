<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.model.Information" %>
<%@page import="com.youthor.bsp.core.urss.model.User" %>
<%@page import="com.youthor.bsp.core.urss.model.Org" %>
<%@page import="com.youthor.bsp.core.abdf.common.Constants" %>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<script>
  function ev_main(url){
	
	
	var liObjs=document.getElementsByTagName("LI");
		for(var i=0;i<liObjs.length;i++)
		{
		    liObjs[i].className="";
		}
		event.srcElement.parentElement.className="current";
		 top.main.location.href="<%=baseURL%>/"+url;
	}
	function ev_changeMenu(obj){
		var sub_menu = document.getElementById("sub-menu");
		//sub_menu.innerHTML = obj.innerHTML;
		//协同区配置的链接url
		var linkSrc = obj.getAttribute("linkSrc");
        var funId = obj.getAttribute("funId");
        var autoHidden = obj.getAttribute("autoHidden");
		if(linkSrc!=""){
		    if(autoHidden=='Y')
		    {
				if(parent.document.getElementById("mainFrame").cols=='0,10,*')
				{
				   top.leftIcon.resizeLeft();
				}
			}
			top.main.lcation.href=linkSrc
		}
		top.left.location.href="<%=baseURL%>/leftMenu_abdf.do?funId="+funId;
		var liObjs=document.getElementsByTagName("LI");
		for(var i=0;i<liObjs.length;i++)
		{
		    liObjs[i].className="";
		}
		obj.parentElement.className="current";
	}
	
	function openHelpWindow(){
	window.open("<%=baseURL%>/forwardOnlineHelperFrame_abdf.do", "newwindow", "height=700, width=600, toolbar= no, menubar=no, scrollbars=auto, resizable=no, location=no, status=no,top=100,left=300")
	
	}
	Menu.prototype.cssFile = '<%=baseURL%>/bsp/abdf/skins/default/css/popmenu/officexp.css';
    var eMenuFavorite = new Menu();
     eMenuFavorite.add(new MenuItem('整理收藏夹...', "javascript:view('','所有业务')", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
    function showContextMenuShowFavorite() {
    	var el = window.event.srcElement;
    	var left = window.event.screenX;
    	var top = window.event.screenY;
    	eMenuFavorite.show(left,top);
}
function viewFavorite(url) {
  top.main.location.href=url;
}

 <% 

 Org org = (Org)session.getAttribute(Constants.GLOBAL_ORG);
 List list = (List)session.getAttribute("USER_ORG");
	 if(list!=null && list.size()>1) { 
		 %>
		  var eMenuUserOrg = new Menu();
     function showContextMenuShowUserOrg() {
    	var el = window.event.srcElement;
    	var left = window.event.screenX;
    	var top = window.event.screenY;
    	eMenuUserOrg.show(left,top);
    }
    function forwardUserOrg(orgId) {
       top.location.href = baseURL+"/selectUserOrg_abdf.do?orgId="+orgId;
    } 
		 <%
		 for(int i=0;i<list.size();i++) {
		    	Org orgTemp = (Org)list.get(i);
		    	if (!(org.getOrgId().equals(orgTemp.getOrgId()))) {
		    		%>
		    		 eMenuUserOrg.add(new MenuItem('<%=orgTemp.getAllParentName()%>', "javascript:forwardUserOrg('<%=orgTemp.getOrgId()%>')", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
		    		<%
		    	}
		     }
     }%>

</script>
</HEAD>
<BODY style="margin:0;background-color: #F0EEEE ">
<iframe style="display:none" src="<%=baseURL%>/showFavorite_abdf.do" id="showFavorite" name="showFavorite"></iframe>
<DIV align=center>
<DIV style="WIDTH:100%"><!-- top begin -->
<DIV>

<LINK media=all href="<%=baseURL%>/bsp/abdf/skins/default/css/fe_bpaf_main.css"  type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/mian.css" >

	<DIV >
		<DIV class=easyjfTopMenu>
			<DIV align=left>
				<UL>
					  <LI class="current"><A href="#" onclick="ev_main('/forwardWorkDesk_abdf.do')">首页</A> </LI>
					   <LI><A href="#" onclick="ev_main('listWorkItemDoing_wfss.do')" >我的待办</A> </LI>
					   <LI><A href="#" onclick="ev_main('listWorkItemDoen_wfss.do')">我的已办</A> </LI>
					   <LI><A href="#" onclick="ev_main('listProcessInstByOrgId_wfss.do')">我的发起</A> </LI>
					   <LI><A href="#" onclick="ev_main('enterUserMessage_abdf.do')">我的信息</A> </LI>
					   <LI><A href="#">我的评估</A> </LI>
					    <LI><A href="#" onclick=" showContextMenuShowFavorite()" >收藏夹</A> </LI>
					   <!--<LI><A href="#" onclick="ev_main('/forwardPwdEdit_urss.do')" >修改密码</A> </LI>-->
					   <LI><A href="#" onclick="ev_main('showBaseStationImg.do')" >基站地图</A> </LI>
					   <% 
					      if(list!=null && list.size()>1) {
					   %>
					   <LI><A href="#" onclick="showContextMenuShowUserOrg()" >切换到...</A> </LI>
					   <%} %>
					   <LI><A href="<%=baseURL%>/forwardViewOnlineHelperFrame_abdf.do" target="_blank">在级帮助</A> </LI>
					  <LI><A href="<%=baseURL%>/userLogOut_abdf.do" target="_top">退出</A> </LI>
					   
				</UL>
			</DIV>
			<DIV class=box style="MARGIN-BOTTOM: 10px">
			   <table width="100%">
			      <tr>
			      <td width="150"> <STRONG><A href="#" title="<%=org.getAllParentName()%>">当前用户:<%=WebHelper.getOrgName(session)%></a></STRONG></td>
			     
			      <td onmousemove="document.all('notice_maquee').stop();" onmouseout="document.all('notice_maquee').start();"><MARQUEE id="notice_maquee">公告:<font color="#FFFFFF">
			      	<%
			      	List infoList = WebHelper.getAllValidateInformation();
			      	if(infoList != null && infoList.size() > 0){
			      		int len = infoList.size();
			      		for(int i =0; i < len; i++){
			      			Information info = (Information)infoList.get(i);
			      			
			      			String url = info.getUrl();
			      			String target = "";
			      			if(url == null || "".equals(url)){
			      				url = "href=\"" + baseURL + "/viewInformation_abdf.do?infoId=" + info.getInfoId() +"\"";
			      				target = "target=\"_blank\"";
			      			}
			      			else{
			      				String urlUpper = url.toLowerCase();
			      				if(urlUpper.startsWith("www.")){
			      					urlUpper = "http://" + urlUpper;
			      				}
			      				if(urlUpper.startsWith("http://")){
			      					url = "href=\"" + urlUpper +"\"";
			      					target = "target=\"_blank\"";
			      				}
			      				else{
			      					url = "href='#'";
			      					target = "onclick=\"ev_main('" + urlUpper + "')\"";
			      				}
			      			}
			      	%>
			      
			      &nbsp;&nbsp; <STRONG><a <%=url %> <%=target %>><%=info.getInfoTitle() %></a></STRONG>
			      <%
			      			}
			      	}
			      	else{
			      %>
			      &nbsp;&nbsp; <STRONG>当前没有公告</STRONG>
			      <%	
			      	}
			      %>
			      </font></MARQUEE></td></tr></table>
			   
			</DIV>
		</DIV>
	</DIV>

</DIV>
</DIV>
</DIV>
</BODY></HTML>
