package com.youthor.bsp.view.abdf.common.helper;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;

public class RadioBoxHtmlHelper {
    public static String getHtmlByDynamic(String dictType, String defaultValue,boolean addBr,String onchange,String onclick,String property,boolean disabled,HttpServletRequest request) throws Exception {
        
        if(dictType==null||dictType.equals("")) return "";
         defaultValue=StringHelper.doWithNull(defaultValue);
         String [] defaultValueArr=StringHelper.split(defaultValue,",");
         IDictDynamic DictDynamic = DictHelper.setDynamicDictToApplication(dictType, request); 
         List list=DictDynamic.execute(request);
        StringBuffer sb=new StringBuffer();
         if(list!=null&&list.size()>0)
         {
             for(int i=0;i<list.size();i++)
             {
                 Item item=(Item)list.get(i);
                 String dictionaryValue=item.getKey();
                 String dictionaryName=item.getValue();
                 Map map=item.getExtendPara();
                 Set set=map.keySet();
                 Iterator iterator=set.iterator();
                 String extraProperty="";
                 while(iterator.hasNext())
                 {
                     String keyValue=(String)iterator.next();
                     extraProperty=extraProperty+keyValue+"=\""+StringHelper.doWithNull(map.get(keyValue))+"\" ";
                 }
                 String checked="";
                for(int j=0;j<defaultValueArr.length;j++)
                {
                    if(defaultValueArr[j].equals(dictionaryValue))
                    {
                        checked=" checked";
                        break;
                    }
                }
                String disabledStr="";
                if(disabled)
                    disabledStr=" disabled='true'";
                 sb.append("<input type='radio' "+checked+" "+disabledStr+" name='"+property+"' "+extraProperty+" value='"+dictionaryValue+"'");
                 if(onchange!=null&&!onchange.equals(""))
                 {
                     sb.append(" onchange=\""+onchange+"\" "); 
                 }
                 if(onclick!=null&&!onclick.equals(""))
                 {
                     sb.append(" onclick=\""+onclick+"\" ");  
                 }
                 
                 sb.append("/>"+dictionaryName+"&nbsp;&nbsp;"); 
                 if(addBr)
                     sb.append("<br>");  
                 checked="";
             }
         }
        return sb.toString();
    }

    public static String getHtmlByDict(String dictType,String valueType ,String defaultValue,boolean addBr,String onchange,String onclick,String property,boolean disabled,HttpServletRequest request) {
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
                 String checked="";
                 for(int j=0;j<defaultValueArr.length;j++)
                    {
                        if(defaultValueArr[j].equals(dictionaryValue))
                        {
                            checked=" checked";
                            break;
                        }
                    }
                    String disabledStr="";
                    if(disabled)
                        disabledStr=" disabled='true'";
                     sb.append("<input type='radio' "+checked+" "+disabledStr+" name='"+property+"' "+extraProperty+" value='"+dictionaryValue+"'");
                     if(onchange!=null&&!onchange.equals(""))
                     {
                         sb.append(" onchange=\""+onchange+"\" "); 
                     }
                     if(onclick!=null&&!onclick.equals(""))
                     {
                         sb.append(" onclick=\""+onclick+"\" ");  
                     }
                     
                     sb.append("/>"+dictionaryName+"&nbsp;&nbsp;"); 
                     if(addBr)
                         sb.append("<br>");  
                     checked="";
             }
         }
        return sb.toString();
    }
}
