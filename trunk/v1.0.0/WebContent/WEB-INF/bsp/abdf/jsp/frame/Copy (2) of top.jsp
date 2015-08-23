<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.urss.model.Function"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>

<%String baseURL=request.getContextPath();%>
<html >
<head>
<script>
  function ev_main(){
	top.left.location.href="<%=baseURL%>/showBaseStationImg.do";
	if(parent.document.getElementById("mainFrame").cols=='0,10,*')
	{
		 top.leftIcon.resizeLeft();
	}
	var liObjs=document.getElementsByTagName("LI");
		for(var i=0;i<liObjs.length;i++)
		{
		    liObjs[i].className="";
		}
		event.srcElement.parentElement.className="current";
		 top.main.location.href="<%=baseURL%>/bsp/abdf/jsp/frame/workDesk.jsp";
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
</script>
</HEAD>
<BODY style="margin:0 ">
<DIV align=center>
<DIV style="WIDTH:100%"><!-- top begin -->
<DIV>

<LINK media=all href="<%=baseURL%>/bsp/abdf/skins/default/css/fe_bpaf_main.css"  type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/mian.css" >

	<DIV >
		<DIV class=easyjfTopMenu>
			<DIV align=left>
				<UL>
					  <LI class="current"><A href="#" onclick="ev_main()">首页</A> </LI>
					  <%List haveMenuList=(List)request.getAttribute("haveMenuList");
				        if(haveMenuList!=null&&haveMenuList.size()>0)
				        {
				           int j=0;
				          for(int i=0;i<haveMenuList.size();i++)
				          {
				           Function function=(Function)haveMenuList.get(i);
				           if(function.getParentId()!=null&&!function.getParentId().equals("")) continue;
				           j=j+1;
        %>
           	  <LI><A href="#" funId="<%=function.getFunModuleId()%>" linkSrc="<%=StringHelper.doWithNull(function.getImplUrl())%>" autoHidden="<%=StringHelper.doWithNull(function.getFoldArea())%>" onclick="ev_changeMenu(this)"><%=function.getFunModuleName()%></A> </LI>
        <%}}%>
					  <LI><A href="#">在线帮助</A> </LI>
					   
				</UL>
			</DIV>
			<DIV class=box style="MARGIN-BOTTOM: 10px">
			   <table width="100%">
			      <tr>
			      <td width="150"> <STRONG><A href="#">当前用户:<%=WebHelper.getOrgName(session)%></a></STRONG></td>
			     
			      <td><MARQUEE>公告： <STRONG>这是公告内容</STRONG></MARQUEE></td>
			      </tr></table>
			   
			</DIV>
		</DIV>
	</DIV>

</DIV>
</DIV>
</DIV>
</BODY></HTML>
