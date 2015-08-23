package com.youthor.bsp.core.abdf.common.conveter;

import java.text.SimpleDateFormat;
import org.apache.commons.beanutils.Converter;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import java.text.ParseException;


public class DateConvert implements Converter {

    private static SimpleDateFormat df = new SimpleDateFormat();
    
   
    private static Set patterns = new HashSet();
    static{
         patterns.add("yyyy-MM-dd HH:mm:ss");
        patterns.add("yyyy-MM-dd");
        patterns.add("yyyy-MM-dd HH:mm");
       
        patterns.add("yyyy/MM/dd HH:mm:ss");
    }
    
  
    public DateConvert() {
        super();
    }
    
   
    public Object convert(Class type,Object value){
        if(value == null){
            return null;
        }else if(value instanceof String){
            Object dateObj = null;
            Iterator it = patterns.iterator();
            while(it.hasNext()){
                try{
                    String pattern = (String)it.next();
                    df.applyPattern(pattern);
                    dateObj = df.parse((String)value);
                    break;
                }catch(ParseException ex){
                    //ex.printStackTrace();
                }
            }
            return dateObj;
        }else{
            return null;
        }
    }
}
