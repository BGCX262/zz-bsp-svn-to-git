package com.youthor.bsp.view.urss.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.abdf.model.ReportFile;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.AttachFactoryHelper;
import com.youthor.bsp.view.abdf.web.form.ReportFileForm;


public class ReportFileAction extends BaseStrutsAction{
    
    private IAbdfServiceFacade abdfServiceFacade;
    private IUrssServiceFacade urssServiceFacade;
    
      private static final String FORWARD_ReportFileList = "reportFileList";
      private static final String FORWARD_ReportFileEdit = "reportFileEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = ReportFileForm.class.getName();
      private static final String modelClass = ReportFile.class.getName();
      
    public ActionForward getAllReportFileByFunId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String funId=request.getParameter("funModuleId");
        String appId=request.getParameter("appId");
        List pageList=abdfServiceFacade.getQueryFilesByFunId(funId);
        request.setAttribute("funId",funId);
        request.setAttribute("appId",appId);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_ReportFileList);    
    }
           
    public ActionForward showReportFile(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ReportFileForm reportFileForm=(ReportFileForm)form;
        
        String reportFileId=reportFileForm.getId();
        ReportFile reportFile=abdfServiceFacade.getReportFileById(reportFileId);
        
       
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename="
                + new String(reportFile.getFileName().getBytes("gb2312"),"iso8859-1"));
        OutputStream outStream = response.getOutputStream();
        String realPath = ConfigInfoHelper.getProperty("report.template.path") + "/" + reportFile.getFunCode()+"/"+reportFile.getFileName();
        FileInputStream is = new FileInputStream(realPath);
        IOUtils.copy(is, outStream);
        is.close();
        outStream.close();
        
        return null;    
    }    
    
    
    public ActionForward initReportFile(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ReportFileForm reportFileForm=(ReportFileForm)form;
        return mapping.findForward(FORWARD_ReportFileEdit);    
    }    
    
    
    
    public ActionForward saveReportFile(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ReportFileForm reportFileForm=(ReportFileForm)form;
        FormFile formFile = reportFileForm.getFormFile();
        if (formFile == null) {
            return mapping.findForward(FORWARD_ReportFileEdit);
        }
        else {
        	if (formFile.getFileSize() == 0) {
                return mapping.findForward(FORWARD_ReportFileEdit);
            }
        	
        	String funId = reportFileForm.getFunModuleId();
        	Function function = urssServiceFacade.getFunctionById(funId);
        	String basePath = ConfigInfoHelper.getProperty("report.template.path") + "/" + function.getFunCode()+"/";
        	String absolutePath = basePath+formFile.getFileName();
        	AttachFactoryHelper.saveFileToDisk(formFile,basePath,absolutePath);
        	ReportFile reportFile = new ReportFile();
        	reportFile.setFunModuleId(funId);
        	reportFile.setDesc(reportFileForm.getDesc());
        	reportFile.setFileName(formFile.getFileName());
        	reportFile.setFunCode(function.getFunCode());
        	abdfServiceFacade.addReportFile(reportFile);
        	response.sendRedirect(request.getContextPath()+"/getAllReportFileByFunId_urss.do?funModuleId="+funId);
        }
       return null;
        
    }
    
    public ActionForward deleteReportFile(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        if (ids!=null && ids.length>0) {
             for(int i=0;i<ids.length;i++) {
            	 ReportFile reportFile=abdfServiceFacade.getReportFileById(ids[i]);
            	 String basePath = ConfigInfoHelper.getProperty("report.template.path") + "/" + reportFile.getFunCode()+"/";
             	 String absolutePath = basePath+reportFile.getFileName();
             	 File file = new File(absolutePath);
             	 if (file.exists()) {
             		file.delete();
             	 }
                boolean b = abdfServiceFacade.deleteReportFileById(ids[i]);
             }
        }
        
         String funId=request.getParameter("funModuleId");
        
            request.setAttribute("funId",funId);
        return mapping.findForward(FORWARD_DelToList);    
    }

	public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
		this.abdfServiceFacade = abdfServiceFacade;
	}

	public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
		this.urssServiceFacade = urssServiceFacade;
	}    

    
    

}
