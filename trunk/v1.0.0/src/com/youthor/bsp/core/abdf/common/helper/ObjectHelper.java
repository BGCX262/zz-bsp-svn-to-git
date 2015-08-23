

package com.youthor.bsp.core.abdf.common.helper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import org.apache.commons.beanutils.PropertyUtils;

public class ObjectHelper {

    public  static Object getMethodValue(String property,Object object) 
    {
         Field[] fields = object.getClass().getDeclaredFields(); 
         Object valueObject=null;
         for(int j=0;j<fields.length;j++)
         {
             if (fields[j].getName().equals(property))
             {
                 String firstChar = fields[j].getName().substring(0, 1);
                 String leaveChar = fields[j].getName().substring(1);
                 String methodName = firstChar.toUpperCase() + leaveChar; 
                 
                 try{
                 Method meth = object.getClass().getMethod("get" +
                         methodName, null);
                  valueObject=meth.invoke(object, null);
                 }catch(Exception ex)
                 {
                     ex.printStackTrace();
                 }
                 break;
             } 
         }
         return valueObject;
    }
    
    public  static Object getMethodValueForRecursion(String property,Object object) {
        if(property == null || object == null){
            return null;
        }
        if(property.indexOf(".") == -1){
            return getMethodValue(property,object);
        }
        else{
            String theFirstProperty = property.substring(0,property.indexOf("."));
            String theSecondProperty = property.substring(property.indexOf(".") + 1);
            
            Object firstObj = getMethodValue(theFirstProperty,object);
            return getMethodValueForRecursion(theSecondProperty,firstObj);
            
        }
    }
    

    public static Object objectCopy(Object srcObject,String targetClassName)
    {
        Object targetObject = null;
        if ((srcObject == null) || (targetClassName == null)) {
            return null;
        }
        if (srcObject instanceof Collection) {
            Iterator iter = ((Collection) srcObject).iterator();
            Collection coll = new ArrayList();
            Object item = null;
            Object targetItem = null;
            while (iter.hasNext()) {
                item = iter.next();
                targetItem = _objectCopy(item, targetClassName);
                coll.add(targetItem);
            }
            targetObject = coll;
        } else {
            targetObject = _objectCopy(srcObject, targetClassName);
        }
        return targetObject;
    }

    
    private  static  Object _objectCopy(Object srcObject,String targetClassName)
    {
            Class targetClass=null;
            Object targetObject=null;
            try {
                targetClass = Class.forName(targetClassName);
                targetObject = targetClass.newInstance();
                PropertyUtils.copyProperties(targetObject,srcObject);
            } catch (Exception e) {
                e.printStackTrace();
            }
        return  targetObject;
    }

    
     /**
     * ���ַ�����ת�г���Ӧsql in������ַ�.
     * @param strArr Դ����,srcObjectֻ���ǵ������Ͷ���
     * @return String
     * ��:<br>
     *   conn.setAutoCommit(false);<br>
         st = conn.createStatement();<br>
         <font color='red'>String strIds=ObjectHelper.strArroStringSQL(dictId);</font><br>
         String update="UPDATE SYS_DICTIONARY_TYPE SET DEL_FLAG='Y' WHERE DICTIONARY_TYPE_ID IN("+strIds+")";<br>
         st.executeUpdate(update);<br>
         conn.commit();<br>
     */
    public static String strArroStringSQL(String [] strArr)
    {
        if(strArr==null||strArr.length==0) return "";
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<strArr.length;i++)
        {
            sb.append("'"+strArr[i]+"',");
        }
        String returnValue=sb.toString();
        returnValue=returnValue.substring(0,returnValue.length()-1);
        return returnValue;
    }

    

}
