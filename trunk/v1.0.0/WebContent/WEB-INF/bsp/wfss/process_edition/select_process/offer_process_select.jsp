<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ProcessEdition"%>

<%!
  private void buildProcessSelectTreeSrc(JspWriter out, HttpServletRequest request) {
    try {
          String baseURL = request.getContextPath();
          List list = (List)request.getAttribute("list");
          out.println("var t0 = new WebFXTree('流程树','javascript:doNothing()')");
             if(list!=null&&list.size()>0)
             {
                for(int i=0;i<list.size();i++)
                {
                   ProcessEdition processEdition=(ProcessEdition)list.get(i);
                   out.println("var t"+processEdition.getId()+" = new WebFXTreeItem('"+processEdition.getName()+"','javascript:doNothing()',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                   List processList = processEdition.getProcesss();
                   if(processList!=null && processList.size()>0) {
                       for(int j=0;j<processList.size();j++) {
                         com.youthor.bsp.core.wfss.model.Process process = (com.youthor.bsp.core.wfss.model.Process)processList.get(j);
                         out.println("var t"+process.getProcessId()+" = new WebFXTreeItem('"+process.getProcessName()+"("+process.getProcessAlias()+")','javascript:doChangeMain(\\'"+process.getProcessId()+"\\',\\'"+process.getProcessName()+"\\')',t"+processEdition.getId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                       }
                   }
                  }
               }
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildProcessSelectTreeSrc.\n" + ex);
    }
  }
%>
<script type="text/javascript">


var baseURL = '<%=baseURL%>';
</script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/style.css" >
<script type="text/javascript">
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
    usePersistence    : false
};
function doChangeMain(processId,processName){
       document.getElementById("processId").value = processId;
       document.getElementById("processName").value = processName;
  }
  
  function doNothing() {
  }
</script>
<html>
    <head>
        <title>可供选择流程</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        -->
</style>

    </head>
    <body>

        <table border="0" width="100%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="PROCESS_SELECT_tabPane1" style="height:390">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("PROCESS_SELECT_tabPane1"));</script>
                        <div class="tab-page" id="PROCESS_SELECT_tabPage2" style="height:390" style="overflow:hidden">
                            <h2 class="tab" ><span onclick="changeHandleType('orgTree')">选择流程</span></h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("PROCESS_SELECT_tabPage2" ) );</script>
                             <input type="hidden" id="handleType" name="handleType" value="orgTree"/>
                               <div  id="PROCESS_Tree" style="height:350" style="overflow:auto">
                               <script language="javascript" type="text/javascript">
                                   <%   buildProcessSelectTreeSrc(out,request);%>
                                  document.write(t0);
                                </script>
                               </div>
                               <input  name="processId" type="hidden"  id="processId" >
                               选择流程：<input size="60" name="processName" class="formStyleall" type="text"  id="processName" readonly="true">
                             
                             
                        </div>
                        
                        
                             
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>

