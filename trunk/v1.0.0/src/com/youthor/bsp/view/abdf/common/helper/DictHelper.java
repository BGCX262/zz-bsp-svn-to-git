package com.youthor.bsp.view.abdf.common.helper;

import java.io.File;
import java.io.FileInputStream;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Dict;
import com.youthor.bsp.core.abdf.model.DictType;
import com.youthor.bsp.core.abdf.model.DynamiDict;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;

public class DictHelper {
    
    public static String CodeToName(String dictType,String defaultValue,String dynamic,String valueType,HttpServletRequest request) throws Exception
    {
        if (dynamic!=null && dynamic.equalsIgnoreCase("Y")) {
            return CodeToName(dictType,defaultValue,true,valueType,request);
        }
        else {
            return CodeToName(dictType,defaultValue,false,valueType,request);
        }
    }
    public static String CodeToName(String dictType,String defaultValue,boolean dynamic,String valueType,HttpServletRequest request) throws Exception
    {
         String returnValue="";
         String [] defaultValueArr=StringHelper.split(defaultValue,",");
         List list=new ArrayList();
        if(dynamic)
        {
            Map map=(Map)request.getAttribute(Constants.GLOBAL_DYNAMIC_DICT_DATA);
            if(map==null||map.isEmpty())
            {
                 map=new HashMap();
                 IDictDynamic dictDynamic = setDynamicDictToApplication(dictType, request); 
                 if(dictDynamic!=null)
                 {
                     
                     list=dictDynamic.execute(request);
                 }
                 else
                 {
                    Map mapDict= AbdfCache.mapDictTypeDynami; 
                    list=((DynamiDict)mapDict.get(dictType)).getDataItem();
                 }
                 map.put(dictType,list);
                 request.setAttribute(Constants.GLOBAL_DYNAMIC_DICT_DATA,map);
            }
            else
            {
                 list=(List)map.get(dictType);
                if(list==null)
                {
                     IDictDynamic dictDynamic = setDynamicDictToApplication(dictType, request); 
                     if(dictDynamic!=null)
                     {
                         
                         list=dictDynamic.execute(request);
                     }
                     else
                     {
                         Map mapDict= AbdfCache.mapDictTypeDynami; 
                        list=((DynamiDict)mapDict.get(dictType)).getDataItem();
                     }
                     map.put(dictType,list);
                     request.setAttribute(Constants.GLOBAL_DYNAMIC_DICT_DATA,map);
                }
            }
            
        }
        else //当为字典数据库时
        {
            list = DictHelper.getDictData(dictType,valueType,request); 
        }
        if(list!=null&&list.size()>0)
         {
             for(int i=0;i<list.size();i++)
             {
                 Item item=(Item)list.get(i);
                 String dictionaryValue=item.getKey();
                 String dictionaryName=item.getValue();
                    for(int j=0;j<defaultValueArr.length;j++)
                    {
                        if(defaultValueArr[j].equals(dictionaryValue))
                        {
                            returnValue=returnValue+dictionaryName+",";
                        }    
                    }
                }      
             }
         if(returnValue!=null&&returnValue.endsWith(","))
         {
             returnValue=returnValue.substring(0,returnValue.length()-1);
         }
        return returnValue;
    }
    
    public static IDictDynamic setDynamicDictToApplication(String dictType, HttpServletRequest request) throws Exception {
        Map map=(Map)request.getSession().getServletContext().getAttribute(Constants.GLOBAL_DYNAMIC_DICT);
         if(map==null)
         {
             map=new HashMap(); 
             String realPath=request.getSession().getServletContext().getRealPath("/WEB-INF/classes/dict/dynamic.xml");
             File file=new File(realPath);
             java.io.InputStream xmlDocInput = new FileInputStream(file);
             SAXBuilder saxBuilder = new SAXBuilder();
             Document xmlMapDoc = saxBuilder.build(xmlDocInput);
                 Element root = xmlMapDoc.getRootElement();
                 List xmlList=root.getChildren();
                 for(int j=0;j<xmlList.size();j++)
                 {
                     Element e = (Element)xmlList.get(j);
                     DynamiDict dynamiDict=new DynamiDict();
                     dynamiDict.setCode(e.getAttributeValue("code"));
                     dynamiDict.setName(e.getAttributeValue("name"));
                     dynamiDict.setType(e.getAttributeValue("type"));
                     if(e.getAttributeValue("type").equals("0"))
                     {
                         
                         List itemList=e.getChildren();
                         if(itemList==null||itemList.isEmpty())
                         {
                             System.out.println("数据字典:"+e.getAttributeValue("name")+"没有配置数据项。");
                         }
                         else
                         {
                             for(int i=0;i<itemList.size();i++)
                             {
                                 Element eItem = (Element)itemList.get(i);
                                 Item item=new Item();
                                 item.setKey(eItem.getAttributeValue("value"));
                                 item.setValue(eItem.getAttributeValue("text"));
                                 dynamiDict.getDataItem().add(item);
                             }
                             
                         }
                     }
                     
                     map.put(dynamiDict.getCode(),dynamiDict);
                 }
                 AbdfCache.mapDictTypeDynami=map; 
         }
        
         DynamiDict dynamiDict=(DynamiDict)map.get(dictType);
         if(dynamiDict.getType().equals("0"))
             return null;
         Class classDynamiDict = DropDownHtmlHelper.class.getClassLoader().loadClass(dynamiDict.getType());
        
         IDictDynamic dictDynamic = (IDictDynamic)classDynamiDict.newInstance();
        return dictDynamic;
    }

    public static List getDictData(String dictTypeCode,String valueType, HttpServletRequest request) {
        List dictList=(List)AbdfCache.mapDictTypeData.get(dictTypeCode);
        DictType dictTypeObj=(DictType)AbdfCache.mapDictType.get(dictTypeCode);
        if(dictList!=null&&!dictList.isEmpty())
        {
            return dictList;
        }
        else
        {
             dictList=new ArrayList();
             IAbdfServiceFacade abdfServiceFacade=(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
             String gsId=WebHelper.getTopOrgId(request.getSession(),Constants.GLOBAL_GS);
             if(dictTypeObj==null)
             {
                 dictTypeObj=abdfServiceFacade.getDictTyeByComIdCode(gsId,dictTypeCode);
                 AbdfCache.mapDictType.put(dictTypeCode,dictTypeObj);
             }
             List listOriData=abdfServiceFacade.getDictByDictTypeId(dictTypeObj.getDictTypeId());
             if(listOriData==null||listOriData.isEmpty()) return new ArrayList();
             for(int i=0;i<listOriData.size();i++)
             {
                 Dict dict=(Dict)listOriData.get(i);
                 Item item=new Item();
                 item.setValue(dict.getDictValue());
                 if(valueType.equals("id"))
                 {
                     item.setKey(dict.getDictId());
                 }
                 else
                 {
                     item.setKey(dict.getDictAlias());
                 }
                 item.setIsUse(dict.getIsUse());
                 dictList.add(item);
             }
             return dictList;
        }
        
    }

}
