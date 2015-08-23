package com.youthor.bsp.view.wfss.common.criterion;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.bsp.core.wfss.common.criterion.ICancellationEvent;
import com.youthor.bsp.core.wfss.common.criterion.IReDoEvent;

public class WfExtFactory {
    
    
    public static void setWfExtCache(ServletContext context,String cacheType)  {
        if(cacheType.equals("map"))
        {
            setMapCache(context);
        }
        
    }

    private static void setMapCache(ServletContext context) 
    {
        try
        {
            Map map=WFCacheData.mapWfExt;
             if(map==null||map.isEmpty())
             {
                 map=new HashMap(); 
                 String realPath=context.getRealPath("/WEB-INF/classes/ext/wf_ext.xml");
                 File file=new File(realPath);
                 java.io.InputStream xmlDocInput = new FileInputStream(file);
                 SAXBuilder saxBuilder = new SAXBuilder();
                 Document xmlMapDoc = saxBuilder.build(xmlDocInput);
                     Element root = xmlMapDoc.getRootElement();
                     List xmlList=root.getChildren();
                     for(int j=0;j<xmlList.size();j++)
                     {
                        Element e = (Element)xmlList.get(j);
                        Item item=new Item();
                        item.setKey(e.getAttributeValue("code"));
                        item.setValue(e.getAttributeValue("type"));
                        map.put(item.getKey(),item);
                     }
                     WFCacheData.mapWfExt=map; 
             }
        }catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    

    

    public static Object getFlowEvent(String code) {
         Map map=WFCacheData.mapWfExt;
         Item item=(Item)map.get(code);
         if(item==null) return null;
         Class classCancellationEvent = null;
        try {
            classCancellationEvent = WfExtFactory.class.getClassLoader().loadClass(item.getValue());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         Object object = null;
        try {
            object = classCancellationEvent.newInstance();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         return object;
    }
    
    
}
