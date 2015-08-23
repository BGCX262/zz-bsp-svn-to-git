<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>

<style type="text/css">
        <!--
        #MOVE_Div {
        position: absolute;
        left: 5%;
        top: 10%;
        width: 120 px;
        height: 10 px;
        background-color: #FFFFFF;
        }
         -->
      </style>
</head>
<script>
 function deleteInformation(){
       var editModel_gdcnTemp=editModel_gdcn;
       editModel_gdcn=false;
       var formObj=document.getElementById("InformationForm");
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
          alert("请选择一条记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
            formObj.action="<%=baseURL%>/deleteInformation_abdf.do";
           formObj.submit();
        }
    }
</script>

<fe:body>
<fe:topTable>
  <fe:powerTool funCode="abdf_information" groupName="list"/>
</fe:topTable>

  <fe:span>
    <form action="/saveInformation_abdf.do"   id="InformationForm" style="margin: 0">
    <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
        <thead>
        <tr>
            <td align="center"  width="5%">
            <input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
            <td align="center" ><font color="#000000">标题</font></td>
            <td align="center" ><font color="#000000">类型</font></td>
            <td align="center" ><font color="#000000">状态</font></td>
            <td align="center" ><font color="#000000">创建日期</font></td>
            <td align="center" ><font color="#000000">&nbsp;&nbsp;</font></td>
        </tr>
        </thead>
        <logic:notEmpty name="pageList" scope="request">
            <logic:iterate name="pageList" id="itemInformation" scope="request" >
            <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
                <td   align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="itemInformation" property="infoId"/>" ></td>
                <td><a href="#" onclick="buttomOnClick('<%=baseURL%>/editInformation_abdf.do?infoId=<bean:write name="itemInformation" property="infoId"/>','self')" >
                     <bean:write name="itemInformation" property="infoTitle"/></a></td>
                 <td >&nbsp;&nbsp;<fe:codeToName dictType="abdf_information_type" name="itemInformation" property="infoType" struts="true" dynamic="false" scope="page"/>
                 </td>
                 <td >&nbsp;&nbsp;<fe:codeToName dictType="abdf_information_status" name="itemInformation" property="infoStatus" struts="true" dynamic="false" scope="page" />
                 </td>
                 <td >
                     <bean:write name="itemInformation" property="createTime" format="yyyy-MM-dd HH:mm"/>
                 </td>
                 <td><a href="#" onclick="window.open('<%=baseURL%>/viewInformation_abdf.do?infoId=<bean:write name="itemInformation" property="infoId"/>')" >查看详情</a></td>
            </tr>
            </logic:iterate>
        </logic:notEmpty>
    </table>
    </form>
    
     </fe:span>
     <fe:bottomTable>
       <div align="center" ><strong>公告/消息列表</strong></div>
     </fe:bottomTable>
</fe:body>
</html>
