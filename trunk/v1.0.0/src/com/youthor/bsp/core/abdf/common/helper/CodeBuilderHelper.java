package com.youthor.bsp.core.abdf.common.helper;

public class CodeBuilderHelper {
    
    public static String formatToModleProperty(String field)
    {
         StringBuffer sb=new StringBuffer();
         String [] fieldSplits=StringHelper.split(field,"_");
         sb.append(fieldSplits[0].toLowerCase());
         if(fieldSplits.length>1)
         {
            for(int i=1;i<fieldSplits.length;i++)
            {
                String temp=fieldSplits[i].toLowerCase();
                sb.append(StringHelper.changeFirstToUpper(temp));
            }
         }
         return sb.toString();
    }
 
    public static String changeDataTypeToJava(String dataType)
    {
        if(dataType==null||dataType.equals(""))
         return "string";
        if(dataType.equalsIgnoreCase("VARCHAR2"))
        {
            return "string";
        }
        if(dataType.equalsIgnoreCase("DATE"))
        {
            return "java.util.Date";
        }
        if(dataType.equalsIgnoreCase("NUMBER"))
        {
            return "float";
        }
        
        return "string";
    }
}
