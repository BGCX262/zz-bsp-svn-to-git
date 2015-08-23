<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    <html>
    <script>
      function test()
      {
        alert("测试扩展验证");
        return false;
      }
    </script>
    <fe:body formId="dictTypeEdit" moduleName="abdf">
    <fe:topTable>
       <fe:powerTool funCode="abdf_dict" groupName="edit"/>
      </fe:topTable>
    <fe:span>
    
    <html:form action="/saveDictType_abdf.do"   styleId="dictTypeEdit" method="post">
    <br />
        <center>
            <font size=4><b>数据字典管理</font>
        </center>
        <br />
    <table border="0" width="80%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="tabPane1">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
                        <div class="tab-page" id="tabPage2">
                            <h2 class="tab">
                                基本属性
                            </h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
                            <table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
                            
                            <tr class="ListTableRow">
                                <td width="16%" ><span id="dictTypeCode_span"> 字典类型代码：</sapn></td>
                                <td width="29%">
                                        <html:hidden name="DictTypeForm" property="dictTypeId" styleId="dictTypeId" />
                                        
                                        <input type="hidden" name="dictTypeCodeOri" value="<bean:write name="DictTypeForm" property="dictTypeCode"/>" id="dictTypeCodeOri">
                                        <html:text name="DictTypeForm" styleClass="formStyleall"  property="dictTypeCode" styleId="dictTypeCode"  size="30" />
                                </td>
                                <td width="20%"><span id="dictTypeName_span">字典类型名称：</sapn></td>
                                <td width="35%">
                                   <input type="hidden" name="dictTypeNameOri" value="<bean:write name="DictTypeForm" property="dictTypeName"/>" id="dictTypeNameOri">
                                  <html:text name="DictTypeForm" styleClass="formStyleall"  property="dictTypeName"  styleId="dictTypeName" size="30"  />
                                </td>
                              </tr>
                            <tr class="ListTableRow">
                                <td width="16%" ><span id="moduleName_span">所属模块：</span></td>
                                <td width="29%" colspan="3">
                                     <logic:notEmpty  name="DictTypeForm" property="dictTypeId">
                                      <input type="hidden" name="moduleNameOri" value="<bean:write name="DictTypeForm" property="moduleName"/>" id="moduleNameOri">
                                     </logic:notEmpty>
                                     
                                     <html:text name="DictTypeForm" styleClass="formStyleall"  property="moduleName" styleId="moduleName"  size="30" />
                                </td>
                                
                              </tr>
                        </table>
     </div>
        
                         </div>
                 </td>
            </tr>
        </table>
    </html:form>
  <script>
 <%String treeRefresh=(String)request.getAttribute("treeRefresh");
   if(treeRefresh!=null&&treeRefresh.equals("true"))
   {
     %>
       parent.left.location.reload();
     <%
   }
%>    
function backListDictType()
{
   var moduleNameOriObj=document.getElementById("moduleNameOri");
    location.href="<%=baseURL%>/getAllDictType_abdf.do";
    return;
   //if(moduleNameOriObj==null)
  // {
   //   location.href="<%=baseURL%>/getAllDictType_abdf.do";
  //    return;
  // }
  // var moduleNameOriValue=moduleNameOriObj.value;
 //  if(moduleNameOriValue=='')
 //  {
 //    location.href="<%=baseURL%>/getAllDictType_abdf.do";
 //  }
 //  else
 //  {
 //     location.href="<%=baseURL%>/getDictTypeBymoduleName_abdf.do?moduleName="+moduleNameOriValue;
 //  }
}
  </script> 
  </fe:span>
    <fe:bottomTable>
        <strong><logic:notEmpty name="DictTypeForm" property="dictTypeId">修改数据字典</logic:notEmpty> 
        <logic:empty name="DictTypeForm" property="dictTypeId">新增数据字典</logic:empty> </strong>
    </fe:bottomTable>
    
</fe:body>
</html>

