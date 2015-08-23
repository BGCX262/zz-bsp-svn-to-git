package com.youthor.bsp.view.abdf.web.action;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.CodeBuilderHelper;
import com.youthor.bsp.core.abdf.model.codebuilder.Field;
import com.youthor.bsp.core.abdf.model.codebuilder.XMLModel;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.code.builder.ContentEngine;


public class CodeBuilderAction extends BaseStrutsAction{
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_DataBaseList = "dataBaseList";
      private static final String FORWARD_DisplayCodeToText = "displayCodeToText";

      
    public ActionForward getDataTable(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        List pageList=abdfServiceFacade.getDataTable();
        
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_DataBaseList);    
    }
    
    public ActionForward buildXMLModelToText(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String packageName=request.getParameter("packageName");
        String className=request.getParameter("className");
        String keyName=request.getParameter("keyName");
        String tableName=request.getParameter("tableName");
        
        List field=abdfServiceFacade.getDataTableField(tableName);
        if(keyName==null||keyName.equals(""))
        {
            keyName=((Field)field.get(0)).getFiledName();
        }
        XMLModel xmlModel=new XMLModel();
        xmlModel.setClassName(className);
        xmlModel.setKeyFieldName(keyName);
        xmlModel.setPackageName(packageName);
        xmlModel.setTableName(tableName);
        xmlModel.setKeyPropertyName(CodeBuilderHelper.formatToModleProperty(keyName));
         ContentEngine content = new ContentEngine(request,"./HibernateXMLTemplate.vm");  
         content.put("xmlModel",xmlModel);
         content.put("fieldInfo",field);
         request.setAttribute("xmlModel",xmlModel);
         request.setAttribute("XMLContent",content.toText());
         //content.toFile(request.getSession().getServletContext().getRealPath("/")+"/bb.java");
         
         //生成model
         content = new ContentEngine(request,"./HibernateModelTemplate.vm");  
         content.put("xmlModel",xmlModel);
         content.put("fieldInfo",field);
         request.setAttribute("modelContent",content.toText());
         //生成form
         content = new ContentEngine(request,"./HibernateFormTemplate.vm");  
         content.put("xmlModel",xmlModel);
         content.put("fieldInfo",field);
         request.setAttribute("formContent",content.toText());
        return mapping.findForward(FORWARD_DisplayCodeToText);    
    }

    public ActionForward buildXMLModelToFile(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String packageName=request.getParameter("packageName");
        String className=request.getParameter("className");
        String keyName=request.getParameter("keyName");
        String tableName=request.getParameter("tableName");
        
        String type=request.getParameter("type");
        
        List field=abdfServiceFacade.getDataTableField(tableName);
        if(keyName==null||keyName.equals(""))
        {
            keyName=((Field)field.get(0)).getFiledName();
        }
        XMLModel xmlModel=new XMLModel();
        xmlModel.setClassName(className);
        xmlModel.setKeyFieldName(keyName);
        xmlModel.setPackageName(packageName);
        xmlModel.setTableName(tableName);
        xmlModel.setKeyPropertyName(CodeBuilderHelper.formatToModleProperty(keyName));
          response.reset();//清空输出流
        ContentEngine content = null;
        if(type.equals("xml"))
        {
            content=new ContentEngine(request,"./HibernateXMLTemplate.vm"); 
            response.setHeader("Content-disposition", "attachment; filename="+className+".hbm.xml");//设定输出文件头
        }
        else if(type.equals("model"))
        {
            content=new ContentEngine(request,"./HibernateModelTemplate.vm"); 
            response.setHeader("Content-disposition", "attachment; filename="+className+".java");//设定输出文件头
        }
        else if(type.equals("actionForm"))
        {
            content=new ContentEngine(request,"./HibernateFormTemplate.vm"); 
            response.setHeader("Content-disposition", "attachment; filename="+className+"Form.java");//设定输出文件头
        }
        content.put("xmlModel",xmlModel);
        content.put("fieldInfo",field);
        StringWriter sw=content.getStringWriter();
        OutputStream os = response.getOutputStream();//取得输出流
        PrintWriter filewriter = new PrintWriter(os, true);    
        filewriter.println(sw.toString());    
        filewriter.close();    
        return null;
    }
    
    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }    
    
    
    

}
