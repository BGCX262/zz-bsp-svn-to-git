<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Route"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Participant"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ActivityInstance"%>



<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>输入批量意见</title>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
     
    function affirClose()
    {
       returnValue=false;
       window.close();
    }
    
    var oriWindow=window.dialogArguments;
    function selectRouteOk()
    {
       
        oriWindow.document.getElementById("processOption").value = document.getElementById("opinion").value;
        returnValue=true;
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
                <td colspan="2">
                    <input type='button' name='power_button'  value='确定提交'   class='Button'  onclick="selectRouteOk()">&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='关闭'   class='Button3'  onclick="affirClose()">&nbsp;&nbsp;
                   </td>
            </tr>
            
            <tr>
            
        </tr>
        
        <tr >
            <td   align="center">处理意见</td>
            <td colspan="1">
              <TEXTAREA rows="6" style="width:100%" name="opinion" id="opinion"></TEXTAREA>
             </td>
            
             
        </tr>
        <tr >
            <td   align="center">常用意见</td>
            <td colspan="1">
             <SELECT>
               <OPTION>--请选择--</OPTION>
             </SELECT>
             </td>
        </tr>
    </table>
    
  </body>
</html>
