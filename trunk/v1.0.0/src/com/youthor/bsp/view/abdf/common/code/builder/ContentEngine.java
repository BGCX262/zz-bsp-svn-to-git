package com.youthor.bsp.view.abdf.common.code.builder;    
   
import org.apache.velocity.Template;    
import org.apache.velocity.VelocityContext;    
import org.apache.velocity.app.Velocity;    
import org.apache.velocity.exception.ParseErrorException;    
import org.apache.velocity.exception.ResourceNotFoundException;    
   
  
   
import java.io.FileInputStream;    
import java.io.FileOutputStream;    
import java.io.PrintWriter;    
import java.io.StringWriter;    
import java.util.Iterator;    
import java.util.Properties;    

import javax.servlet.http.HttpServletRequest;
public class ContentEngine {    
    private VelocityContext context = null;    
   
    private Template template = null;    
   
    private HttpServletRequest request;
   
   
    /**   
     *    
     * @param properties   
     * @throws Exception   
     */  
    public ContentEngine(HttpServletRequest request,String template,String characterSet)
    {
        this.request=request;
         String path =request.getSession().getServletContext().getRealPath("/template");   
         Properties p = new Properties();  
         p.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, path);    
         p.setProperty(Velocity.RUNTIME_LOG, path + "velocity.log"); 
         try {
            this.init(p);
             this.setTemplate(template, characterSet); 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }  
        
    }
    
    public ContentEngine(HttpServletRequest request,String template)
    {
        this.request=request;
         String path =request.getSession().getServletContext().getRealPath("/template");   
         Properties p = new Properties();  
         p.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, path);    
         p.setProperty(Velocity.RUNTIME_LOG, path + "velocity.log"); 
         try {
            this.init(p);
             this.setTemplate(template, "UTF-8"); 
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }  
        
    }
    
    public void init(String properties) throws Exception {    
        if (properties != null && properties.trim().length() > 0) {    
            Velocity.init(properties);    
        } else {    
            Velocity.init();    
        }    
        context = new VelocityContext();    
    }    
   
    public void init(Properties properties) throws Exception {    
   
        Velocity.init(properties);    
        context = new VelocityContext();    
    }    
   
    /**   
     *    
     * @param key   
     * @param value   
     */   
    public void put(String key, Object value) {    
        context.put(key, value);    
    }    
   
    /**   
     * 设置模版   
     *    
     * @param templateFile   
     *            模版文件   
     * @throws AppException   
     */   
    public void setTemplate(String templateFile) throws Exception {    
        try {    
            template = Velocity.getTemplate(templateFile);    
           
        } catch (ResourceNotFoundException rnfe) {    
            rnfe.printStackTrace();    
            throw new Exception(" error : cannot find template "   
                    + templateFile);    
        } catch (ParseErrorException pee) {    
            throw new Exception(" Syntax error in template " + templateFile    
                    + ":" + pee);    
        } catch (Exception e) {    
            throw new Exception(e.toString());    
        }    
   
    }    
   
    /**   
     * 设置模版   
     *    
     * @param templateFile   
     *            模版文件   
     * @throws AppException   
     */   
    public void setTemplate(String templateFile, String characterSet)    
            throws Exception {    
        try {    
            template = Velocity.getTemplate(templateFile, characterSet);    
        } catch (ResourceNotFoundException rnfe) {    
            rnfe.printStackTrace();    
            throw new Exception(" error : cannot find template "   
                    + templateFile);    
        } catch (ParseErrorException pee) {    
            throw new Exception(" Syntax error in template " + templateFile    
                    + ":" + pee);    
        } catch (Exception e) {    
            throw new Exception(e.toString());    
        }    
   
    }    
   
    /**   
     * 转换为文本文件   
     */   
    public String toText() throws Exception {    
        StringWriter sw = new StringWriter();    
        try {    
            template.merge(context, sw);    
        } catch (Exception e) {    
            throw new Exception(e.toString());    
        }    
        return sw.toString();    
    }    
   
    /**   
     *    
     * @param fileName   
     */   
    public void toFile(String fileName) throws Exception {    
        try {    
            StringWriter sw = new StringWriter();    
            template.merge(context, sw);    
   
            PrintWriter filewriter = new PrintWriter(new FileOutputStream(    
                    fileName), true);    
            filewriter.println(sw.toString());    
            filewriter.close();    
        } catch (Exception e) {    
            throw new Exception(e.toString());    
        }    
   
    }    
   
    /**   
     *    
     * @param fileName   
     */   
    public StringWriter getStringWriter() throws Exception {    
        try {    
            StringWriter sw = new StringWriter();    
            template.merge(context, sw);    
            return sw;
        } catch (Exception e) {    
            throw new Exception(e.toString());    
        }    
   
    }    
   
   
}    
