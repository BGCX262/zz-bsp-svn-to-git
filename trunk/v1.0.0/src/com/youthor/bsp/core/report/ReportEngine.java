package com.youthor.bsp.core.report;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;

import com.youthor.bsp.core.report.jasper.viewer.ReportViewer;

public interface ReportEngine {

	public void produceReport(String reportTemplate, ReportViewer reportViewer,
			Map<String, String> paras, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public void produceReport(JRDataSource reportDataSource,
			String reportTemplate, ReportViewer reportViewer,
			Map<String, String> paras, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
