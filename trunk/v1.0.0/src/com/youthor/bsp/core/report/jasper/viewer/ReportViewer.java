package com.youthor.bsp.core.report.jasper.viewer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperPrint;

public interface ReportViewer {
	public void viewReport(HttpServletRequest request, HttpServletResponse response, JasperPrint jasperPrint) throws Exception ;
}
