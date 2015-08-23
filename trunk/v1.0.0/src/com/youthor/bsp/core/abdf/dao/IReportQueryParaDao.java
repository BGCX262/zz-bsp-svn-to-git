package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.ReportQueryPara;

public interface IReportQueryParaDao {

	List getQueryParasByFunId(String funModuleId);

	ReportQueryPara getReportQueryParaId(String reportQueryParaId);

	String addReportQueryPara(ReportQueryPara reportQueryPara);

	void deleteReportQueryParaById(String string);

	void updateReportQueryPara(ReportQueryPara reportQueryPara);

}
