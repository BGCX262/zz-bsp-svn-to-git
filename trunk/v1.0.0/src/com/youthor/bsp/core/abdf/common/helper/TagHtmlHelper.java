package com.youthor.bsp.core.abdf.common.helper;

public class TagHtmlHelper {
     public static String makeItemXML(String orgName, String action, String src, String icon, String openIcon)
        {
             String strXML = "\t";
                strXML += "<tree text=\"" + orgName + "\"";
                strXML += " action=\"" + action + "\"";
                if (src != null) {
                  strXML += " src=\"" + src + "\"";
                }
                if (icon != null) {
                  strXML += " icon=\"" + icon + "\"";
                }
                if (openIcon != null) {
                  strXML += " openIcon=\"" + openIcon + "\"";
                }
                strXML += "/>\n";
                return strXML;
        }

}
