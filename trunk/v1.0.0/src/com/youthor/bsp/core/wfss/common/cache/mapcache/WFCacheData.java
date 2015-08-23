package com.youthor.bsp.core.wfss.common.cache.mapcache;


import java.util.HashMap;
import java.util.Map;

public class WFCacheData {
    
    //所有流程缓存(map形式) map中key值为流程的id
    public static Map mapProcessId=new HashMap();
   //所有流程缓存(map形式) map中key值为流程的编号
    public static Map mapProcessAlias=new HashMap();
    
    
  
    //所有环节缓存(map形式) map中key值为环节的id
    public static Map mapActivityId=new HashMap();
    
//    所有环节缓存(map形式) map中key值为流程的Alias+"_"+环节Alias
    public static Map mapActivityAlias=new HashMap();
    
    
       //所有环节以路由流程id为key的map
    public static Map mapActivityProcessId=new HashMap();
  
   //表单字段以表单id为key缓存
    public static Map mapAppFormFieldAppFormId=new HashMap();
    
    //业务表单以表单id为key缓存
    public static Map mapAppFormId=new HashMap();
    
    
    
   //所有工作流扩展接口缓存
    public static Map mapWfExt=new HashMap();
    
    //所有路由以路由id为key的map
    public static Map mapRouteId=new HashMap();
    
   //所有路由以路由环节id为key的map
    public static Map mapRouteActivityId=new HashMap();
    
    //所有流程按钮对象，以code作为key
    public static Map mapButton=new HashMap();
    
    //以orgId为key的agent对象
    public static Map mapAgent=new HashMap();
    
    
}
