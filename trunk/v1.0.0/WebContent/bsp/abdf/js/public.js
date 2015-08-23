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


function displayError(content,displayType) {
      if (displayType == 'div') {
        var messContent="<div style='padding:20px 0 20px 0;text-align:center'>"+content+"</div>"
        showMessageBoxCenter('错误提示',messContent,350);
      }
      else {
         var reg = new RegExp("(<br/>)","g");
         content = content.replace(reg,'\n');
         alert(content);
      }
}


function getInputValueInForm(formId,inputName) {
   var objForm = document.getElementById(formId);
   var inputObj = objForm[inputName];
   var fireRealValue= "";
   
    if (typeof(inputObj) == "undefined") {
          for (var i = 0; i < inputObj.length; i++) {
            if (inputObj[i].checked) {
                fireRealValue = inputObj[i].value+",";
            }
           }
           
           if (fireRealValue!="") {
             fireRealValue = fireRealValue.substring(0,fireRealValue.length-1);
           }
            
         }
         else if (inputObj.type == "checkbox" || inputObj.type == "radio") {
            if (inputObj.checked) {
               fireRealValue = inputObj.value;
            }
         } else {
           fireRealValue = inputObj.value;
         }
         return fireRealValue;
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
    document.getElementById("SUBMIT_WF_ACTION").value="save";
  if(doValidate(formId,0,moduleName))
  {
     
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

function openRouteWindow(formId,moduleName,activityId,workItemId)
	  {
	    
	        var editModel_fireeagleTemp=editModel_fireeagle;
        editModel_fireeagle=false;
          document.getElementById("SUBMIT_WF_ACTION").value="submit";
         
           if(doValidate(formId,0,moduleName))
           {
                
                 var returnValue=showModalDialog(baseURL+"/openRouteWindow_wfss.do?wfss_activityId="+activityId+"&wfss_workItemId="+workItemId,window,'dialogHeight:400px;dialogWidth:700px;status=off');
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
	  
	  
	  function openButtonSubmitRouteWindow(formId,moduleName,routeId,workItemId)
	  {
	     
	       var editModel_fireeagleTemp=editModel_fireeagle;
          editModel_fireeagle=false;
          document.getElementById("SUBMIT_WF_ACTION").value="submit";
           if(doValidate(formId,0,moduleName))
           {
                
                 var returnValue=showModalDialog(baseURL+"/forwardButtonSubmtView_wfss.do?routeId="+routeId+"&workItemId="+workItemId,window,'dialogHeight:400px;dialogWidth:700px;status=off');
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
	  
	  
	  function processAttachUpload (formId,workItemId) {
	   if(workItemId == '') {
	      alert("请保存业务数据后再上传附件");
	    }
	    else {
	        var returnValue=showModalDialog(baseURL+"/initProcessAttach_wfss.do?workItemId="+workItemId,window,'dialogHeight:400px;dialogWidth:700px;status=off');
	         if (returnValue!=null && returnValue) {
	          location.reload();
	        }
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

//var loader_container_obj=document.getElementById("loader_container");
//if(loader_container_obj!=null)
 //  loader_container_obj.style.display='';
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
          if(!arrObj[i].disabled) {
            arrObj[i].checked=obj.checked
          }
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
  
          var url = baseURL+"/linkDropDown_abdf.do?"+obj.name+"="+obj.value+"&dictType="+dictType+"&linkId="+linkControlId;
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
        // ALL_ELEMENT_EVENT[i].attachEvent('onblur',controlBlur)
        // ALL_ELEMENT_EVENT[i].attachEvent('onfocus',controlFocus);
       }
    }
}

function deleteProcessAttach(attach_id) {
if(window.confirm("确定删除此附件?")) {
     var url = baseURL+"/deleteProcessAttach.do?attachId="+attach_id;
      var pars = null;
      var myAjax = new Ajax.Request(
                url, 
                {
                    method: 'get', 
                    parameters: pars, 
                    onComplete: CallBackDeleteProcessAttach,
                    asynchronous:false
                });
    }
  }
  
  function CallBackDeleteProcessAttach ()
  {
    location.reload();
  }

//add by jason
function viewDetail(curobj,url,curHeight,curWidth,caption){
    viewDetailByPos(curobj,url,caption,curHeight,curWidth,'bottom');
}

function viewDetailByPos(curobj,url,caption,curHeight,curWidth, opt_position){
    if (document.getElementById){
        //set view caption
        var viewCaption=$("viewCaption");
        viewCaption.innerText = caption;
        //get view content
        var viewContent=$("viewContent");
        viewContent.style.width=curWidth+"px";
        viewContent.style.height=curHeight+"px";
        //loading content
        loadingContentByGet("viewContent",url);
        //show view
        var subobj=$("viewContentDiv")
        subobj.style.display=(subobj.style.display!="block")? "block" : "none"
        var xpos=getposOffset(curobj, "left")+((typeof opt_position!="undefined" && opt_position.indexOf("right")!=-1)? -(subobj.offsetWidth-curobj.offsetWidth) : 0) 
        var ypos=getposOffset(curobj, "top")+((typeof opt_position!="undefined" && opt_position.indexOf("bottom")!=-1)? curobj.offsetHeight : 0)
        subobj.style.left=138 + xpos+"px"
        subobj.style.top=13 + ypos+"px"
        subobj.style.width=curWidth+"px";
        subobj.style.height=curHeight+"px";
        subobj.style.position="absolute";
        subobj.style.zIndex="100"; 
        
        return false;
    }else{
        return true;
    }
}

function loadingContentByGet(contentId,url){
    getContentByMethod(contentId,url,'post');
}

function getContentByMethod(contentId,url,method){
    var request_pars = "";
    appendLoadingDiv(contentId);
    var myAjax = new Ajax.Updater(contentId, url,{
    method     : method,
    parameters : request_pars, 
    onFailure  : errorLoading, 
    onCreate  : startLoading, 
    onComplete : endLoading
    });
}

function appendLoadingDiv(parentObj){
    $(parentObj).appendChild(createLoadingDiv());
}

function createLoadingDiv(){
    var div=document.createElement("div");
    div.id="loading";
    //div.style.display="none";
    div.className="loading";
    div.innerHTML="<img src='"+baseURL+"/bsp/abdf/skins/images/loading.gif'/>";
    return div;
}

function errorLoading(request){
    alert("数据下载失败，请稍后再试!");
    closeView();
}

function startLoading(){
    $("loading").style.display = "block";
}

function endLoading(){
    $("loading").style.display = "none";
}

function closeView(){
    $("viewContentDiv").style.display="none";
    $("viewContent").innerHTML="";
}

function getposOffset(overlay, offsettype){
    var totaloffset=(offsettype=="left")? overlay.offsetLeft : overlay.offsetTop;
    var parentEl=overlay.offsetParent;
    while (parentEl!=null){
        totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
        parentEl=parentEl.offsetParent;
    }
    return totaloffset;
}
function submitBatchProcessWorkItem(flag) {
      if (getCheckBoxNum("workItemDoingId") == 0) {
          alert("请至少选择一条待办进行处理!");
          return;
      }
      var returnValue=showModalDialog(baseURL+"/bsp/wfss/common/input_batch_option.jsp",window,'dialogHeight:400px;dialogWidth:700px;status=off');
        if(returnValue)
         {
                  document.getElementById("routeBatchFlag").value = flag;
                  formToAbled();
                  powerButtonToDisabled();
                  var wfForm=document.getElementById("workItemDoing");
                  workItemDoing.action = baseURL+"/submitBatchProcessWorkItem.do";
                  wfForm.submit();
         }         
}

function assignOtherUserProcess(orgID,OrgName,orgType,workItemId)
{
       orgVo=new OrgVo();
       orgVo.setOrgId(orgID); //根节点id设置 
       orgVo.setOrgName(OrgName);//根节点名称设置 
       orgVo.setOrgType(orgType);//根节组织架构类型 
       orgVo.setSelectOrgType("YG");//设置可以选择的组织架构类型 
       orgVo.setSize(1);
        var returnValue=showModalDialog(baseURL+'/forwardOrgSelectFrame_abdf.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
       if(returnValue==null) return ;
       var subOrgList=orgVo.getSubOrgVos();
       var ids="";
       var orgTemp=subOrgList[0];
       // object . setAttribute ( sName , vValue , iFlags ) 
       
       var assignOtherUserForm=document.createElement("<FORM>"); 
       assignOtherUserForm.action = baseURL+"/assignOtherUserProcess_wfss.do"; 
       assignOtherUserForm.method = "post"; 
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = orgTemp.getOrgId();
       hiddenObj.name = "orgId";
       assignOtherUserForm.appendChild(hiddenObj);
       
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = orgTemp.getOrgName();
       hiddenObj.name = "orgName";
       assignOtherUserForm.appendChild(hiddenObj);
       
       
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = workItemId;
       hiddenObj.name = "workItemId";
       assignOtherUserForm.appendChild(hiddenObj);
       
       document.body.appendChild(assignOtherUserForm);
       
       assignOtherUserForm.submit();
       
}
function jumpToOtherActivity(processId,activityId,workItemId){
     var jumpToOtherForm=document.createElement("<FORM>"); 
       jumpToOtherForm.action = baseURL+"/jumpToOtherActivity_wfss.do"; 
       jumpToOtherForm.method = "post"; 
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = '';
       hiddenObj.name = "jump_option";
       hiddenObj.id = "jump_option";
       jumpToOtherForm.appendChild(hiddenObj);
       
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = '';
       hiddenObj.name = "jump_org";
        hiddenObj.id = "jump_org";
       jumpToOtherForm.appendChild(hiddenObj);
       
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = '';
       hiddenObj.name = "jump_to_activity";
        hiddenObj.id = "jump_to_activity";
       jumpToOtherForm.appendChild(hiddenObj);
       
       
       var hiddenObj=document.createElement("<INPUT>"); 
       hiddenObj.type = "hidden";
       hiddenObj.value = workItemId;
       hiddenObj.name = "workItemId";
       jumpToOtherForm.appendChild(hiddenObj);
       
       document.body.appendChild(jumpToOtherForm);
       
    var returnValue=showModalDialog(baseURL+'/forwardJumpActivitySelect_wfss.do?processId='+processId, window,'dialogHeight:500px;dialogWidth:650px;status=off');
   if (returnValue!=null && returnValue) {
         jumpToOtherForm.submit();  
    }
}

function redoWorkItem(processId,activityId,workItemId) {
   location.href = baseURL+"/redoWorkItem_wfss.do?workItemId="+workItemId;
   
}
function openOnHelpWindow(code) {
  window.open(baseURL+"/showOnLineHelperByCode.do?onLineHelperCode="+code, "OnHelpWindow");
}

function cancelProcessInst(processId,activityId,workItemId) {
if(window.confirm("确定作废此流程实例，所有流程实例待办将删除，点确认将删除?")) {
   if (workItemId!=null && workItemId!="") {
        location.href = baseURL+"/cancelProcessInst_wfss.do?workItemId="+workItemId;
   }
   }
}

function hangProcessInst(processId,activityId,workItemId) {
  if(window.confirm("确定挂起此流程实例，所有流程实例待办将同时挂起，点确认将删除挂起?")) {
   if (workItemId!=null && workItemId!="") {
        location.href = baseURL+"/hangProcessInst_wfss.do?workItemId="+workItemId;
   }
   }
}

function cancelHangProcessInst(workItemId) {
   if (workItemId!=null && workItemId!="") {
        location.href = baseURL+"/cancelHangProcessInst.do?workItemId="+workItemId;
   }
}


function abdfAddFavorite() {
    
     var returnValue=showModalDialog(baseURL+"/initFavorite_abdf.do",window,'dialogHeight:500px;dialogWidth:400px;status=off');
     if (returnValue!=null&&returnValue) {
        top.topFrame.main.location.href=baseURL+"/top_abdf.do";
     }
              
}

