package com.youthor.bsp.view.abdf.common.action;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.abdf.common.helper.DictHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
public class ComponentAction extends BaseStrutsAction{
    private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
    
    public ActionForward linkDropDown(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String dictType=request.getParameter("dictType");
        IDictDynamic dictDynamic = DictHelper.setDynamicDictToApplication(dictType, request); 
        List dataList=dictDynamic.execute(request);
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        StringBuffer sbXML=new StringBuffer();
        sbXML.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        String linkId=request.getParameter("linkId");
        sbXML.append("\t<rows >\n");
        sbXML.append("<linkId value=\"" + linkId + "\"/>\n");
        if(dataList!=null&&dataList.size()>0)
        {
            for(int i=0;i<dataList.size();i++)
            {
                Item item=(Item)dataList.get(i);
                String strXML = "\t";
                strXML += "<row value=\"" + item.getKey() + "\"";
                strXML += " text=\"" + item.getValue() + "\"";
                Map extendPara=item.getExtendPara();
                 Set set=extendPara.keySet();
                 Iterator iterator=set.iterator();
                 String extraProperty="";
                 while(iterator.hasNext())
                 {
                     String keyValue=(String)iterator.next();
                     extraProperty=StringHelper.doWithNull(extendPara.get(keyValue));
                     strXML += keyValue+"=\"" + extraProperty + "\"";
                     
                 }
                strXML += "/>\n";
                sbXML.append(strXML);
            }
        }
         sbXML.append("\t</rows>\n");
         System.out.println(sbXML.toString());
         out.print(sbXML.toString());
         return null;        
    }

}
