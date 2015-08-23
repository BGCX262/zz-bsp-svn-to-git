<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.urss.model.*"%>
<html>
   <%
  String baseURL = request.getContextPath();      
%>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    
    
    <style type="text/css">
<!--
BODY{
    
    margin:0 0 0 0 ;
    font-family: "Arial";
    font-size:12px ; 
    SCROLLBAR-FACE-COLOR: #f6f6f6; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #cccccc; SCROLLBAR-3DLIGHT-COLOR: #cccccc; SCROLLBAR-ARROW-COLOR: #330000; SCROLLBAR-TRACK-COLOR: #f6f6f6; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; 
}

td{
    
    font-family: "Arial";
    font-size:12px ; 
}
a{color:#000; text-decoration:none;}
a:hover{color:#ff6600; text-decoration:underline;}
-->
</style>
<script type="text/javascript"src="<%=baseURL%>/bsp/abdf/js/tab/tabpane.js"></script>
 
<title></title>
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/tab/tab_coop.css" />
<SCRIPT>
function changeMain(url,fold)
{
   top.main.location.href="<%=baseURL%>"+url;
   if(fold=='Y')
   {
      top.leftIcon.resizeLeft();
   }
}
</SCRIPT>
</head>

<!-- ondragstart=self.event.returnValue=false onselectstart=self.event.returnValue=false oncontextmenu=self.event.returnValue=false-->
<body >
          <table  border="0" width="100%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="tabPane" height="470">
                    <script type="text/javascript">
                    tp1 = new WebFXTabPane( document.getElementById( "tabPane" ) );
                    </script>
                       <%List haveCoopMenu=(List)request.getAttribute("haveCoopMenu");
                       for(int i=0;i<haveCoopMenu.size();i++)
                       {
                          CoopArea coopArea=(CoopArea)haveCoopMenu.get(i);
                       %>
                        <div class="tab-page" id="tabPage<%=i+1%>" style="height:470" style="overflow:auto">
                            <h2 class="tab" ><%=coopArea.getCoopAreaName()%></h2>
                            <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage<%=i+1%>" ) );</script>
                        
                              <table border="0"    cellspacing="0" cellpadding="0" >
                                <tr valign="top">
                                        <td  >
                                            <%
                                            if(coopArea.getIsDynamic()!=null&&coopArea.getIsDynamic().equals("N"))
                                            {
                                            List resourceList=coopArea.getResourceList();
                                            for(int j=0;j<resourceList.size();j++)
                                            {
                                              Resource resource=(Resource)resourceList.get(j);
                                              String flod="Y";
                                              if(resource.getFoldArea()!=null)
                                                 flod=resource.getFoldArea();
                                              App app=resource.getApp();
                                              String url=resource.getImplUrl();
                                              
                                            %>
                                            <img src="<%=baseURL%><%=coopArea.getCoopAreaImg()%>"  border="0">&nbsp;&nbsp;
                                            <a href="#" onclick="changeMain('<%=url%>','<%=flod%>')"><%=resource.getCoopItemName()%></a><br>
                                            <%
                                              }
                                            }else{%>
                                            <!-- 动态数据-->
                                            <%}%>
                                        </td>
                                </tr>
                           </table>
                           </div>
                          <%}%> 
                          
    
                </div>
            </td>
           </tr>
          </table>



<body>

    
</html>