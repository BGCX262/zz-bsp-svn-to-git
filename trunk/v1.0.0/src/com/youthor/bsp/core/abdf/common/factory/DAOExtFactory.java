package com.youthor.bsp.core.abdf.common.factory;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.youthor.bsp.core.abdf.ext.IDAOExt;
import com.youthor.bsp.core.abdf.model.Item;


public class DAOExtFactory {
    private DAOExtFactory(){}
    private static DAOExtFactory daoExtFactory = null;
    private static Map daoMap = new HashMap();
    public static synchronized  DAOExtFactory getInstance() {
        if (daoExtFactory == null) {
            daoExtFactory = new DAOExtFactory();
        }
        return daoExtFactory;
    }
    
    public  IDAOExt getDaoExtInstance(String code)  {
        reLoadDaoExt();
        try {
         Item item=(Item)daoMap.get(code);
         if (item == null ) return null;
         Class classDaoExt = DAOExtFactory.class.getClassLoader().loadClass(item.getValue());
         return (IDAOExt)classDaoExt.newInstance();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        
        }
        return null;
        
    }
    
    public static void reLoadDaoExt()
    {
        try {
            if (daoMap!=null) daoMap.clear();
            Resource template =  new ClassPathResource("com/fe/bsp/core/abdf/common/factory/abdf_dao_ext.xml");
            java.io.InputStream xmlDocInput = template.getInputStream();
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
                daoMap.put(item.getKey(),item);
            }
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public static void main(String [] arg ) {
        System.out.println(DAOExtFactory.getInstance().getDaoExtInstance("extText").getClass().getName());
    }
}
