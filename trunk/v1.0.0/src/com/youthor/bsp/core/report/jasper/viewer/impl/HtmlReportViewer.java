package com.youthor.bsp.core.report.jasper.viewer.impl;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

import com.youthor.bsp.core.report.jasper.viewer.ReportViewer;

public class HtmlReportViewer implements ReportViewer{
	public void viewReport(HttpServletRequest request, HttpServletResponse response, JasperPrint jasperPrint) throws Exception {
		OutputStream  os = response.getOutputStream();
		response.setContentType("text/html");
        JRHtmlExporter html = new JRHtmlExporter();
        html.setParameter(JRHtmlExporterParameter.CHARACTER_ENCODING, "UTF-8");
        html.setParameter(JRHtmlExporterParameter.JASPER_PRINT, jasperPrint);
        html.setParameter(JRHtmlExporterParameter.OUTPUT_STREAM, os);
        html.setParameter(JRHtmlExporterParameter.IMAGES_URI,"image?image="); 
        request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperPrint);
        html.exportReport();
        os.flush();
        os.close();
	}

}
