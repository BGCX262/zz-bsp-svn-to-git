<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<style type="text/css">
		<!--
		#MOVE_Div {
		position: absolute;
		left: 20%;
		top: 15%;
		width: 300px;
		height: 165px;
		background-color: #FFFFFF;
		}
		 -->
	  </style>
	  <title>协同功能列表</title>
</head>
<fe:body>
<script>
        function deleteCoopArea()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
           document.getElementById("coopAreaList").action="<%=baseURL%>/deleteCoopArea_urss.do";
           document.getElementById("coopAreaList").submit();
        }
      
    }
    </script>
    <fe:topTable>
          <fe:powerTool funCode="urss_coop_area" groupName="list"/>
	 </fe:topTable>
     <fe:span>
     
  <form action="<%=baseURL%>/deleteCoopArea_urss.do" name="coopAreaList"  id="coopAreaList" style="margin: 0">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	
	  <thead>
		<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="75%" align="center"  nowrap="nowrap"><b>协同功能名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>是否动态</b></td>
		</tr>
		 </thead>
		<logic:iterate name="pageList" id="coopArea" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="coopArea" property="coopAreaId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showCoopArea_urss.do?coopAreaId=<bean:write name="coopArea" property="coopAreaId"/>','self')" >
			  <bean:write name="coopArea" property="coopAreaName"/>&nbsp;
			 </a>
			 </td>
			 <td  >
			  <logic:equal name="coopArea" property="isDynamic" value="Y">是</logic:equal>
			  <logic:equal name="coopArea" property="isDynamic" value="N">否</logic:equal>
			 &nbsp;</td>
			 
			
		</tr>
		</logic:iterate>
		
		
	
		
	</table>
	
	</form>
	</fe:span>
	<fe:bottomTable><strong>协同区列表</strong></fe:bottomTable>
</fe:body>
</html>
