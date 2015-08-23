
package com.youthor.bsp.view.abdf.common.base;


import java.util.Date;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.log4j.Logger;
import org.springframework.web.struts.MappingDispatchActionSupport;

import com.youthor.bsp.core.abdf.common.conveter.CurrencyConvert;
import com.youthor.bsp.core.abdf.common.conveter.DateConvert;
import com.youthor.bsp.core.abdf.common.helper.ObjectHelper;





public class BaseStrutsAction extends MappingDispatchActionSupport{
  protected Logger logger = Logger.getLogger(getClass());
    protected Object modelToForm(Object srcObject,String targetClassName)
    {
        return ObjectHelper.objectCopy(srcObject,targetClassName);
    }
    
    
    protected Object formToModel(Object srcObject,String targetClassName)
    {
        return ObjectHelper.objectCopy(srcObject,targetClassName);
    }
    
    protected Object modelToModel(Object srcObject,String targetClassName)
    {
        return ObjectHelper.objectCopy(srcObject,targetClassName);
    }
    
    
}
