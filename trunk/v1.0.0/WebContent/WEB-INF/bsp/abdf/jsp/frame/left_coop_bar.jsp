<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.urss.model.CoopArea"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>
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
  <%List listCoopArea = (List)request.getAttribute("havaCoopMenuByCode");
  if(listCoopArea!=null && listCoopArea.size()>0) {
	   for(int i=0;i<listCoopArea.size();i++) {
		   CoopArea coopArea =(CoopArea)listCoopArea.get(i);
		 
		  %>
          p = new createPanel('p<%=i%>','<%=coopArea.getCoopAreaName()%>');
         <%
         List listRes =  coopArea.getResourceList();
         if (listRes!=null && listRes.size()>0) { 
		    	for (int j=0;j<listRes.size();j++) {
		    		Resource resource = (Resource)listRes.get(j);
		    		//if(resource.getImplUrl()==null || resource.getImplUrl().equals("")) continue;
		    		String url = resource.getImplCoopUrl();
		    		if (url == null || url.trim().equals("")) url = resource.getImplUrl();
		    %>
		     p.addButton('<%=baseURL+resource.getCoopImg()%>','<%=resource.getCoopItemName()%>','parent.frames.right.location.href="<%=baseURL+url%>"');
			<%		
		    	}
		    }
         %>
           o.addPanel(p);
         <%
       
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

