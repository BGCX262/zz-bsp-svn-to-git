package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.ReportFile;

public interface IReportFileDao {

	void updateReportFile(ReportFile reportFile);

	ReportFile getReportFileById(String id);

	List getQueryFilesByFunId(String funId);

	boolean deleteReportFileById(String id);

	String addReportFile(ReportFile reportFile);

}
