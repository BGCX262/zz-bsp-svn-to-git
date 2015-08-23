<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>    
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    </head>
    
    <fe:body formId="RegCompanyEdit" moduleName="urss" >
    <fe:topTable>
       <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'RegCompanyEdit',0,'urss')" id='dict_save'>&nbsp;&nbsp;
        <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/queryPageRegCompany_urss.do','self')" id='regCompany_save'>&nbsp;&nbsp;
                 
    </fe:topTable>

  <fe:span>
    <br/><center><font size=4><strong>公司管理</strong></font></center><br/>        
    <html:form action="/saveRegCompany_urss.do"   styleId="RegCompanyEdit" method="post">
    <table border="0" width="80%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="tabPane1">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
                        <div class="tab-page" id="tabPage2">
                            <h2 class="tab">
                                公司基本属性
                            </h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
                            <table cellspacing="0" cellpadding="3" width="96%" class="tform" align=center>

             <tr >
                <td width="16%" ><span id="regComName_span">公司名称：</span></span></td>
                <td width="29%">
                  <html:hidden name="RegCompanyForm" property="regComId" styleId="regComId" />
                  <html:text name="RegCompanyForm" styleClass="formStyleall"  property="regComName" styleId="regComName"  size="30" />
                </td>
                <td width="20%"><span id="regComCode_span">公司编号：</span></td>
                <td width="35%">
                  <html:text name="RegCompanyForm" styleClass="formStyleall"  property="regComCode"  styleId="regComCode" size="30"  />
                </td>
              </tr>
              <tr >
                <td width="16%" ><span id="regComAddress_span">公司地址：</span></td>
                <td width="29%" colspan="3">
                     <html:text name="RegCompanyForm" styleClass="formStyleall"  property="regComAddress" styleId="regComAddress"  size="80" />
                </td>
              </tr>
              
               <tr >
                <td width="16%" ><span id="regComEmail_span">公司email：</span></td>
                <td width="29%">
                  <html:text name="RegCompanyForm" styleClass="formStyleall"  property="regComEmail" styleId="regComEmail"  size="30" />
                </td>
                <td width="20%"><span id="regComBoss_span">公司法人：</span></td>
                <td width="35%">
                  <html:text name="RegCompanyForm" styleClass="formStyleall"  property="regComBoss"  styleId="regComBoss" size="30"  />
                </td>
              </tr>
              
              <tr >
                <td width="16%" ><span id="captil_span">注册资金：</span></td>
                <td width="29%">
                  <html:text name="RegCompanyForm" styleClass="formStyleall"  property="captil" styleId="captil"  size="30" /> 万
                </td>
                <td width="20%"><span id="userType_span">用户类型：</span></td>
                <td width="35%">
                <html:select name="RegCompanyForm"  property="userType"  styleId="userType">
                  <html:option value="">----请选择----</html:option>
                  <html:option value="0">永久用户</html:option>
                  <html:option value="1">注册用户</html:option>
                  <html:option value="2">试用用户</html:option>
                  <html:option value="3">未审批用户</html:option>
                </html:select>
                  
                </td>
              </tr>
              
              <tr >
                <td width="16%" ><span id="createTime_span">注册时间：</span></td>
                <td width="29%">
                <input type="text" name="createTime" size="30" readonly="true" value="<bean:write name="RegCompanyForm"   property="createTime" format="yyyy-MM-dd HH:mm:ss"/>" id="createTime" class="formStyleall">
                </td>
                <td width="20%"><span id="endTime_span">有效结束日期：</span></td>
                <td width="35%">
                 <input type="text" name="endTime" size="30" value="<bean:write name="RegCompanyForm"   property="endTime" format="yyyy-MM-dd"/>" id="endTime" class="formStyleall">
                
                 
                </td>
              </tr>
    </table>
         </div>
        
                         </div>
                 </td>
            </tr>
        </table>
      </html:form>
    </fe:span>
    <fe:bottomTable>
        <logic:notEmpty name="RegCompanyForm" property="regComId">修改公司</logic:notEmpty> 
        <logic:empty name="RegCompanyForm" property="regComId">新增公司</logic:empty> 
    </fe:bottomTable>
</fe:body>
</html>


