package com.youthor.bsp.core.report.jasper.viewer.impl;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.export.JExcelApiExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import com.youthor.bsp.core.report.jasper.viewer.ReportViewer;

public class ExcelReportViewer implements ReportViewer{

    public void viewReport(HttpServletRequest request, HttpServletResponse response, JasperPrint jasperPrint) throws Exception {
        OutputStream  os = response.getOutputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition","attachment;filename=Report.xls");
        JExcelApiExporter excel= new JExcelApiExporter();
        excel.setParameter(JExcelApiExporterParameter.CHARACTER_ENCODING, "UTF-8");
        excel.setParameter(JExcelApiExporterParameter.JASPER_PRINT, jasperPrint);
        excel.setParameter(JExcelApiExporterParameter.OUTPUT_STREAM, os);
        excel.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);//删除空白行
        excel.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);//是否为空白背景
        excel.exportReport();
        os.flush();
        os.close();
    }
}
