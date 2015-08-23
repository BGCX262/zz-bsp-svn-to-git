package com.youthor.bsp.view.abdf.common.helper;


import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;


import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;

import com.youthor.bsp.core.abdf.model.DynamiDict;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;

public class DropDownHtmlHelper {
    
    public static String getHtmlByDynamic(String dictType,String defaultValue,HttpServletRequest request) throws Exception {
        if(dictType==null||dictType.equals("")) return "";
         defaultValue=StringHelper.doWithNull(defaultValue);
         String [] defaultValueArr=StringHelper.split(defaultValue,",");
         IDictDynamic DictDynamic = DictHelper.setDynamicDictToApplication(dictType, request); 
         List list=null;
         if(DictDynamic!=null)
         {
             
             list=DictDynamic.execute(request);
         }
         else
         {
            Map map= AbdfCache.mapDictTypeDynami; 
            list=((DynamiDict)map.get(dictType)).getDataItem();
         }
         StringBuffer sb=new StringBuffer();
         if(list!=null&&list.size()>0)
         {
             for(int i=0;i<list.size();i++)
             {
                 Item item=(Item)list.get(i);
                 String dictionaryValue=item.getKey();
                 String dictionaryName=item.getValue();
                 Map extendPara=item.getExtendPara();
                 Set set=extendPara.keySet();
                 Iterator iterator=set.iterator();
                 String extraProperty="";
                 while(iterator.hasNext())
                 {
                     String keyValue=(String)iterator.next();
                     extraProperty=extraProperty+keyValue+"='"+StringHelper.doWithNull(extendPara.get(keyValue))+"'";
                 }
                 String select="";
                for(int j=0;j<defaultValueArr.length;j++)
                {
                    if(defaultValueArr[j].equals(dictionaryValue))
                    {
                        select=" selected";
                        break;
                    }
                }
                 sb.append("<option value='"+dictionaryValue+"' "+extraProperty+" "+select+">"+dictionaryName+"</option>");
             }
         }
        return sb.toString();
    }

    public static String getHtmlByDict(String dictType,String valueType ,String defaultValue,HttpServletRequest request) {
        if(dictType==null||dictType.equals("")) return "";
         defaultValue=StringHelper.doWithNull(defaultValue);
         String [] defaultValueArr=StringHelper.split(defaultValue,",");
         List list = DictHelper.getDictData(dictType,valueType,request); 
         StringBuffer sb=new StringBuffer();
         if(list!=null&&list.size()>0)
         {
             for(int i=0;i<list.size();i++)
             {
                 Item item=(Item)list.get(i);
                 if(item.getIsUse()!=null&&item.getIsUse().equals("N"))
                     continue;
                 String dictionaryValue=item.getKey();
                 String dictionaryName=item.getValue();
                 Map extendPara=item.getExtendPara();
                 Set set=extendPara.keySet();
                 Iterator iterator=set.iterator();
                 String extraProperty="";
                 while(iterator.hasNext())
                 {
                     String keyValue=(String)iterator.next();
                     extraProperty=extraProperty+keyValue+"='"+StringHelper.doWithNull(extendPara.get(keyValue))+"'";
                 }
                 String select="";
                for(int j=0;j<defaultValueArr.length;j++)
                {
                    if(defaultValueArr[j].equals(dictionaryValue))
                    {
                        select=" selected";
                        break;
                    }
                }
                 sb.append("<option value='"+dictionaryValue+"' "+extraProperty+" "+select+">"+dictionaryName+"</option>");
             }
         }
        return sb.toString();
    }

    

}
