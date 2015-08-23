<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@ page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.view.urss.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.urss.model.Post"%>
<%@ page import="java.util.*"%>

<script type="text/javascript">
function doChangeMain(postId,postName)
{
   document.getElementById("postId").value=postId;
   document.getElementById("postName").value=postName;
}
function selectThisPost()
{
    var postSelectTbody=parent.selectedFrame.document.getElementById("postSelectTbody");
    var valueObj=event.srcElement.parentElement.children[0].children[0];
    if(!parent.selectHandleFrame.isExistSelected(valueObj.value))
        parent.selectHandleFrame.createPostRow(valueObj,postSelectTbody);
}
</script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/public.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<html>
    <head>
        <title>可供选择人员</title>
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
                    <div class="tab-pane" id="POST_SELECT_tabPane1" style="height:390">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("POST_SELECT_tabPane1"));</script>
                        <div class="tab-page" id="POST_SELECT_tabPage2" style="height:390" style="overflow:hidden">
                            <h2 class="tab" >选择岗位</h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("POST_SELECT_tabPage2" ) );</script>
                             <table width="100%" <%=tableStyle%> align="center" >
                                  <tbody id="orgSelectTbody">
                                  <tr>
                                      <td width='15%' align='center' nowrap class="ListTableHeader"><input type='CheckBox' id='selectedRowAll' name='selectedRowAll' onclick="selectAllGrid(this,'postItem')"></td>
                                      <td width='85%'style='cursor:hand'  align='center'  nowrap class="ListTableHeader"><b>岗位名称</b></td>
                                  </tr>
                                  <%
                                 IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
                                 List postList=urssServiceFacade.getPostByComId(WebHelper.getCurrComId(session));
                                 if(postList!=null&&postList.size()>0)
                                 {
                                    for(int i=0;i<postList.size();i++)
                                    {
                                       Post post=(Post)postList.get(i);
                                       %>
                                        <tr>
                                            <td width='15%' align='center' nowrap ><input type='CheckBox'  name='postItem' value="<%=post.getPostId()%>" postId="<%=post.getPostId()%>" postName="<%=post.getPostName()%>"></td>
                                            <td width='85%'style='cursor:hand'  align='center'  nowrap ondblclick="selectThisPost()"><%=post.getPostName()%></td>
                                        </tr>
                                       <%
                                    } 
                                    }
                                %>
                                  
                                  </tbody>
                             </table> 
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>

