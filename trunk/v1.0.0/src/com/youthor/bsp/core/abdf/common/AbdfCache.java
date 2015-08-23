package com.youthor.bsp.core.abdf.common;

import java.util.HashMap;
import java.util.Map;

import com.youthor.bsp.core.urss.model.App;

public class AbdfCache {
    //缓存树型数据字典
    public static Map mapTreeDictType=new HashMap();
    
    public static App app=null;
    
    //缓存平面数据字典
    public static Map mapDictTypeDynami=new HashMap();
    

    //缓存平面数据字典
    public static Map mapDictType=new HashMap();
    
//  缓存平面数据字典
    public static Map mapDictTypeData=new HashMap();
    
    //
    public static Map mapURLData=new HashMap();
    
    //验证URL
    public static Map mapValidationForm=new HashMap();
}
