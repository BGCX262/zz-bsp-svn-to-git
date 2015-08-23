//????

function ValidateMethodFactory() {}
ValidateMethodFactory.methods = [];
//???????. false ?????
ValidateMethodFactory.validateHelpMethod=function(field,fevf)
{
  
    if(field.getFevf()!=null&&ValidationFramework.getIntegerValue(field.getFevf())>fevf)
       return false
     //??????????????????????   begin
    
     if(field.getFire()!=null)
     {
        if(field.getValue()=='any')
        {
           true;
        }
         var dependObj=ValidationFramework.getWebFormFieldObjByName(field.getFire().trim())
         if (dependObj.type == "checkbox" || dependObj.type == "radio") {
            if(dependObj.checked)
            {
                return (dependObj.value.trim()==field.getValue().trim())
            }
          } else {
            return (dependObj.value.trim() == field.getValue().trim());
         }
     }
     return true;
}
//???????????
ValidateMethodFactory.validateDoubleRange = function(obj, params,fevf) {
    //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    if (obj.value.trim()== "") return true;
    
    var p0 = 0;
    if(params[0].page=="false")
    {
      p0 = ValidationFramework.getFloatValue(params[0].value);
    }
    else if(params[0].page=="true")
    {
        var childValue=ValidationFramework.getWebFormFieldObjByName(params[0].value.trim()).value
        if(childValue.trim()=="") return true;
        p0 = ValidationFramework.getFloatValue(childValue);
    }

    var p1 = 0;
    if(params[1].page=="false")
    {
      p1 = ValidationFramework.getFloatValue(params[1].value);
    }
    else if(params[1].page=="true")
    {
        var childValue=ValidationFramework.getWebFormFieldObjByName(params[1].value.trim()).value
        if(childValue.trim()=="") return true;
        p1 = ValidationFramework.getFloatValue(childValue);
    }

    if (ValidateMethodFactory.validateInteger(field) || ValidateMethodFactory.validateDouble(field)) {
        var v = parseFloat(obj.value);
        return (v >= p0 && v <= p1);
    } else {
        return false;
    }
    return true;
}
//??????????
ValidateMethodFactory.validateIntegerRange = function(obj, params,fevf) {
   //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    if (obj.value.trim()== "") return true;
    
    var p0 =0;
    if(params[0].page=="false")
    {
      p0 = ValidationFramework.getIntegerValue(params[0].value);
    }
    else if(params[0].page=="true")
    {
        var childValue=ValidationFramework.getWebFormFieldObjByName(params[0].value.trim()).value
        if(childValue.trim()=="") return true;
        p0 = ValidationFramework.getIntegerValue(childValue);
    }
    var p1 = 0;
    if(params[1].page=="false")
    {
      p1 = ValidationFramework.getIntegerValue(params[0].value);
    }
    else if(params[1].page=="true")
    {
        var childValue=ValidationFramework.getWebFormFieldObjByName(params[1].value.trim()).value
        if(childValue.trim()=="") return true;
        p1 = ValidationFramework.getIntegerValue(childValue);
    }
    if (ValidateMethodFactory.validateInteger(field)) {
        var v = parseInt(obj.value);
        return (v >= p0 && v <= p1);
    } else {
        return false;
    }
    return true;
}

//??????
ValidateMethodFactory.validateMinLength = function(obj, params,fevf) {
//if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    
    var v=0;
    if(params[0].page=="false")
    {
      v = ValidationFramework.getIntegerValue(params[0].value);
    }
    else if(params[0].page=="true")
    {
        var childValue=ValidationFramework.getWebFormFieldObjByName(params[0].value.trim()).value
        if(childValue.trim()=="") return true;
        v = ValidationFramework.getIntegerValue(childValue);
    }
    
    return (obj.value.trim().length >= v);
}

ValidateMethodFactory.validateMinLength = function(obj, params,fevf) {
   //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    
    var v=0;
    if(params[0].page=="false")
    {
      v = ValidationFramework.getIntegerValue(params[0].value);
    }
    else if(params[0].page=="true")
    {
        var childValue=ValidationFramework.getWebFormFieldObjByName(params[0].value.trim()).value
        if(childValue.trim()=="") return true;
        v = ValidationFramework.getIntegerValue(childValue);
    }
    
    return (obj.value.trim().length <= v);
}


//????
ValidateMethodFactory.validateEqulas = function(obj, params,fevf) {
//if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    var objValue=obj.value.trim();
    if (objValue == "") return true;
    
    if(params==null) return false;
    var returnVaue=true;
    for(var i=0;i<params.length;i++)
    {
        if(params[i].page=="false")
        {
            returnVaue=objValue==params[i].value;
        }
        else if(params[i].page=="true")
        {
            
            returnVaue=objValue==ValidationFramework.getWebFormFieldObjByName(params[i].value.trim()).value;
        }
    }
    return returnVaue;
}

//???????
ValidateMethodFactory.validateChar = function(obj, params,fevf) {
    //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    if (obj.value.trim() == "") return true;
    
    var exp = new RegExp("^[A-Za-z0-9_]*$");
    return exp.test(obj.value);
}

//????
ValidateMethodFactory.validateChineseChar=function(obj, params,fevf)
{
    //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);    
    if (obj == null) return false;
    if (obj.value.trim() == "") return true;
    
    var exp = new RegExp("^[\u4E00-\u9FA5\uF900-\uFA2D]*$");
    return exp.test(obj.value);
}
//??email
ValidateMethodFactory.validateEmail=function(obj, params,fevf)
{
    //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);    
    if (obj == null) return false;
    if (obj.value.trim() == "") return true;
    
    var str=obj.value.trim();
    if (str.charAt(0) == "." || str.charAt(0) == "@" || str.indexOf('@', 0) == -1
        || str.indexOf('.', 0) == -1 || str.lastIndexOf("@") == str.length-1 || str.lastIndexOf(".") == str.length-1)
        return false;
    else
        return true;
     
}
//???????
ValidateMethodFactory.validateRequired = function(obj, params,fevf) {
    
//if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
//var obj = ValidationFramework.getWebFormFieldObj(field);    
    if (obj == null) return false;
    if (typeof(obj.type) == "undefined") {
        var tmp = 0;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked) {
                return true;
            }
        }
        return false;
    }
    //????????????????(????)
    
    if (obj.type == "checkbox" || obj.type == "radio") {
        return (obj.checked);
    } else {
        
        return !(obj.value.trim() == "");
    }
}

ValidateMethodFactory.validateInteger=function(obj, params,fevf)
{
   //if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    
    if (obj == null) return false;
    if (obj.value.trim() == "") return true;
    
    var exp = new RegExp("^-?\\d+$");
    return exp.test(obj.value);
}

ValidateMethodFactory.validateDouble = function(obj, params,fevf) {
//if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
    //var obj = ValidationFramework.getWebFormFieldObj(field);
    if (obj == null) return false;
    if (obj.value.trim() == "") return true;
    
    if(!ValidateMethodFactory.validateInteger(obj, params,fevf))
    {
        var exp = new RegExp("^-?\\d+\.\\d+$");
        return exp.test(obj.value);
    }
    else
    {
        return true;
    }
} 
ValidateMethodFactory.validateDate = function(obj, params,fevf) 
{
  // if(!ValidateMethodFactory.validateHelpMethod(field,fevf)) return true;
   //var obj = ValidationFramework.getWebFormFieldObj(field);
   var str=obj.value
   
    //??????????
    if(str.trim() == "")
        return true;
    var pattern = /^((\d{4})|(\d{2}))-(\d{1,2})-(\d{1,2})$/g;
    if(!pattern.test(str))
        return false;
    var arrDate = str.split("-");
    if(parseInt(arrDate[0],10) < 100)
        arrDate[0] = 2000 + parseInt(arrDate[0],10) + "";
    var date =  new Date(arrDate[0],(parseInt(arrDate[1],10) -1)+"",arrDate[2]);
    if(date.getYear() == arrDate[0]
       && date.getMonth() == (parseInt(arrDate[1],10) -1)+""
       && date.getDate() == arrDate[2])
        return true;
    else
        return false;
   
}