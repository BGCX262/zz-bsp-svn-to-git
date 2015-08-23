package com.youthor.bsp.view.abdf.common.plugin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.Url;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;

public class InitURLDataPlugIn implements PlugIn{
   private String urlPath;

    public String getUrlPath() {
        return urlPath;
    }
    
    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath;
    }
    
    public void init(ActionServlet servlet, ModuleConfig arg1) throws ServletException {
        String urlRealPath = servlet.getServletContext().getRealPath(this.urlPath);
        File file = new File(urlRealPath);
        File [] files = file.listFiles();
        Map map = new HashMap();
        if(files!=null && files.length>0) {
            for(int i =0;i<files.length;i++) {
                File subFile = files[i];
                String fileName = subFile.getName();
                
                String [] names = StringHelper.split(fileName, ".");
                if(names.length == 1) continue;
                if(names.length==2 && names[1]!=null && !names[1].equals("") && !names[1].equals("xml")) continue;
                if(names.length>2) continue;
                if(subFile.isDirectory()) continue;
                java.io.InputStream xmlDocInput = null;
                try {
                    xmlDocInput = new FileInputStream(subFile);
                } catch (FileNotFoundException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
                 SAXBuilder saxBuilder = new SAXBuilder();
                 Document xmlMapDoc= null;
                try {
                    xmlMapDoc = saxBuilder.build(xmlDocInput);
                } catch (JDOMException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                } catch (IOException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
                     Element root = xmlMapDoc.getRootElement();
                     List xmlList=root.getChildren();
                     for(int j=0;j<xmlList.size();j++)
                     {
                        Element e = (Element)xmlList.get(j);
                        Url url = new Url();
                        url.setHref(e.getAttributeValue("href"));
                        url.setName(e.getAttributeValue("name"));
                        String isOftenUse = e.getAttributeValue("isOftenUse");
                        if(isOftenUse.equals("true")) {
                            url.setOftenUse(true);
                        }
                        else {
                            url.setOftenUse(false);
                        }
                        
                        String isPublic = e.getAttributeValue("isPublic");
                        if(isPublic.equals("true")) {
                            url.setIsPublic(true);
                        }
                        else {
                            url.setIsPublic(false);
                        }
                        String needLogData = e.getAttributeValue("needLogData");
                        if(needLogData.equals("true")) {
                            url.setNeedLogData(true);
                        }
                        else {
                            url.setNeedLogData(false);
                        }
                        String isLog = e.getAttributeValue("isLog");
                        if(isLog.equals("true")) {
                            url.setIsLog(true);
                        }
                        else {
                            url.setIsLog(false);
                        }
                        
                        String alertTime = e.getAttributeValue("alertTime");
                        if(alertTime!=null && !alertTime.equals("")) {
                            url.setAlertTime(Integer.parseInt(alertTime));
                        }
                        map.put(url.getHref(), url);
                     }
                    
            
            }
             AbdfCache.mapURLData=map; 
        }
        
    }

    
    public void destroy() {
         AbdfCache.mapURLData.clear();
         AbdfCache.mapURLData = null;
    }
}
