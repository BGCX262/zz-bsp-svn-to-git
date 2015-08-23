package com.youthor.bsp.core.report.jasper;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

import com.youthor.bsp.core.report.ReportEngine;
import com.youthor.bsp.core.report.jasper.viewer.ReportViewer;

public class JasperReportEngine implements ReportEngine{
	
	private JRDataSource reportDataSource;

	public void produceReport(String reportTemplate, ReportViewer reportViewer,
			Map<String,String> paras, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		reportViewer.viewReport(request, response, getJasperPrint(reportTemplate, paras));
	}
	
	public void produceReport(JRDataSource reportDataSource, String reportTemplate, ReportViewer reportViewer,
			Map<String,String> paras, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		reportViewer.viewReport(request,response,getJasperPrint(reportDataSource, reportTemplate, paras));
		
	}
	
	protected JasperPrint getJasperPrint(String reportTemplate, Map<String,String> paras) throws Exception {
		
		return JasperFillManager.fillReport(getJasperReport(reportTemplate), paras, reportDataSource);
	}
	
	protected JasperPrint getJasperPrint(JRDataSource reportDataSource, String reportTemplate, Map<String,String> paras) throws Exception {

		return JasperFillManager.fillReport(getJasperReport(reportTemplate), paras, reportDataSource);
	}
	
	protected JasperReport getJasperReport(String reportTemplate) throws Exception {
		return (JasperReport) JRLoader.loadObject(getReportTemplateFile(reportTemplate).getPath());
	}
	
	private File getReportTemplateFile(String reportTemplate) throws Exception {
		File reportTemplateFile = new File(reportTemplate);
		if (!reportTemplateFile.exists()) {
			throw new FileNotFoundException("Report template file: " + reportTemplateFile.getPath() + " is not found!");
		}
		return reportTemplateFile;
	}


	public void setReportDataSource(JRDataSource reportDataSource) {
		this.reportDataSource = reportDataSource;
	}
}
