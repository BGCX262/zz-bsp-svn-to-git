/* 精鹰软件 javaScript 客户端验证框架
 * 作者:刘正仁
 * 创立日期:2006-07-20 22:07
 * 感谢老婆王敏对我工作和学习的支持.
 */
 //xml存放路经
 var ValidationRoot = baseURL+"/bsp/validationXml/";
 var ValidationFailCssStyle="border:1px solid red;";
 var DocumentElementValidationRoot=null;
 /*页面调用此方法进行数据验证 formRef
  * (1):formRef 为字符串时 formName+"."+xml ml???.
  * (2):formRef???????????
  * ??????????????????????????????????
  * ????????????id????.
  */
String.prototype.trim = function()
{
    return this.replace(/(^[\s]*)|([\s]*$)/g, "");
}
  
 function doValidate(formRef,fevf,moduleName) {


	try {
		
		var formId = formRef;
		if (typeof (formRef) == "string") {
			formId = formRef;
		} else if (typeof (formRef) == "object") {
			formId = formRef.getAttribute("id");
		}
        //return true
		var form = FormFactory.getFormFromId(formId,moduleName);
		if (form != null) {
			return ValidationFramework.validateForm(form,fevf);
	} else {
			return false;
		}
	} catch (e) {
		ValidationFramework.exception(e.name+":" +e.description);
		return false;
	}
}

function doToAddRedValidate(formRef,moduleName) {


	try {
		
		var formId = formRef;
		if (typeof (formRef) == "string") {
			formId = formRef;
		} else if (typeof (formRef) == "object") {
			formId = formRef.getAttribute("id");
		}
        //return true
		var form = FormFactory.getFormFromId(formId,moduleName);
		if (form != null) {
			return ValidationFramework.addRedValidate(form);
	} else {
			return false;
		}
	} catch (e) {
		ValidationFramework.exception(e.name+":" +e.description);
		return false;
	}
}


//参数工厂
function ParamFactory(){}
ParamFactory.getParamFromDOM=function(dom){
	var param =new Param();
	param.setDataType(dom.getAttribute("dataType"));
	param.setValue(dom.getAttribute("value"));
	param.setIndex(dom.getAttribute("index"));
	param.setPage(dom.getAttribute("page"));
	return param;
}
//工厂验证项
function ValidationFactory(){}
ValidationFactory.getValidationFromDOM=function(dom){
	var v = new Validation();
	v.setName(dom.getAttribute("name"));
	if (dom.hasChildNodes()) {
		var params = dom.childNodes;
		for (var i = 0; i < params.length; i++) {
			var item = params.item(i);
			if (typeof(item.tagName) == 'undefined' || item.tagName != 'param') {
				continue;
			}
			var param =ParamFactory.getParamFromDOM(params.item(i));
			v.addParam(param);
		}
	}
	return v;
}
 //域工厂
 function FieldFactory() {}
 FieldFactory.getFieldFromDOM = function(dom) {
	var field = new ValidationField();
	field.setName(dom.getAttribute("name"));
	field.setDisplayError(dom.getAttribute("displayError"));
	field.setFire (dom.getAttribute("fire"));
	field.setFevf(dom.getAttribute("fevf"));
	field.setValue(dom.getAttribute("value"));
	field.setNoRepeat(dom.getAttribute("noRepeat"));
	field.setNoRepeatValue(dom.getAttribute("noRepeatValue"));
	field.setIsArray(dom.getAttribute("isArray"));
	
	
	if (dom.hasChildNodes()) {
		var validations = dom.childNodes;
		for (var i = 0; i < validations.length; i++) {
			var item = validations.item(i);
			if (typeof(item.tagName) == 'undefined' || item.tagName != 'validation') {
				continue;
			}
			var validation = ValidationFactory.getValidationFromDOM(validations.item(i));
			field.addValidation(validation);
		}
	}
	return field;
}


 //子表单工厂
 function SubFormFactory() {}
 SubFormFactory.getSubFromDOM= function(dom) {
	var subForm = new SubForm();
	subForm.setName(dom.getAttribute("name"));
	//subForm.setDisplayContent(dom.getAttribute("displayContent"));
	subForm.setFlagField(dom.getAttribute("flagField"));
	if (dom.hasChildNodes()) {
		var f = dom.childNodes;
		for (var i = 0; i < f.length; i++) {
			var item = f.item(i);
			if (typeof(item.tagName) == 'undefined' || item.tagName != 'field') {
				continue;
			}
			var field = FieldFactory.getFieldFromDOM(f.item(i));
			field.setIsSubForm(true);
			if (field != null) {
				subForm.addField(field);
		}
	}
	}
	return subForm;
}

 
  //表单工厂
function FormFactory() {}


FormFactory.getFormFromDOM = function(dom) {
	var form = new ValidationForm();
	form.setName(dom.getAttribute("name"));
	
	form.setDisplayType(dom.getAttribute("displayType"));
	form.setAtClient(dom.getAttribute("atClient"));
	form.setDisplayContent(dom.getAttribute("displayContent"));

	if (dom.hasChildNodes()) {
		var f = dom.childNodes;
		for (var i = 0; i < f.length; i++) {
			if (f.item(i) == null||typeof(f.item(i).tagName) == 'undefined' || f.item(i).tagName != 'field') {
				continue;
			}
			var field = FieldFactory.getFieldFromDOM(f.item(i));
			if (field != null) {
				form.addField(field);
			}
		}
		for (var i = 0; i < f.length; i++) {
			if (f.item(i) == null||typeof(f.item(i).tagName) == 'undefined' || f.item(i).tagName != 'subForm') {
				continue;
			}
			var subForm = SubFormFactory.getSubFromDOM(f.item(i));
			if (subForm != null) {
				form.addSubForm(subForm);
			}
		}
	}
	return form;
}




FormFactory.getFormFromId = function(id,moduleName) {
	var root = ValidationFramework.getDocumentElement(id,moduleName);
	if ( root == null || (!root.hasChildNodes()) ) return null;
	var vforms = root.childNodes;
	for (var i = 0; i < vforms.length; i++) {
		var f = vforms.item(i);
		if (typeof(f.tagName) != 'undefined' && f.tagName == 'form') {
			return FormFactory.getFormFromDOM(f);
		}
	}
	return null;
}




 function XmlDocument() {}
 XmlDocument.create = function () {
	if (document.implementation && document.implementation.createDocument) {
		return document.implementation.createDocument("", "", null);
	} else if (window.ActiveXObject) {
		try {
			var prefix = ["MSXML2", "MSXML", "Microsoft", "MSXML3"];
			for (var i = 0; i < prefix.length; i++) {
				var obj = new ActiveXObject(prefix[i] + ".DomDocument"); 
				if (obj == null || typeof(obj) == 'undefined') {
					continue;
				} else {
					return obj;
				}
			}
		} catch (e) {
			throw new Error("使用的浏览器必须IE5.0以上");
		}
	} else
		throw new Error("解析xml文件出错了");
}
 function ValidationFramework() {}
 ValidationFramework.currentForm=null;//缓存当前表单
 
ValidationFramework.addRedValidate=function(fform)
{
   ValidationFramework.currentForm = fform;
    var fields = fform.getFields();//得到验证字段有多少.主表的
     for (var i = 0; i < fields.length; i++) 
     {
        var validations=fields[i].getValidations();//得到所有的验证.
        for (var j = 0; j < validations.length; j++) {
		    if (validations[j].getName() == "required") {  //必填验证
		       document.getElementById(fields[i].getName()+"_span").className="promptRed";
		       break;
		    }
		}
     }
}
 
ValidationFramework.validateForm = function(fform,fevf) {
  try{
		ValidationFramework.currentForm = fform;
		if(fform.getAtClient()=='false')
		{
			return true;
		}
		else
		{
			var failFields = [];  //保存验证失败的字段
			var rigthFields = [];  //保存验证失败的字段
			var id = fform.getName();//得到表单id
			var displayType=fform.getDisplayType();//得到显示方式.
			var displayContent=fform.getDisplayContent();//得到显示内容方式。
			//定义换行参数Begin***************************************
			var br = null;
		    if (displayType != "alert") 
		    {
			  br = "<br />";
		    } else {
			 br = "\n";
		    }
		    //定义换行参数End***********************************
		    var errorStrArray = [];//错误字符串数组.
		    var returnValue = false;//定义返回值。
		    var formObj = document.getElementById(id);//得到表单对象
		    var fields = fform.getFields();//得到验证字段有多少.主表的
		   
		    
		    //对字段开始loop,进行数据验证.  主表的验证
		    for (var i = 0; i < fields.length; i++) 
		    {
			   var retVal = ValidationFramework.validateField(fields[i],fevf);
			   //得到错误信息，并放入数组中**************************
			   if (retVal != "OK") 
			   {
				errorStrArray[errorStrArray.length] = retVal;
				failFields[failFields.length] = formObj[fields[i].getName()];
			   } 
			   else 
				{
				   		rigthFields[rigthFields.length]=formObj[fields[i].getName()];
				}
			   //放入错误信息end***********************************
			  
	
		    }//end for
		    var subForms = fform.getSubForms();//得到验证字段有多少.子表的
		    if(subForms!=null&&subForms.length>0)
		    {
		    	for(var i=0;i<subForms.length;i++)
		    	{
		    		var subForm=subForms[i];
		    		var subFormName=subForm.getName();
		    		var subFormFlagField=subForm.getFlagField();
		    		var totalSubFormRows=parseInt(formObj[subFormName].value);
		    		var subFormFields=subForm.getFields();
		    		for (var ii = 0; ii < subFormFields.length; ii++) 
		    		{
		    		    var cutFeildName=subFormFields[ii].getName();
		    		    //如果是数组，要对名字做额外的处理
		    		    var isArray="";
		    			if(subFormFields[ii].getIsArray()!=null&&subFormFields[ii].getIsArray()=='true')
		    				isArray="ARRAY";
		    			//是否可重复
		    			var totalRepret=0;
		    			for(var j=1;j<=totalSubFormRows;j++)
		    			{
		    			   if(formObj[subFormName+"_"+cutFeildName+"_"+j]!=null)
		    			   {
		    			       //验证一般化
			    				subFormFields[ii].setName(subFormName+isArray+"_"+cutFeildName+"_"+j);
			    				var retVal = ValidationFramework.validateField(subFormFields[ii],fevf);
			    				if (retVal != "OK") 
				   				{
									errorStrArray[errorStrArray.length] = retVal;
									failFields[failFields.length] = formObj[subFormFields[ii].getName()];
				   				} else 
				   				{
				   					rigthFields[rigthFields.length]=formObj[subFormFields[ii].getName()];
				  				}
				  				//验证不能重复
				  				
				  				var controlvalue=formObj[subFormName+isArray+"_"+cutFeildName+"_"+j].value.trim();
				  				var noRepeat=subFormFields[ii].getNoRepeat();
				  				var noRepeatValue=subFormFields[ii].getNoRepeatValue();
				  				if(noRepeat!=null&&noRepeat=='true'&&isArray=="")
				  				{
				  				    if(noRepeatValue=='any')
				  				    {
					  					for(var jj=j+1;jj<=totalSubFormRows;jj++)
										{
											var objCom=formObj[subFormName+"_"+cutFeildName+"_"+jj]
											if(objCom!=null&&controlvalue==objCom.value.trim()&&controlvalue.trim()!="")
											{
												errorStrArray[errorStrArray.length] = subFormFields[ii].getDisplayError();
												failFields[failFields.length] = formObj[subFormName+"_"+cutFeildName+"_"+jj];
											}
										}
									}
									else
									{
										if(controlvalue==noRepeatValue)
										{
											totalRepret++;
										}
										if(totalRepret>1)
										{
											errorStrArray[errorStrArray.length] = subFormFields[ii].getDisplayError();
											failFields[failFields.length] = formObj[subFormName+"_"+cutFeildName+"_"+j];
										}
									}
				  			    }
				  				
				  				 subFormFields[ii].setName(cutFeildName);
				  			 }
		    			 }
		    		}
		    	}
		    }
		    //验证子表
		    if(errorStrArray==null||errorStrArray.length==0) return true;
		        
		   //对错误信息进行显示给用户。*****************************************  
		   
			  if (errorStrArray.length > 0) {
				if (displayType == "alert") {
					if (displayContent == "first") {
						alert(errorStrArray[0]);
					} else {
						alert(errorStrArray.join(br));
					}
					
				} else {
					var messContent=""; 
					var errObj =document.getElementById(displayType);
					if (displayContent == "first") {
					   messContent="<div style='padding:20px 0 20px 0;text-align:center'>"+displayContent+"</div>"
						errObj.innerHTML = errorStrArray[0];
					} else {
					messContent="<div style='padding:20px 0 20px 0;text-align:center'>"+errorStrArray.join(br)+"</div>"
					}
					showMessageBoxCenter('错误提示',messContent,350);
				}
			  }
			//错误信息显示结束**********************************************
			
			//使第一个错误控件得到焦点.
			if (typeof (failFields[0]) !='undefined' && 
				failFields[0] != null &&
				typeof(failFields[0].type) != "undefined") {
				failFields[0].focus();
			}
			//使第一个错误控件得到焦点END
			//如果是正确的，要把错误色去了***************************************
			for (var i = 0; i < rigthFields.length; i++) {
	
				var o = rigthFields[i];
				if ( typeof (o) !='undefined' && 
					 o != null && typeof(o.type) != "undefined") {
					if(o.style.cssText.indexOf("red")>=0)
					   o.style.cssText="";
				}	
			}
			
			//使用所有出错的控件的边框色变化
			for (var i = 0; i < failFields.length; i++) {
	
				var o = failFields[i];
				if ( typeof (o) !='undefined' && 
					 o != null && typeof(o.type) != "undefined") {
					 o.style.cssText = o.style.cssText+";"+ValidationFailCssStyle;
						
					 
				}	
			}
			//使用所有出错的控件的边框色变化End
			
			
			//如果是正确的，要把错误色去了end**********************************
			return returnValue;
		 }//end if
	   }catch(e)
	   {
	   }
	
}
//验证单个域
ValidationFramework.validateField = function(field,fevf) {
	
	var validations=field.getValidations();//得到所有的验证.
	var retStr = "OK";//定义返回字符串.
	//开始对验证进行loop,进行数据验证.当有多个给证是，只要第一个验证出了问题，就返回，不做第二个验证了。
	for (var i = 0; i < validations.length; i++) {
		//对单个验证进行验证，要把字段对象也传入。以便是到相应的返回信息。
		
		if (!ValidationFramework.validateValidation(field, validations[i],fevf)) {
			//retStr = ValidationFramework.getErrorString(field, validations[i]);
			retStr=field.getDisplayError();
		
			return retStr; //返回;
		}
	}
	return retStr;
}





//对单个进验证进行验证。
ValidationFramework.validateValidation = function(field, validation,fevf) {
	if (validation.getName() == "required") {  //必填验证
		return ValidateMethodFactory.validateRequired(field, validation.getParams(),fevf);
	} 
	else if(validation.getName() == "integer" ||validation.getName() == "int") //整数验证
	{
		return ValidateMethodFactory.validateInteger(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "double"||validation.getName() == "float")   //浮点数验证
	{
		return ValidateMethodFactory.validateDouble(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "date" || validation.getName() == "Date") //日期验证
	{
		return ValidateMethodFactory.validateDate(field, validation.getParams(),fevf); 
	}
	else if(validation.getName() == "minDate" ) //最小日期
	{
		//未实现
	}
	else if(validation.getName() == "maxDate" ) //最大日期
	{
		//未实现
	}
	else if(validation.getName() == "dateRange" ) //两个日期之间
	{
		//未实现
	}
	else if(validation.getName() == "time" ) //时间验证
	{
		//未实现
	}
	else if(validation.getName() == "minTime" ) //最小时间
	{
		//未实现
	}
	else if(validation.getName() == "maxTime" ) //最大时间
	{
		//未实现
	}
	else if(validation.getName() == "timeRange" ) //两个时间之间
	{
		//未实现
	}
	
	else if(validation.getName() == "dataTime" ) //日期+时间验证
	{
		//未实现
	}
	else if(validation.getName() == "minDataTime" ) //最小时间
	{
		//未实现
	}
	else if(validation.getName() == "maxDataTime" ) //最大时间
	{
		//未实现
	}
	else if(validation.getName() == "dataTimeRange" ) //两个时间之间
	{
		//未实现
	}
	
	else if(validation.getName() == "email") //email验证
	{
		return ValidateMethodFactory.validateEmail(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "chineseChar") //中文验证
	{
		return ValidateMethodFactory.validateChineseChar(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "char")  //英文和数字验证
	{
		return ValidateMethodFactory.validateChar(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "equals")  //相等验证
	{
		return ValidateMethodFactory.validateEqulas(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "minLength")  //长度最小验证
	{
		return ValidateMethodFactory.validateMinLength(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "maxLength")  //长度最大验证
	{
		return ValidateMethodFactory.validateMinLength(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "integerRange")  //整数必然在两个数之间
	{
		return ValidateMethodFactory.validateIntegerRange(field, validation.getParams(),fevf);
	}
	else if(validation.getName() == "doubleRange")  //浮点数必然在两个数之间
	{
		return ValidateMethodFactory.validateDoubleRange(field, validation.getParams(),fevf);
	}
	
	
}
//对必填进行验证.params 此参数据在此验证中无用
//ValidateMethodFactory.validateRequired = function(field, params) {
	//var obj = ValidationFramework.getWebFormFieldObj(field);
//}



//是否在网页中存在相应的控件
ValidationFramework.getWebFormFieldObj = function(field) {
	var obj = null;
	if (ValidationFramework.currentForm != null) {
		var formObj = document.getElementById(ValidationFramework.currentForm.getName());
		obj = formObj[field.getName()];
		if (typeof(obj) == 'undefined') {
			obj = null;
		}
	}
	if (obj == null) {
		ValidationFramework.exception("在配置文件中有需要验证的域，但在实际网页表单中不存在：[name=" + field.getName() + "]。");
	}
	return obj;
}

//是否在网页中存在相应的控件根据控件名称
ValidationFramework.getWebFormFieldObjByName= function(controlName) {
	var obj = null;
	if (ValidationFramework.currentForm != null) {
		var formObj = document.getElementById(ValidationFramework.currentForm.getName());
		obj = formObj[controlName];
		if (typeof(obj) == 'undefined') {
			obj = null;
		}
	}
	if (obj == null) {
		ValidationFramework.exception("在配置文件中有需要验证的域，但在实际网页表单中不存在：[name=" + field.getName() + "]。");
	}
	return obj;
}
ValidationFramework.getIntegerValue = function(val) {
	var intvalue = parseInt(val);
	if (isNaN(intvalue)) {
		ValidationFramework.exception("期待一个整型参数。");
	}
	return intvalue;
}
ValidationFramework.getFloatValue = function(val) {
	var floatvalue = parseFloat(val);
	if (isNaN(floatvalue)) {
		ValidationFramework.exception("期待一个浮点型参数。");
	}
	return floatvalue;
}

ValidationFramework.exception = function(str) {
	var ex = "JavaScript  运行时错误:\n\n";
	ex += str;
	ex += "\n\n\n任何运行错误都会导致该域验证失败。";
	alert(ex);
}


 
 
 ValidationFramework.getDocumentElement = function(formXml,moduleName) 
 {
    var file=null;
    if(moduleName=='')
    {
       file = ValidationRoot +formXml+".xml";
    }
    else
    {
       file = ValidationRoot + moduleName+"/"+formXml+".xml";
    }
	if(DocumentElementValidationRoot==null)
	{
		var xmlDoc = XmlDocument.create();
		xmlDoc.async = false; 
		xmlDoc.load(file);
		if (xmlDoc.documentElement == null) {
			ValidationFramework.exception("配置文件读取错误，请检查。");
			return null;
		}
		var documentFile= xmlDoc.documentElement;
		DocumentElementValidationRoot=documentFile;
		return documentFile;
	}
	return DocumentElementValidationRoot;
}


	
	






 
