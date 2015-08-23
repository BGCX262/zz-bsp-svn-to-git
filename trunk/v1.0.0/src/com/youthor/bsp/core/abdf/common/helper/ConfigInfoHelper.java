package com.youthor.bsp.core.abdf.common.helper;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import com.youthor.bsp.core.abdf.model.SystemConf;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;

public class ConfigInfoHelper implements java.io.Serializable{
    
    private static final long serialVersionUID = -291996993288028782L;
    private static Properties configInfoProps= null;
    public static Properties getConfigInfoProps() {
        return configInfoProps;
    }
    /**
     * �õ���Դ�ļ���ĳһ���ֵ
     * @param name
     * @return String
     */
    public static  String getProperty(String name)
    {
        String retrunValue="";
        if(configInfoProps!=null)
        {
            retrunValue=(String)configInfoProps.getProperty(name);
            
        }
        else
        {
              //ClassLoader loader = ConfigInfoHelper.class.getClassLoader();
              //InputStream web_confInput = loader.getResourceAsStream("web_conf.properties"); 
            IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
            List list = abdfServiceFacade.getAllSystemConf();
            ConfigInfoHelper.configInfoProps=new Properties();
            for(int i = 0; i < list.size(); i++){
                SystemConf systemConf =(SystemConf)list.get(i);
                ConfigInfoHelper.configInfoProps.put(systemConf.getKey(), systemConf.getValue());
            }
           retrunValue=(String)configInfoProps.getProperty(name);
        }
        return retrunValue;
    }
    

}
