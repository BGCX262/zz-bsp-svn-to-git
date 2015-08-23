package com.youthor.bsp.core.abdf.common.helper;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;



public class SystemPrintHelper {
    
public static void printMap(Map map) {    
        
    Set set=map.keySet();
    Iterator iterator=set.iterator();
    while(iterator.hasNext())
    {
        String key=(String)iterator.next();
        System.out.println("key===="+key+" value===="+((String[])map.get(key))[0]);
       }
    }


   
}
