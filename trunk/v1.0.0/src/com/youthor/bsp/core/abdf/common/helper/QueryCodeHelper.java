package com.youthor.bsp.core.abdf.common.helper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class QueryCodeHelper {
    private static Map chineseMap= new HashMap();;
    public static Map getChineseMap() {
        return chineseMap;
    }
    private static  void initMap()
    {
       
        if(chineseMap.isEmpty())
        {
            try {
            SAXBuilder saxBuilder_OrgMap = new SAXBuilder();
              ClassLoader loader = QueryCodeHelper.class.getClassLoader();
            java.io.InputStream uimsMapDocInput = loader.getResourceAsStream("chinese.xml");
             Document orgMapDoc = saxBuilder_OrgMap.build(uimsMapDocInput);
             Element root = orgMapDoc.getRootElement();
            
                 List chEnList=root.getChildren();
                 for(int j=0;j<chEnList.size();j++)
                 {
                     Element e = (Element)chEnList.get(j);
                     String chinese=e.getAttributeValue("chinese");
                     String english=e.getAttributeValue("english");
                     chineseMap.put(chinese,english);
                 }
                
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        
        }
    }
    
    
    public static String getQueryCode(String chineseChar)
    {
        initMap();
        if(chineseChar==null||chineseChar.equals("")) return "";
        String [] strArr=chineseChar.split("");
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<strArr.length;i++)
        {
            if(strArr[i]!=null&&!strArr.equals(""))
            {
                String en=(String)chineseMap.get(strArr[i]);
                if(en==null||en.equals(""))
                {
                    sb.append(strArr[i]);
                }
                else
                {
                    en=en.toUpperCase();
                    sb.append(en);
                }
            }
        }
        return sb.toString();
    }

    public static void main(String [] args)
    {
        long l1=System.currentTimeMillis();
        initMap();
        System.out.println("queryCode==="+getQueryCode("刘正仁，你在做什么"));
        long l2=System.currentTimeMillis();
        System.out.println(l2-l1);
    }
}
