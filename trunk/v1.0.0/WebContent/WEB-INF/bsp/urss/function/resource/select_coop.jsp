<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
    <head>
    <title>选择协作区</title>
      <%@include file="/bsp/abdf/common.jsp"%>

<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/toolbar/toolbar.js"></script>
<link rel="StyleSheet" type="text/css"href="<%=baseURL%>/bsp/abdf/skins/default/css/toolbar/toolbar.css">
    </head>
    
    <body leftmargin="0" topmargin="0" marginwidth="0" style="overflow:hidden">
    <table width="100%" height="100%" cellpadding=0 border=0>
            <tr><td width="100%" height="3%" valign="top">
                <table cellpadding=0 cellspacing=0 width="100%" border="0" bgcolor="#eceae6" class="toolBar1">
                    <tr><td background="<%=baseURL%>/images/indexnew_03.gif">
                        <table id="toolBar" border="0">
                            <tr><td class="coolButton" align="left" width="3" background="<%=baseURL%>/images/indexnew_03.gif">
                                    <img src="<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/toolbar.gif">
                                </td>
                                <td class="coolButton" background="<%=baseURL%>/images/indexnew_03.gif" onaction="clearOk()" >清除</td>
                                <td class="coolButton" background="<%=baseURL%>/images/indexnew_03.gif" onaction="submitOk()" >确定</td>
                                <td class="coolButton" background="<%=baseURL%>/images/indexnew_03.gif" onaction="closeOk()">关闭</td>
                            </tr>
                        </table>
                    </td></tr>
                </table>
            </td>
        </tr>
        <tr width="100%" height="97%">
            <td>
                <iframe src="<%=baseURL%>/forwardResCoopAreaTree_urss.do" width="100%" height="100%" name="mapFrame" id="mapFrame"></iframe>
            </td> 
        </tr>
    </table>
    </body>
    <script language="javascript">
       var cells = document.getElementById("toolBar").rows[0].cells;
           for (var i = 1; i < cells.length; i++){
          createButton(cells[i]);
       }
       function clearOk(){
               mapFrame.clearOk();
       }
       function submitOk()
       {
          var itemObjsId=mapFrame.document.getElementById("selectCoopId");
          var itemObjsName=mapFrame.document.getElementById("selectCoopName");
        
          
          //if(itemObjsId.value=='')
          //{
          //  alert("请选择一个协作区");
          //  return;
          //}
             returnValue=itemObjsId.value+"#"+itemObjsName.value;
             window.close();

       }
       function closeOk()
       {
          window.close();
       }
    </script>
</HTML>
