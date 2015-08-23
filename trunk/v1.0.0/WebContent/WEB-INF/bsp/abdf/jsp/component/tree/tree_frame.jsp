<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.youthor.bsp.core.facade.IAbdfServiceFacade"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.abdf.model.DictTreeType"%>
<%@ page import="com.youthor.bsp.core.abdf.common.AbdfCache"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>
</head>
<% String baseURL = request.getContextPath();
   String treeType=request.getParameter("treeType");
   DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
   if(dictTreeType==null)
	{
	    IAbdfServiceFacade abdfServiceFacade=(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
	    dictTreeType=abdfServiceFacade.getDictTreeTypeByCode(treeType);
	    AbdfCache.mapTreeDictType.put(treeType,dictTreeType);
	}
%>
<frameset cols="*,220"  frameborder="0" border="0" framespacing="0">
    <frame src="<%=baseURL%>/listTopNodeObjectByType_abdf.do?treeType=<%=treeType%>" scrolling="no"  name="main">
  <%if(dictTreeType.getTreeStyle().equals("sync")){%>
  <frame src="<%=baseURL%>/forwardSyncTree_abdf.do?treeType=<%=treeType%>" scrolling="auto"   name="left">
  <%}else{%>
    <frame src="<%=baseURL%>/" scrolling="auto"    name="left">
    <%}%>
</frameset>
<noframes><body>
</body></noframes>
</html>
