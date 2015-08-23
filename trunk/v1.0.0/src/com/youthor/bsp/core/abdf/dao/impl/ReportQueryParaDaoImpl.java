package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IReportQueryParaDao;
import com.youthor.bsp.core.abdf.model.ReportQueryPara;

public class ReportQueryParaDaoImpl extends BaseDAOHibernate implements IReportQueryParaDao{

	@Override
	protected Class getModelClass() {
		// TODO Auto-generated method stub
		return ReportQueryPara.class;
	}

	@Override
	public List getQueryParasByFunId(String funModuleId) {
		String hql = "from "+getModelClass().getName() + " where funModuleId = '"+funModuleId+"'";
		return this.doFind(hql);
	}

	@Override
	public ReportQueryPara getReportQueryParaId(String reportQueryParaId) {
		ReportQueryPara reportQueryPara = (ReportQueryPara)this.doFindObjectById(reportQueryParaId);
		return reportQueryPara;
	}

	@Override
	public String addReportQueryPara(ReportQueryPara reportQueryPara) {
		this.doCreateObject(reportQueryPara);
		return reportQueryPara.getId();
	}

	@Override
	public void deleteReportQueryParaById(String id) {
		ReportQueryPara reportQueryPara = this.getReportQueryParaId(id);
		if (reportQueryPara!=null) {
			this.doDeleteObject(reportQueryPara);
		}
		
	}

	@Override
	public void updateReportQueryPara(ReportQueryPara reportQueryPara) {
		this.doUpdateObject(reportQueryPara);
		
	}

}
