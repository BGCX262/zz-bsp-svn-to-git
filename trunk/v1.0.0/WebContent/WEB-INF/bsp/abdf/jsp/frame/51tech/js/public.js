var bgColor='#FFCC88';
var editModel_fireeagle=false;    
var exitPro='当前页面数据以修改,如果您退出,数据将丢失,确定继续!'       
var pageNum_fireeagle='' 
function next_focus()
{
	if(window.event.keyCode ==13)
	{
		window.event.keyCode=9;
	}
}

function changeEditModel()
{
  editModel_fireeagle=true
}

function isClose()
{
 if(editModel_fireeagle)
  {

    var All_Power_Button=document.getElementsByName('POWER_BUTTON');
   if(All_Power_Button!=null) { 
   for(var i=0;i<All_Power_Button.length;i++)
   { 
   if(All_Power_Button[i].disabled) { 
     All_Power_Button[i].disabled=false;
    }
    }
 }
     return exitPro
  }
}

function attachEventToChangeFormField()
{
   if(typeof(FLOW_EDIT_DIELDS)=='undefined') return;
   if(FLOW_EDIT_DIELDS==null||FLOW_EDIT_DIELDS.length==0)
      return;
   for(var i=0;i<FLOW_EDIT_DIELDS.length;i++)
   {
      wfField=FLOW_EDIT_DIELDS[i];
      //文本框的处理
      if(wfField.getFieldInputType()=='text')
      {
              var texts=document.getElementsByName(wfField.getFieldAlias());
              if(texts==null||texts.length==0) return;
              for(var j=0;j<texts.length;j++)
              {
                 texts[j].readOnly=false;
              }
      }
      //下拉框的处理
      if(wfField.getFieldInputType()=='select')
      {
              var texts=document.getElementsByName(wfField.getFieldAlias());
              if(texts==null||texts.length==0) return;
              for(var j=0;j<texts.length;j++)
              {
                 texts[j].disabled=false;
              }
      }
      
      //多选框的处理
      if(wfField.getFieldInputType()=='checkbox')
      {
              var texts=document.getElementsByName(wfField.getFieldAlias());
              if(texts==null||texts.length==0) return;
              for(var j=0;j<texts.length;j++)
              {
                 texts[j].disabled=false;
              }
      }
      
      //单选框的处理
      if(wfField.getFieldInputType()=='radio')
      {
              var texts=document.getElementsByName(wfField.getFieldAlias());
              if(texts==null||texts.length==0) return;
              for(var j=0;j<texts.length;j++)
              {
                 texts[j].disabled=false;
              }
      }
      
      //日期框的处理
      if(wfField.getFieldInputType()=='date'||wfField.getFieldInputType()=='dateTime')
      {
              var texts=document.getElementsByName(wfField.getFieldAlias());
              if(texts==null||texts.length==0) return;
              for(var j=0;j<texts.length;j++)
              {
                 texts[j].disabled=false;
              }
      }
   }
}
function attachEventFlowAddRed()
{
    if(typeof(FLOW_NOT_NULL_DIELDS)=='undefined') return;
  if(FLOW_NOT_NULL_DIELDS==null||FLOW_NOT_NULL_DIELDS.length==0)
      return;
   for(var i=0;i<FLOW_NOT_NULL_DIELDS.length;i++)
   {
      wfField=FLOW_NOT_NULL_DIELDS[i];
    
      var spanId=document.getElementById(wfField.getFieldAlias()+"_span");
      if(spanId!=null)
      {
         spanId.className="promptRed";
      } 
   }
   
}
function controlFocus(){
		window.event.srcElement.style.backgroundColor=bgColor;
}

function controlBlur(){
		window.event.srcElement.style.backgroundColor="";
}

function mouseovertd(o)
{
	o.style.color='#000000';
	o.style.backgroundColor='#FFCC88';

}
function mouseouttd(o)
{
	o.style.color='#000000';
	o.style.backgroundColor='';

}


function selectAllGrid(obj,name)
{
	var arrObj=document.getElementsByName(name);
	if(arrObj!=null&&arrObj.length>0)
	{
		for(var i=0;i<arrObj.length;i++)
		   arrObj[i].checked=obj.checked
	}
}


function buttomOnClickAdd(submitbutton,url,target)
{
   submitbutton.disabled=true
 if(target=='parent')
   {
    parent.location.href=url
   }else if(target=='self')
   {
      location.href=url
   }
   else if(target=='top')
   {
      top.location.href=url
   }
   else
   {
       document.getElementById(target).location.href=url;
   }
}

function submitForm(submitbutton,formId,fevf,moduleName)
{
  
  
   var editModel_fireeagleTemp=editModel_fireeagle;
   editModel_fireeagle=false;
 
  if(doValidate(formId,fevf,moduleName))
  {
    formToAbled();
    powerButtonToDisabled();
  	var objForm =document.getElementById(formId);
    objForm.submit();
    }
  else
  {
  
  	
  	editModel_fireeagle=editModel_fireeagleTemp;
  }
}

function affirmDoThisWorkItem(formId,activityId)
{
   
     powerButtonToDisabled();
     var objForm =document.getElementById(formId);
     objForm.action=baseURL+"/affirmDoThisWorkItem.do";
     objForm.submit();
}

function saveFormWithFlow(formId,moduleName)
{
  
  
   var editModel_fireeagleTemp=editModel_fireeagle;
   editModel_fireeagle=false;
   
  if(doValidate(formId,0,moduleName))
  {
      document.getElementById("SUBMIT_WF_ACTION").value="save";
      powerButtonToDisabled();
      formToAbled();
      var objForm =document.getElementById(formId);
    objForm.submit();
    }
  else
  {
  	editModel_fireeagle=editModel_fireeagleTemp;
  }
}

function openRouteWindow(formId,moduleName,activityId)
	  {
	     
	        var editModel_fireeagleTemp=editModel_fireeagle;
        editModel_fireeagle=false;
          document.getElementById("SUBMIT_WF_ACTION").value="submit";
           if(doValidate(formId,0,moduleName))
           {
                
                 var returnValue=showModalDialog(baseURL+"/openRouteWindow.do?wfss_activityId="+activityId,window,'dialogHeight:400px;dialogWidth:700px;status=off');
               if(returnValue)
               {
                  document.getElementById("SUBMIT_ROUTE_VALUE").value=SUBMIT_WF_VALUE.getKey();
                  document.getElementById("SUBMIT_OPTION_VALUE").value=SUBMIT_WF_VALUE.getValue();
                  powerButtonToDisabled();
                  formToAbled();
                  var wfForm=document.getElementById(formId);
                  wfForm.submit();
               }
           }
		  else
		  {
		  	
		  	editModel_fireeagle=editModel_fireeagleTemp;
		  }
	  }
	  
	  function submitFlowWithOutRouter(formId,moduleName,activityId)
	  {
	    
	    var editModel_fireeagleTemp=editModel_fireeagle;
        editModel_fireeagle=false;
          document.getElementById("SUBMIT_WF_ACTION").value="submit";
           if(doValidate(formId,0,moduleName))
           {
                  document.getElementById("SUBMIT_ROUTE_VALUE").value="";
                  document.getElementById("SUBMIT_OPTION_VALUE").value="";
                  powerButtonToDisabled();
                  formToAbled();
                  var wfForm=document.getElementById(formId);
                  wfForm.submit();
             
           }
		  else
		  {
		  	
		  	editModel_fireeagle=editModel_fireeagleTemp;
		  }
	  }

function formToAbled()
{
   var from_WfActivity=document.getElementsByTagName('form')[0];
   for(var i=0;i<from_WfActivity.elements.length;i++)
    {
          if(from_WfActivity.elements[i].name!="power_button")
               from_WfActivity.elements[i].disabled=false;
   }
   
}

function powerButtonToDisabled()
{
    var power_buttons=document.getElementsByName("power_button");
     for(var i=0;i<power_buttons.length;i++)
     {
          power_buttons[i].disabled=true;
    }
}

function buttomOnClick(url,target)
{

var loader_container_obj=document.getElementById("loader_container");
if(loader_container_obj!=null)
   loader_container_obj.style.display='';
 if(target=='parent')
   {
    parent.location.href=url
   }else if(target=='self')
   {
      location.href=url
   }
   else if(target=='top')
   {
      top.location.href=url
   }
   else
   {
       document.getElementById(target).location.href=url;
   }
}

function selectAllCheckBox(obj,name)
{
	var arrObj=document.getElementsByName(name);
	if(arrObj!=null&&arrObj.length>0)
	{
		for(var i=0;i<arrObj.length;i++)
		   arrObj[i].checked=obj.checked
	}
}


function buttomOnClickDel(submitbutton,url,target,checkBoxName)
{

   var rowid = "";
    var count =0;
    var selectedRow = document.getElementsByName(checkBoxName);
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
        count = count +1;
        rowid = rowid+checkBoxName+"="+selectedRow[i].value+"&";
      }
    }
  if(count <1)
  {
  		alert("请选择一条记录进行删除！");
        return ;
  }
	  //displayProcess()
  if(window.confirm("如果确定删除此数据\n\n 1:将联带删除所有子数据 \n 2:数据将不能恢复\n\n确定要删除选中的记录吗？")){
        if(url.indexOf("?")<0)
    	   location.href=url+"?"+rowid;
    	 else
    	    location.href=url+"&"+rowid;
  }
}

function getCheckBoxNum(checkBoxName)
{
    var checkboxArr=document.getElementsByName(checkBoxName);
    var num=0;
    for(var i=0;i<checkboxArr.length;i++)
    {
       if(checkboxArr[i].checked)
       {
           num=num+1;
       }
    }
    return num;
}

function getCheckBoxObj(checkBoxName)
{
    var checkboxArr=document.getElementsByName(checkBoxName);
    var obj=null;
    for(var i=0;i<checkboxArr.length;i++)
    {
       if(checkboxArr[i].checked)
       {
           obj=checkboxArr[i];
           break;
       }
    }
    return obj;
}

function getCheckBoxValue(checkBoxName,splitValue)
{
    var rowid = "";
    var selectedRow = document.getElementsByName(checkBoxName);
    for (var i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
        rowid = rowid+checkBoxName+"="+selectedRow[i].value+splitValue;
      }
    }
    if(rowid!='')
    {
      rowid=rowid.substring(0,(rowid.length-splitValue.length))
    }
    return rowid;
}


function LTrim(str)
/*
   PURPOSE: Remove leading blanks from our string.
   IN: str - the string we want to LTrim
*/
{
   var whitespace = new String(" 　\t\n\r");

   var s = new String(str);

   if (whitespace.indexOf(s.charAt(0)) != -1) {
      // We have a string with leading blank(s)...

      var j=0, i = s.length;

      // Iterate from the far left of string until we
      // don't have any more whitespace...
      while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
         j++;

      // Get the substring from the first non-whitespace
      // character to the end of the string...
      s = s.substring(j, i);
   }
   return s;
}

/*
==================================================================
RTrim(string) : Returns a copy of a string without trailing spaces.
==================================================================
*/
function RTrim(str)
/*
   PURPOSE: Remove trailing blanks from our string.
   IN: str - the string we want to RTrim

*/
{
   // We don't want to trip JUST spaces, but also tabs,
   // line feeds, etc.  Add anything else you want to
   // "trim" here in Whitespace
  var whitespace = new String(" 　\t\n\r");

   var s = new String(str);

   if (whitespace.indexOf(s.charAt(s.length-1)) != -1) {
      // We have a string with trailing blank(s)...

      var i = s.length - 1;       // Get length of string

      // Iterate from the far right of string until we
      // don't have any more whitespace...
      while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
         i--;


      // Get the substring from the front of the string to
      // where the last non-whitespace character is...
      s = s.substring(0, i+1);
   }

   return s;
}

/*
=============================================================
Trim(string) : Returns a copy of a string without leading or trailing spaces
=============================================================
*/
function Trim(str)
/*
   PURPOSE: Remove trailing and leading blanks from our string.
   IN: str - the string we want to Trim

   RETVAL: A Trimmed string!
*/
{
   return RTrim(LTrim(str));
}

function Control_LinkDropDown(obj,linkControlId,dictType)
{
   var objLinkControl=document.getElementById(linkControlId);
     objLinkControl.innerHTML="";
       var oElement=document.createElement("option");
       oElement.value="";
       oElement.text="--请选择--"
       objLinkControl.options.add(oElement);
    if(obj.value=="") return;
  
      	var url = baseURL+"/linkDropDown.do?"+obj.name+"="+obj.value+"&dictType="+dictType+"&linkId="+linkControlId;
	  var pars = null;
	  var myAjax = new Ajax.Request(
				url, 
				{
					method: 'get', 
					parameters: pars, 
					onComplete: CallBackLinkDropDownMethod,
					asynchronous:false
				});
	
}


function CallBackLinkDropDownMethod(request){
       var xmlObj = request.responseXML;
       var linkIdObj=xmlObj.getElementsByTagName("linkId");
       var linkControlId=linkIdObj[0].getAttribute("value");
       var objLinkControl=document.getElementById(linkControlId);
       var rowsObj=xmlObj.getElementsByTagName("row");
       for(var i=0;i<rowsObj.length;i++)
       {
           var oElement=document.createElement("option");
            oElement.value=rowsObj[i].getAttribute("value");
            oElement.text=rowsObj[i].getAttribute("text");
            objLinkControl.options.add(oElement);
       }
}

function attachEventToFormElement(formId)
{
    if(formId=='') return ;
    var EVENT_FORM= document.getElementById(formId);
	var ALL_ELEMENT_EVENT=EVENT_FORM.elements;
	for(var i=0;i<ALL_ELEMENT_EVENT.length;i++)
	{

	  
	    if(ALL_ELEMENT_EVENT[i].type=='button'&&ALL_ELEMENT_EVENT[i].name=='POWER_BUTTON')
	    {
		    ALL_ELEMENT_EVENT[i].disabled=false;
		}
		if((ALL_ELEMENT_EVENT[i].type!='button')&&!ALL_ELEMENT_EVENT[i].readOnly&&!ALL_ELEMENT_EVENT[i].disabled) {
		if(ALL_ELEMENT_EVENT[i].type!='textarea') {
				 ALL_ELEMENT_EVENT[i].attachEvent('onkeydown',next_focus);
			}
		 if(ALL_ELEMENT_EVENT[i].getAttribute('changeState')!='false'){ 
		    ALL_ELEMENT_EVENT[i].attachEvent('onchange',changeEditModel) 
			}
		 ALL_ELEMENT_EVENT[i].attachEvent('onblur',controlBlur)
		 ALL_ELEMENT_EVENT[i].attachEvent('onfocus',controlFocus);
	   }
	}
}


