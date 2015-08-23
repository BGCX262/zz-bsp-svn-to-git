package com.youthor.bsp.view.abdf.common.base;

import java.util.Date;

import org.apache.struts.action.ActionForm;
import org.apache.commons.beanutils.ConvertUtils;


import com.youthor.bsp.core.abdf.common.conveter.CurrencyConvert;
import com.youthor.bsp.core.abdf.common.conveter.DateConvert;

public class BaseForm extends ActionForm {
    static{
        ConvertUtils.register(new CurrencyConvert(),Double.class);
        ConvertUtils.register(new DateConvert(),Date.class);
    }
    

}
