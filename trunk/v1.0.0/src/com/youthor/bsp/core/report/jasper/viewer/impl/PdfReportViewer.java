package com.youthor.bsp.core.report.jasper.viewer.impl;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;

import com.youthor.bsp.core.report.jasper.viewer.ReportViewer;

public class PdfReportViewer implements ReportViewer{

	public void viewReport(HttpServletRequest request,HttpServletResponse response, JasperPrint jasperPrint) throws Exception {
		OutputStream  os = response.getOutputStream();
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition","attachment;filename=Report.pdf");
	    JRPdfExporter pdf = new JRPdfExporter();
	    pdf.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UTF-8");
	    pdf.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	    pdf.setParameter(JRExporterParameter.OUTPUT_STREAM, os);
	    pdf.exportReport();
        os.flush();
        os.close();
        
	}

}
