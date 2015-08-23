package com.youthor.bsp.view.abdf.common.helper;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import com.youthor.bsp.core.abdf.common.helper.DateHelper;

public class BuildListFormPage {
    
    public static List buildSimpleList(Class cls,HttpServletRequest request) {
        //得到类的属性
        List returnList=new ArrayList();
        try
        {
         
         Object objectUseGetField= cls.newInstance(); 
         Field[] fields = objectUseGetField.getClass().getDeclaredFields(); 
         String type1=fields[0].getType().getName();  
         if(!type1.equals("java.lang.String"))
         {
             System.out.println("组装的list中model的第一个属性的数据类型必须不字符串,现在第一个类型为:"+type1+",系统不予组装");
             return returnList;
         }
         String [] arr1=request.getParameterValues(fields[0].getName());
         if(arr1==null||arr1.length==0)
         {
             System.out.println("要组装的页面没有'"+fields[0].getName()+"'的域，系统不予组装");
             return returnList;
         }
        
         for(int i=0;i<arr1.length;i++)
         {
             System.out.println("arr1=="+arr1[i]);
             Object objectModel= cls.newInstance(); 
             for(int ii=0;ii<fields.length;ii++)
             {
                 String [] arrRequest=request.getParameterValues(fields[ii].getName());
                 //第一：页面上的任任一个都等于第一个的长度，且长度要>0
                 //model中第一个属性经常放数据库id与其对应的属性
                 if(arrRequest!=null&&arrRequest.length>0&&arrRequest.length==arr1.length)
                 {
                     Object value=arrRequest[i];
                     if(fields[ii].getType().getName().equals("int"))
                     {
                         value=new Integer(arrRequest[i]);
                     }
                     if(fields[ii].getType().getName().equals("float"))
                     {
                         value=new Float(arrRequest[i]);
                     }
                     else if(fields[ii].getType().getName().equals("java.util.Date"))
                     {
                         value= DateHelper.converStrToDate(arrRequest[i]);
                     }
                    BeanUtils.setProperty(objectModel,fields[ii].getName(),arrRequest[i]);
                 }
             }
             returnList.add(objectModel);
         }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return returnList;
        
    }
        
}
