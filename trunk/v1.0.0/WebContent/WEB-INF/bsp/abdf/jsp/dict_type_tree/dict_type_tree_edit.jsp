<%@ page contentType="text/html;charset=UTF-8" language="java"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	<script>
	  function getExeProperty()
	  { 
	        var modelClassValue=Trim(document.getElementById("modelClass").value);
	        if(modelClassValue=='')
	        {
	           alert("请输入model类全类名");
	            document.getElementById("modelClass").select();
	           return;
	        }
	       
	     	var url = baseURL+"/getExeProperty_abdf.do?modelClass="+modelClassValue;
	        var pars = null;
	        var myAjax = new Ajax.Request(
				url, 
				{
					method: 'get', 
					parameters: pars, 
					onComplete: CallBackExePropertyMethod,
					asynchronous:false
				});

	  }
	  
	  function CallBackExePropertyMethod(request){
        var xmlObj = request.responseXML;
        var rowsObj=xmlObj.getElementsByTagName("row");
        var objTable=document.getElementById('treeTypeChildEdit');
	 
        for(var i=0;i<rowsObj.length;i++)
        {
           var rowObj=rowsObj[i];
           var property=rowObj.getAttribute("property");
           var objTableLength=objTable.rows.length;
           var isAdd=true;
           for(var j=2;j<objTableLength;j++)
           {
              var rosComp=objTable.rows(j);
              var tempProperty=rosComp.children[2].children[0].value;
              if(tempProperty==property)
              {
                 isAdd=false;
                 break;
              }
           }
           var propertyDataType=rowObj.getAttribute("dataType");
           if(isAdd)
           {
			   var myrow=objTable.insertRow(objTableLength);
			    var html="";
			   var mycell=null;
			   mycell=myrow.insertCell();
			    mycell.width="100"
			   mycell.innerHTML="<input type='text' readOnly='true' class='formStyleall'  size='2' name='orderIndex' value='"+(objTableLength-2+1)+"' id='orderIndex'/><input type='checkbox' name='checkboxChild' value='' rowid='"+objTableLength+"' >";
		     
		       mycell=myrow.insertCell();
			     mycell.width="100"
			   mycell.innerHTML="<input type='hidden' name='formLayoutId' value=''><input type='text' class='formStyleall' style='width=100%'  name='propertyDes'    value=''>";
		       mycell=myrow.insertCell();
			   mycell.innerHTML="<input type='text' class='formStyleall' style='width=100%' readOnly='true'  name='propertyName'    value='"+property+"'>";
		        mycell.width="100"
		       mycell=myrow.insertCell();
			   mycell.width="100"
			   mycell.innerHTML="<fe:dropDown struts="false" dictType="pageInputType" dynamic="true" property="inputType" />";
		        mycell.width="100"
		       mycell=myrow.insertCell();
			   mycell.innerHTML="<input type='text' class='formStyleall' style='width=100%' readOnly='true'  name='propertyDataType'    value='"+propertyDataType+"'>";
		        mycell.width="100"
		       mycell=myrow.insertCell();
			   mycell.innerHTML="<input type='text' class='formStyleall' style='width=100%'   name='layoutGroup'    value=''>";
		        mycell.width="100"
		       mycell=myrow.insertCell();
			   mycell.innerHTML="<input type='text' class='formStyleall' style='width=100%'   name='inputKey'    value=''>";
	       }
        }
  }
  
  function delExeProperty()
{
var objTable=document.getElementById('treeTypeChildEdit');
if(getCheckBoxNum("checkboxChild")<=0)
{
	alert("请选择要删除的项！");
	return;
}
if(window.confirm("真的要删除所选项！"))
{
    var selectedRowArr=document.getElementsByName("checkboxChild");
    var deleteIds=document.getElementById("deleteIds").value;
    for(var i=selectedRowArr.length-1;i>=0;i--)
    {
        var itemObj=selectedRowArr[i];
        //alert(itemObj.checked)
        if(itemObj.checked)
        {
            if(itemObj.value!='')
                deleteIds=itemObj.value+","+deleteIds;
            itemObj.parentElement.parentElement.parentElement.removeChild(itemObj.parentElement.parentElement);
        }
        
    }
	var objTableLength=objTable.rows.length;
	for(var i=2;i<objTableLength;i++)
	{
		objTable.rows(i).cells(0).children[0].value=i-1;
		objTable.rows(i).cells(0).children[1].setAttribute("rowid",i);
	}
}
    if(deleteIds!="")
        deleteIds=deleteIds.substring(0,deleteIds.length-1);
     document.getElementById("deleteIds").value=deleteIds;
   
}

function moveUpExeProperty()
{
     var objTable=document.getElementById('treeTypeChildEdit');
		var checkboxChildArr=document.getElementsByName("checkboxChild");
		if(getCheckBoxNum("checkboxChild")!=1)
		{
		   alert("请选择移动的项,只能选择一项进行移动！");
		   return;
		}
		var checkboxobj=getCheckBoxObj("checkboxChild");
		var moveRowNum=parseInt(checkboxobj.getAttribute("rowid"));
		if(moveRowNum==2)
		{
		   alert("当前行已是了首行，不能再上移！");
		   return;
		}
		 objTable.moveRow(checkboxobj.getAttribute("rowid"), parseInt(checkboxobj.getAttribute("rowid"))-1);
        var objTableLength=objTable.rows.length;
		for(var i=2;i<objTableLength;i++)
		{
			objTable.rows(i).cells(0).children[0].value=i-1;
			if(moveRowNum-1==i)
			    objTable.rows(i).cells(0).children[1].checked=true;
			objTable.rows(i).cells(0).children[1].setAttribute("rowid",i);
		}
		
		

}
function moveDownExeProperty()
{
	var objTable=document.getElementById('treeTypeChildEdit');
		var checkboxChildArr=document.getElementsByName("checkboxChild");
		if(getCheckBoxNum("checkboxChild")!=1)
		{
		   alert("请选择移动的项,只能选择一项进行移动！");
		   return;
		}
		var checkboxobj=getCheckBoxObj("checkboxChild");
		var moveRowNum=parseInt(checkboxobj.getAttribute("rowid"));
		if(moveRowNum==objTable.rows.length-1)
		{
		   alert("当前行已是底行，不能再下移！");
		   return;
		}
		 objTable.moveRow(checkboxobj.getAttribute("rowid"), parseInt(checkboxobj.getAttribute("rowid"))+1);
        var objTableLength=objTable.rows.length;
		for(var i=2;i<objTableLength;i++)
		{
			objTable.rows(i).cells(0).children[0].value=i-1;
			if(moveRowNum+1==i)
			    objTable.rows(i).cells(0).children[1].checked=true;
			objTable.rows(i).cells(0).children[1].setAttribute("rowid",i);
		}
		
}

	</script>
	<fe:body formId="DictTypeTreeForm" moduleName="abdf">
    <fe:topTable>
    <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'DictTypeTreeForm',0,'abdf')" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/listDictTypeTree_abdf.do','self')"" id='dict_save'>&nbsp;&nbsp;
    </fe:topTable>

  <fe:span>
	
	<br />
		<center>
			<font size=4><b>树型类型字典</font>
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
							<html:form action="/saveDictTypeTree_abdf.do"   styleId="DictTypeTreeForm" method="post" style="margin: 0px">
							<table  cellspacing="0" cellpadding="3" width="96%" class="tform" align=center>
			<tr >
				<td width="16%" ><span id="treeTypeName_span"> 字典类型名称：</sapn></td>
				<td width="29%">
						<html:hidden name="DictTypeTreeForm" property="treeTypeId" styleId="treeTypeId" />
						<html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="treeTypeName" styleId="treeTypeName"  size="30" />
				</td>
				<td width="20%"><span id="treeTypeCode_span">字典类型代码：</sapn></td>
				<td width="35%">
				   <html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="treeTypeCode"  styleId="treeTypeCode"   size="30" />
				</td>
			  </tr>
			  
			  	<tr >
				<td width="16%" >树类型：</td>
				<td width="29%">
						 <html:radio name="DictTypeTreeForm"   property="treeStyle" value="sync">同步</html:radio>
				         <html:radio name="DictTypeTreeForm"   property="treeStyle" value="async">异步</html:radio>
						
				</td>
				<td width="20%"><span id="treeTypeCode_span">删除方式：</sapn></td>
				<td width="35%">
				 <html:radio name="DictTypeTreeForm"   property="delMode" value="logicDel">逻辑删除</html:radio>
				 <html:radio name="DictTypeTreeForm"   property="delMode" value="physicsDel">物理删除</html:radio>
				  
				</td>
			  </tr>
			  
			  <tr >
				<td width="16%" >引入JS文件：</td>
				<td width="29%">
						
						<html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="importJs" styleId="importJs"  size="30" />
				</td>
				<td width="20%">扩展验证方法：</td>
				<td width="35%">
				   <html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="extCheckMethod"  styleId="extCheckMethod"   size="30" />
				</td>
			  </tr>
			  
			   <tr >
				<td width="16%" ><span id="formId_span">表单id：</span></td>
				<td width="29%">
						
						<html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="formId" styleId="formId"  size="30" />
				</td>
				<td width="20%"><span id="moduleCode_span">模块编号：</span></td>
				<td width="35%">
				   <html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="moduleCode"  styleId="moduleCode"   size="30" />
				</td>
			  </tr>
			  
			  <tr >
				<td width="16%" ><span id="deleteExt_span">删除扩展：</span></td>
				<td width="29%" colspan="3">
						
						<html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="deleteExt" styleId="deleteExt"  size="30" />
				</td>
				
			  </tr>
			  
			  
			  <tr >
				<td width="100%" colspan="4"><span class="promptRed">model类全类名必须为应用程序本身已有的一个全类名,如:com.youthor.bsp.core.abdf.model.DictTreeType
				此值必然填写正确
				</span></td>
			  </tr>
			  
			<tr >
				<td width="16%" ><span id="modelClass_span">model类全类名：</span></td>
				<td width="29%" colspan="3">
				   <html:text name="DictTypeTreeForm" styleClass="formStyleall"  property="modelClass" styleId="modelClass"  size="70" />
				   <input type='button' name='power_button'  value='读取属性'   class='Button3' onclick="getExeProperty()" >
				   <INPUT type="hidden" name="deleteIds" id="deleteIds">
				</td>
				
			  </tr>
			
			  
	</table>
	
		<TABLE width="700"  cellspacing="0" cellpadding="3"  class="tlist" align="center" id="treeTypeChildEdit">
		<thead>
	   <tr >
			<td width='800' colspan='7'>
					<input type='button' name='CHILD_button' value='删除' class='Button3' onclick='delExeProperty()' >
					<input type='button' name='CHILD_button' value='上移' class='Button3' onclick='moveUpExeProperty()' >
					<input type='button' name='CHILD_button' value='下移' class='Button3' onclick='moveDownExeProperty()' >
			</td>
		</tr>
		 
	      <tr>
	      
	        <td align="center" widht="100"  nowrap="nowrap"><b>序</b></td>
			<td align="center" widht="100"  nowrap="nowrap"><b><span id="propertyDes_span">属性/控件描述</span></b></td>
			<td   align="center" widht="100"  nowrap="nowrap"><b>属性/控件名</b></td>
			<td  align="center" widht="100"   nowrap="nowrap"><b>控件类型</b></td>
			<td  align="center" widht="100"  nowrap="nowrap"><b>数据类型</b></td>
			<td  align="center" widht="100"  nowrap="nowrap"><b>布局分组</b></td>
			<td  align="center"widht="100"   nowrap="nowrap"><b>控件key</b></td>
			</tr>
			</thead>
			<logic:present name="subProperty">
			<logic:notEmpty name="subProperty">
			  <logic:iterate name="subProperty" id="formLayout" indexId="i">
			   <bean:define id="formLayoutRequest" name="formLayout" toScope="request"></bean:define>
			  <%int inti=((Integer)i).intValue();%>
			 <tr>
		        <td align="center" widht="100"  nowrap="nowrap"><input type='text' readOnly='true' class='formStyleall'  size='2' name='orderIndex' value='<%=inti+1%>' id='orderIndex'/><input type='checkbox' name='checkboxChild' value='<bean:write name="formLayout" property="formLayoutId"/>' rowid='<%=inti+2%>' >
                </td>
                
				<td align="center" widht="100"  nowrap="nowrap"><html:hidden name="formLayout" property="formLayoutId"/><html:text name="formLayout" property="propertyDes" styleClass="formStyleall"  /></td>
				<td   align="center" widht="100"  nowrap="nowrap">
				 <html:text name="formLayout" property="propertyName" styleClass="formStyleall"  />
                </td>
				<td   widht="100"   nowrap="nowrap">
				 <fe:dropDown struts="true" dictType="pageInputType" name="formLayoutRequest" dynamic="true" property="inputType" />
               </td>
				<td  align="center" widht="100"  nowrap="nowrap">
				  <html:text name="formLayout" property="propertyDataType" styleClass="formStyleall"  />
                </td>
				<td  align="center" widht="100"  nowrap="nowrap">
				   <html:text name="formLayout" property="layoutGroup" styleClass="formStyleall"  />
                </td>
				<td  align="center"widht="100"   nowrap="nowrap">
				  <html:text name="formLayout" property="inputKey" styleClass="formStyleall"  />
               </td>
			</tr>
			  </logic:iterate>
			</logic:notEmpty>
			</logic:present>
	   </table>
	</html:form>
						 </div>
		
		                 </div>
				 </td>
			</tr>
		</table>

	</fe:span>
	<fe:bottomTable>
			<strong>
							<logic:notEmpty name="DictTypeTreeForm" property="treeTypeId">修改树型类型字典</logic:notEmpty> 
							<logic:empty name="DictTypeTreeForm" property="treeTypeId">新增树型类型字典</logic:empty> 
                             </strong>
	</fe:bottomTable>
</fe:body>
</html>

