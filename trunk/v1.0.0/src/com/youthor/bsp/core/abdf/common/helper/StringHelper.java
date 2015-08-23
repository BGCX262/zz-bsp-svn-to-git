

package com.youthor.bsp.core.abdf.common.helper;

public class StringHelper {
    public static String doWithNull(Object o) {
        if(o==null) return "";
        else 
        {
            String returnValue=o.toString();
            if(returnValue.equalsIgnoreCase("null")) return "";
            else return returnValue.trim();
        }
        
    }
    
     public static String[] split(String strSource, String strDiv) {
         int arynum = 0, intIdx = 0, intIdex = 0;
         int div_length = strDiv.length();
         if (strSource.compareTo("") != 0) {
                 if (strSource.indexOf(strDiv) != -1) {
                         intIdx = strSource.indexOf(strDiv);
                         for (int intCount = 1; ; intCount++) {
                                 if (strSource.indexOf(strDiv, intIdx + div_length) != -1) {
                                         intIdx = strSource.indexOf(strDiv, intIdx + div_length);
                                         arynum = intCount;
                                 }
                                 else {
                                         arynum += 2;
                                         break;
                                 }
                         }
                 }
                 else {
                         arynum = 1;
                 }
         }
         else {
                 arynum = 0;

         }
         intIdx = 0;
         intIdex = 0;
         String[] returnStr = new String[arynum];

         if (strSource.compareTo("") != 0) {
                 if (strSource.indexOf(strDiv) != -1) {
                         intIdx = (int) strSource.indexOf(strDiv);
                         returnStr[0] = (String) strSource.substring(0, intIdx);
                         for (int intCount = 1; ; intCount++) {
                                 if (strSource.indexOf(strDiv, intIdx + div_length) != -1) {
                                         intIdex = (int) strSource.indexOf(strDiv, intIdx + div_length);
                                         returnStr[intCount] = (String) strSource.substring(intIdx + div_length,
                                                 intIdex);
                                         intIdx = (int) strSource.indexOf(strDiv, intIdx + div_length);
                                 }
                                 else {
                                         returnStr[intCount] = (String) strSource.substring(intIdx + div_length,
                                                 strSource.length());
                                         break;
                                 }
                         }
                 }
                 else {
                         returnStr[0] = (String) strSource.substring(0, strSource.length());
                         return returnStr;
                 }
         }
         else {
                 return returnStr;
         }
         return returnStr;
 }
     
        public  static String[] filterSameString(String [] arr) 
        {
            if(arr==null) return null;
            StringBuffer sb=new StringBuffer();
            for(int i=0;i<arr.length;i++)
            {
                if(arr[i]!=null&&!arr[i].equals(""))
                {
                    if(sb.toString().indexOf(arr[i]+",")>=0||sb.toString().indexOf(","+arr[i])>=0)
                    {
                        
                    }
                    else
                    {
                      sb.append(arr[i]+",");
                    }
                }
            }
            String returnValue=sb.toString();
            if(returnValue.endsWith(",")) returnValue=returnValue.substring(0,returnValue.length()-1);
            String [] arrReturn=split(returnValue,",");
            return arrReturn;
        }
        
     
     
        public  static String arrToString(String [] arr) 
        {
            if(arr==null) return "";
            StringBuffer sb=new StringBuffer();
            for(int i=0;i<arr.length;i++)
            {
                if(arr[i]!=null&&!arr[i].equals(""))
                    sb.append(arr[i]+",");
            }
            String returnValue=sb.toString();
            if(returnValue.endsWith(",")) returnValue=returnValue.substring(0,returnValue.length()-1);
            return returnValue;
        }
        
        public  static String arrToSqlString(String [] arr) 
        {
            if(arr==null) return "";
            StringBuffer sb=new StringBuffer();
            for(int i=0;i<arr.length;i++)
            {
                if(arr[i]!=null&&!arr[i].equals(""))
                    sb.append("'"+arr[i]+"',");
            }
            String returnValue=sb.toString();
            if(returnValue.endsWith(",")) returnValue=returnValue.substring(0,returnValue.length()-1);
            return returnValue;
        }
        
        
        public  static String arrToString(String [] arr,String splitChar) 
        {
            if(splitChar==null) return arrToString(arr);
            if(arr==null) return "";
            StringBuffer sb=new StringBuffer();
            for(int i=0;i<arr.length;i++)
            {
                if(arr[i]!=null&&!arr[i].equals(""))
                    sb.append(arr[i]+splitChar);
            }
            String returnValue=sb.toString();
            if(returnValue.endsWith(splitChar)) returnValue=returnValue.substring(0,returnValue.length()-splitChar.length());
            return returnValue;
        }
        
        
        public  static String objectToString(Object object) 
        {
            if(object==null) return "";
            String returnValue="";
            if(object instanceof String)
            {
                returnValue=(String)object;
            }
            else if(object instanceof String[])
            {
                returnValue=StringHelper.arrToString((String []) object);
            }
            else
            {
                returnValue=object.toString();
            }
            return returnValue;
        }
        
        public  static String objectToString(Object object,String splitChar) 
        {
            if(object==null) return "";
            String returnValue="";
            if(object instanceof String)
            {
                returnValue=(String)object;
            }
            else if(object instanceof String[])
            {
                returnValue=StringHelper.arrToString((String []) object,splitChar);
            }
            return returnValue;
        }
        

        public static String replace(String str, String strSub, String strRpl) {
            String[] tmp = split(str, strSub);
            String returnstr = "";
            if (tmp.length != 0) {
                returnstr = tmp[0];
                for (int i = 0; i < tmp.length - 1; i++) {
                    returnstr = doWithNull(returnstr) + strRpl + tmp[i + 1];
                }
            }
            return doWithNull(returnstr);
        }
        
        public static String htmlEncode(String txt) {
            if (txt != null) {
                txt = replace(txt, "&", "&amp;");
                txt = replace(txt, "&amp;amp;", "&amp;");
                txt = replace(txt, "&amp;quot;", "&quot;");
                txt = replace(txt, "\"", "&quot;");
                txt = replace(txt, "&amp;lt;", "&lt;");
                txt = replace(txt, "<", "&lt;");
                txt = replace(txt, "&amp;gt;", "&gt;");
                txt = replace(txt, ">", "&gt;");
                txt = replace(txt, "&amp;nbsp;", "&nbsp;");
                //txt = replace(txt," ","&nbsp;");
            }
            return txt;
        }
        
        //Restore string include HTML tags from storage.
        public static String unHtmlEncode(String txt) {
            if (txt != null) {
                txt = replace(txt, "&amp;", "&");
                txt = replace(txt, "&quot;", "\"");
                txt = replace(txt, "&lt;", "<");
                txt = replace(txt, "&gt;", ">");
                txt = replace(txt, "&nbsp;", " ");
            }
            return txt;
        }
        
        //Encode the string by GBK
        public static String toGBK(String str) {
            if (str != null) {
                byte[] tmpbyte = null;
                try {
                    tmpbyte = str.getBytes("ISO8859_1");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toGBK :" + e.getMessage());
                }
                try {
                    str = new String(tmpbyte, "GBK");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toGBK :" + e.getMessage());
                }
            }
            return str;
        }
        
        //Encode the string by ISO8859_1
        public static String toISO(String str) {
            if (str != null) {
                byte[] tmpbyte = null;
                try {
                    tmpbyte = str.getBytes("GBK");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toISO :" + e.getMessage());
                }
                try {
                    str = new String(tmpbyte, "ISO8859_1");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toISO :" + e.getMessage());
                }
            }
            return str;
        }
        
        //Encode the string by UTF-8
        public static String toUTF8(String str) {
            if (str != null) {
                byte[] tmpbyte = null;
                try {
                    tmpbyte = str.getBytes("ISO-8859-1");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toUTF8 :" + e.getMessage());
                }
                try {
                    str = new String(tmpbyte, "UTF-8");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toUTF8 :" + e.getMessage());
                }
            }
            return str;
        }
        
        
//        Encode the string by UTF-8
        public static String utf8ToGBK(String str) {
            if (str != null) {
                byte[] tmpbyte = null;
                try {
                    tmpbyte = str.getBytes("UTF-8");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toUTF8 :" + e.getMessage());
                }
                try {
                    str = new String(tmpbyte, "ISO-8859-1");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toUTF8 :" + e.getMessage());
                }
            }
            return str;
        }
        
//        Encode the string by UTF-8
        public static String utf8ToISO(String str) {
            if (str != null) {
                byte[] tmpbyte = null;
                try {
                    tmpbyte = str.getBytes("UTF-8");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toUTF8 :" + e.getMessage());
                }
                try {
                    str = new String(tmpbyte, "GBK");
                }
                catch (Exception e) {
                    System.out.println("Error: Method: StringUtil.toUTF8 :" + e.getMessage());
                }
            }
            return str;
        }
        
        public static String changeFirstToUpper(String str)
        {
            if(str==null||str.equals("")) return "";
             String firstChar = str.substring(0, 1);
             String leaveChar = str.substring(1);
             return firstChar.toUpperCase()+leaveChar;
        }
        
        
    public static boolean isHasContent(String str){
        String result = doWithNull(str);
        if(result == null || "".equals(result)){
            return false;
        }
        else{
            return true;
        }
    }
}
