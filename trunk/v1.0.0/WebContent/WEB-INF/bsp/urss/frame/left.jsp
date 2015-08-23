<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.youthor.bsp.core.urss.model.ComUser"%>
<%@page import="com.youthor.bsp.core.urss.common.model.MrgRightMenu"%>
<%@page import="com.youthor.bsp.core.abdf.common.Constants"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());

%>

<HTML>
<HEAD>
<%@include file="/bsp/abdf/common.jsp"%>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<script>
      
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

function doChangeMain(url,type){
   if(url!='')
   {
       if(type=='WFSS')
       {
          parent.main.location.href=url; 
       }
       else
       {
           parent.main.location.href="<%=baseURL%>"+url;  
       } 
    }     
  }

function doNothing()
{
  return;
}


    </script>
   
</HEAD>
<!--  ondragstart=self.event.returnValue=false onselectstart=self.event.returnValue=false oncontextmenu=self.event.returnValue=false-->
<body class="right_body_left" >

 <SPAN class="right_middle_left" id="cccc">
	<script>
          var t0 = new WebFXTree('系统管理','javascript:doChangeMain()')
<%         
 ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
String userType=StringHelper.doWithNull(comUser.getUserType());
List rightMenu=new ArrayList();
if(userType.equals("-1"))
{
    rightMenu=(List)application.getAttribute(Constants.GLOBAL_POWER_SUPER);
}
else if(userType.equals("0"))
{
  rightMenu=(List)application.getAttribute(Constants.GLOBAL_POWER_COM);
}
else if(userType.equals("1"))
{
  rightMenu=(List)application.getAttribute(Constants.GLOBAL_POWER_APP);
}
for(int i=0;i<rightMenu.size();i++)
{
 MrgRightMenu mrgRight=(MrgRightMenu)rightMenu.get(i);
 if(mrgRight.getShow().equals("Y"))
 {
      String url=mrgRight.getUrl();
         if(mrgRight.getType()!=null&&mrgRight.getType().equals("WFSS"))
         {
            url=ConfigInfoHelper.getProperty("WFSS_ADDRESS")+url;
         }
%>
var t<%=i+1%> = new WebFXTreeItem('<%=mrgRight.getName()%>','javascript:doChangeMain(\'<%=url%>\',\'<%=mrgRight.getType()%>\')',t0,'<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png','<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png')
  
<%  
    List listSub=mrgRight.getSubMeu();
    if(listSub!=null&&listSub.size()>0)
    {
       for(int j=0;j<listSub.size();j++)
       {
         MrgRightMenu mrgRightSub=(MrgRightMenu)listSub.get(j);
          url=mrgRightSub.getUrl();
         if(mrgRightSub.getType()!=null&&mrgRightSub.getType().equals("WFSS"))
         {
            url=ConfigInfoHelper.getProperty("WFSS_ADDRESS")+url;
         }
         if(url==null) url="";
          %>
          var t<%=i+1+j+1%> = new WebFXTreeItem('<%=mrgRightSub.getName()%>','javascript:doChangeMain(\'<%=url%>\',\'<%=mrgRightSub.getType()%>\')',t<%=i+1%>,'<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png','<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png')
          <%
       }
  
   }
 %>
    
    <%
   }
}
%>
        document.write(t0)
        t0.expandAll();
  </script>
       
  </script>
	 
	</span>
<script language=javascript>
	document.getElementById("cccc").style.height=document.body.clientHeight-21;
	window.onresize = onresizeBB;
	function onresizeBB() {
	 document.getElementById("cccc").style.height=document.body.clientHeight-21;
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
 <td align=center>在线人数:</td>
</tr>
</table>
</BODY>
</HTML>

