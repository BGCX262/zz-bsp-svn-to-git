package com.youthor.bsp.core.report.jasper;

import java.sql.Connection;
import java.util.Map;

import javax.sql.DataSource;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SimpleJasperReportEngine extends JasperReportEngine {
	protected final Log log = LogFactory.getLog(getClass());

	private DataSource dataSource;

	@Override
	protected JasperPrint getJasperPrint(String reportTemplate,
			Map<String, String> paras) throws Exception {
		Connection conn = dataSource.getConnection();
		try {
			return JasperFillManager.fillReport(
					getJasperReport(reportTemplate), paras, conn);
		} 
		catch (Exception e) {
			log.error(e);
			throw new RuntimeException(e);
		} 
		finally {
			conn.close();
			log.debug("close report connection!");
		}
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
