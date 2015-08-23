<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>地图信息</title>
	</head>
	<fe:body>
		<fe:topTable>
      		基站地图：红色圆圈为基站，点击基站显示详细信息
    	</fe:topTable>
		<fe:span>
		<Br/>
		<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center" width="<bean:write name="baseStationImgWidth"/>" height="<bean:write name="baseStationImgHeight"/>">
			<tr><td align="center">
				<div id="base_station_img">
				<img border="0" src="<%=baseURL%><bean:write name="baseStationImgPath"/>" width="<bean:write name="baseStationImgWidth"/>" height="<bean:write name="baseStationImgHeight"/>" usemap="#m_station_img"/>
				<map name="m_station_img" id="m_station_img">
					<%
						int [] xzhou1 = (int[])request.getSession().getServletContext().getAttribute("baseStationNewImgX");
						int [] yzhou1 = (int[])request.getSession().getServletContext().getAttribute("baseStationNewImgY");
						String imgWidth = (String)request.getSession().getServletContext().getAttribute("baseStationImgWidth");
						String imgHeight = (String)request.getSession().getServletContext().getAttribute("baseStationImgHeight");
						String logoWidth = (String)request.getSession().getServletContext().getAttribute("baseStationLogoWidth");
						String logoHeight = (String)request.getSession().getServletContext().getAttribute("baseStationLogoHeight");
						String[] baseStationId = (String[])request.getSession().getServletContext().getAttribute("baseStationId");
						String[] baseStationName = (String[])request.getSession().getServletContext().getAttribute("baseStationName");
						
						if(xzhou1 != null && yzhou1 != null && imgWidth != null && imgHeight!= null && logoWidth != null && logoHeight!=null){
							int iImgWidth = Integer.parseInt(imgWidth);
							int iImgHeight = Integer.parseInt(imgHeight);
							int iLogoWidth = Integer.parseInt(logoWidth);
							int iLogoHeight = Integer.parseInt(logoHeight);
							int len1 = xzhou1.length;
						
							for(int i=0;i<len1;i++){
								int point1X = iImgWidth * xzhou1[i]/1000  - iLogoWidth/2;
								int point1Y = iImgHeight * (yzhou1[i])/1000  - iLogoHeight/2;
								int point2X = point1X + iLogoWidth;
								int point2Y= point1Y + iLogoHeight;
								
								if(point1X>0 && point1Y>0 && point2X>0 && point2Y>0){
							%>
							<area shape="rect" coords="<%=point1X %>,<%=point1Y %>,<%=point2X %>,<%=point2Y %>" href="#" onclick="javascript:viewDetail(this,'<%=baseURL%>/viewBaseStation.do?id=<%=baseStationId[i] %>',100,280,'基站信息');"  alt="<%=baseStationName[i] %>" style="cursor: hand"/>
					<%
								}
							}
						}
					%>
					<!-- 
					<area shape="rect" coords="405,258,431,284" href="javascript:;" alt="aaaaa" />
					<area shape="rect" coords="205,243,220,262" href="javascript:;" alt="bbbb" />
					<area shape="rect" coords="199,126,217,142" href="javascript:;" alt="ccc" />
					-->
				</map>
				</div>
			</td></tr>
		</TABLE>
		
		<!-- 生成热点 -->
		
		<!-- 用来显示基站信息的页面 -->
		<DIV id="viewContentDiv" class="View_Window">
			<table width="100%"  border="0" cellpadding="0" cellspacing="0">
 				<tr>
    				<td>
					<table width="100%" border="0" background="<%=baseURL%>/bsp/abdf/skins/images/tlist_head.gif" class="content" cellpadding="0" cellspacing="0">
	 					<tr>
						<td id="viewCaption" class="caption" height="20"></td>
						<td class="close" align="right"><img src="<%=baseURL%>/bsp/abdf/skins/images/w_close.gif" onclick="closeView();" style="cursor: hand" alt="关闭"/>&nbsp;&nbsp;</td>
	  					</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
	  				<tr>
						<td><div id="viewContent"/></td>
	  				</tr>
					</table>
					</td>
  				</tr>
			</table>
		</DIV>
		<script>
			closeView();
		</script>
		</fe:span>
		<fe:bottomTable></fe:bottomTable>
  </fe:body>
</html>