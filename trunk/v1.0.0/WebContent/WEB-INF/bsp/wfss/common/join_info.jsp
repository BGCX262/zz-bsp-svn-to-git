<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.model.RouteHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Route"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ActivityInstance"%>
<%@ page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>聚合提交信息</title>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
     function affirClose()
    {
       returnValue=false;
       window.close();
    }
    </script>
    </head>
    <body>
   
<table border="0" width="100%" align="center">
    <tr>
        <td>
            
    <table <%=tableStyle%> width="100%">
            <tr class=ListTableRow>
                <td colspan="4">
                    <input type='button' name='power_button'  value='关闭'   class='Button3'  onclick="affirClose()">&nbsp;&nbsp;
                    以下人员没有处理完成,不能提交下一步
                   </td>
            </tr>
            
            <tr>
            <th width="60%" align="center" class="ListTableHeader" nowrap="nowrap">环节名</th>
            <th width="40%" align="center" class="ListTableHeader" nowrap="nowrap"><b>操作人</b></th>
        </tr>
        <%
        List list = (List)request.getAttribute("activityInst");
        if (list!=null && list.size()>0) {
          for(int i=0;i<list.size();i++) {
            ActivityInstance activityInstance = (ActivityInstance)list.get(i);
        %>
        
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
            <td align="center">
             <%=activityInstance.getActivityName()%>
            </td>
            <td >
             <%=activityInstance.getExecutorName()%>
             </td>
        </tr>
        <%}} %>
    </table>
    
  </body>
</html>



