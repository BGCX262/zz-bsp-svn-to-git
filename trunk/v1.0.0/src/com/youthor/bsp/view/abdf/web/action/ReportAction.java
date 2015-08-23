package com.youthor.bsp.view.abdf.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.ReportFile;
import com.youthor.bsp.core.abdf.model.ReportQueryPara;
import com.youthor.bsp.core.abdf.model.SystemConf;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.report.jasper.JasperReportEngine;
import com.youthor.bsp.core.report.jasper.viewer.ReportViewer;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;

/**
 * 报表Action
 * @author jason
 * 
 * 配置参考信息如下：
 * <bean id="reportEngine" class="com.youthor.bsp.core.report.jasper.SimpleJasperReportEngine">
 *         <property name="dataSource" ref="dataSource"/>
 * </bean>
 *     
 * <bean id="htmlReportViewer" class="com.youthor.bsp.core.report.jasper.viewer.impl.HtmlReportViewer"/>
 * 
 * <bean id="pdfReportViewer" class="com.youthor.bsp.core.report.jasper.viewer.impl.PdfReportViewer"/>
 * 
 * <bean id="excelReportViewer" class="com.youthor.bsp.core.report.jasper.viewer.impl.ExcelReportViewer"/>
 * 
 */
public class ReportAction extends BaseStrutsAction {
    //系统模板保存的路径
    private static final String REPORT_TEMPLATE_PATH_SETTING = "report.template.path";
    private JasperReportEngine jasperReportEngine;
    private Map<String, ReportViewer> reportViewerMapping;
    private IAbdfServiceFacade abdfServiceFacade;
    private IUrssServiceFacade urssServiceFacade;

    private static final String FORWARD_SUCCESS = "reportSuccess";
    private static final String FORWARD_FAIL = "reportFail";

    public ActionForward doReport(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        try{
            String viewType = request.getParameter("ABDF_viewType");
            ReportViewer reportViewer = reportViewerMapping.get(viewType);
            
          //准备参数
            Map<String,String> paras = new HashMap<String,String>();
            //动态设置参数
            
            String funCode = request.getParameter("ABDF_funCode");
            Function function = urssServiceFacade.getFunctionByAppIdFunCode(AbdfCache.app.getAppId(), funCode);
            List list = abdfServiceFacade.getQueryParasByFunId(function.getFunModuleId());
            
            if (list != null && !list.isEmpty()) {
                for (int i =0 ;i<list.size();i++) {
                    ReportQueryPara peportQueryPara =(ReportQueryPara)list.get(i);
                    String paraKey = peportQueryPara.getParaKey();
                    setParaToReport(peportQueryPara,paras,request);
                }
            }
            
            
            List pageList=abdfServiceFacade.getQueryFilesByFunId(function.getFunModuleId());
            ReportFile reportFileMain = null;
            if (pageList != null && !pageList.isEmpty()) {
                for (int i =0 ;i<pageList.size();i++) {
                    ReportFile reportFile =(ReportFile)pageList.get(i);
                    if ((funCode+".jasper").toLowerCase().equals(reportFile.getFileName().toLowerCase())) {
                    	reportFileMain = reportFile;
                    }
                }
            }
            
            //获取路径
            if (reportFileMain == null) return null;
            String templatePath = ConfigInfoHelper.getProperty("report.template.path") 
            +"/"+ reportFileMain.getFunCode()
            + "/"+ reportFileMain.getFileName();
            
            //输出
            logger.debug("generate report begin...");
            jasperReportEngine.produceReport(templatePath, reportViewer, paras, request, response);
            logger.debug("generate report end");
            
            return null;
        }
        catch(Exception e){
            logger.error("ERROR", e);
            return null;
        }
    }
    
    private void setParaToReport(ReportQueryPara peportQueryPara,Map paras,HttpServletRequest request) {
        String paraKey = peportQueryPara.getParaKey();
        String paraKeyValue = request.getParameter(paraKey);
        paras.put(paraKey, paraKeyValue);
        paraKeyValue = StringHelper.doWithNull(paraKeyValue);
        String paraCol = peportQueryPara.getParaCol();
        String dataType = StringHelper.doWithNull(peportQueryPara.getDataType());
        if (!StringHelper.doWithNull(paraCol).equals("")) {
            String operation = " "+StringHelper.doWithNull(request.getParameter(peportQueryPara.getParaKey()+"_operation"))+" ";
            if (dataType.equals("num")) {
               
            }
            else {
                if (operation.trim().equals("like")) {
                    paraKeyValue = " '%"+paraKeyValue+"%' ";
                }
                else {
                   if (!paraKeyValue.equals("")) {
                	   paraKeyValue = " '"+paraKeyValue+"' ";
                   }
                    
                }
                
            }
            if (!paraKeyValue.equals("") && !paraKeyValue.trim().equals("'%%'")) {
                paras.put(paraKey+"_COL", paraCol + operation + paraKeyValue);
                paras.put(paraKey+"_COL_AND", " AND "+ paraCol + operation + paraKeyValue);
                paras.put(paraKey+"_COL_OR", " OR "+ paraCol + operation + paraKeyValue);
            }
            else {
                paras.put(paraKey+"_COL", "");
                paras.put(paraKey+"_COL_AND", "");
                paras.put(paraKey+"_COL_OR", "");
            }
        }
        
    }
    
    public ActionForward getReportPage(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            
            String funCode = request.getParameter("fun_code");
            Function function = urssServiceFacade.getFunctionByAppIdFunCode(AbdfCache.app.getAppId(), funCode);
            List list = abdfServiceFacade.getQueryParasByFunId(function.getFunModuleId());
            request.setAttribute("queryParas", list);
            request.setAttribute("function", function);
            return mapping.findForward("getReportPage");
    }
        

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }

    public void setJasperReportEngine(JasperReportEngine jasperReportEngine) {
        this.jasperReportEngine = jasperReportEngine;
    }
    
    public void setReportViewerMapping(Map<String, ReportViewer> reportViewerMapping) {
        this.reportViewerMapping = reportViewerMapping;
    }

    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
}
