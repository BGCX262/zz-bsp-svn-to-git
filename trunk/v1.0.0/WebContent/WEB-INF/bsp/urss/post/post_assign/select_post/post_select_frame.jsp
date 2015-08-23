<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.youthor.bsp.view.urss.dict.OrgTypeDict"%>
<%@ page import="com.youthor.bsp.view.abdf.common.criterion.IDictDynamic"%>
<%@ page import="com.youthor.bsp.core.abdf.model.Item"%>

<%
String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT type="text/javascript" language="javascript">
  function affirmClose()
        {
           returnValue="";
          var postSelectTbody=selectedFrame.document.getElementById("postSelectTbody");
           var objTableLength=postSelectTbody.rows.length;
          if(objTableLength==1) 
           {
               
           }
           else
           {
               for(var i=1;i<objTableLength;i++)
               {
                 var postItemObject=postSelectTbody.rows[i].children[0].children[0];
                 returnValue=returnValue+postItemObject.getAttribute("postId")+"#"+i+",";
                
               }
          }
          if(returnValue!='')
             returnValue=returnValue.substring(0,returnValue.length-1);
            window.close();
        }
</SCRIPT>
<title>岗位选择</title>
</head>
<frameset rows="*,40" frameborder="no" border="0" framespacing="0">
  <frameset cols="*,75,*" frameborder="no" border="0" framespacing="0">
      <frame src="<%=path%>/forwardOfferPostSelect_urss.do" name="offerSelectFrame" scrolling="NO" noresize>
      <frame src="<%=path%>/forwardPostSelectHandle_urss.do" name="selectHandleFrame" scrolling="NO" noresize>
      <frame src="<%=path%>/forwardPostSelectPost_urss.do" name="selectedFrame" scrolling="NO" noresize id="selectedFrame">
   </frameset>
  <frame src="<%=path%>/forwardPostBottomPost_urss.do" name="bottomFrame" scrolling="NO" noresize id="bottomFrame">
</frameset>
<noframes><body>
</body></noframes>
</html>

