package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IReportFileDao;
import com.youthor.bsp.core.abdf.model.ReportFile;

public class ReportFileDaoImpl extends BaseDAOHibernate implements IReportFileDao{

	@Override
	protected Class getModelClass() {
		// TODO Auto-generated method stub
		return ReportFile.class;
	}

	@Override
	public String addReportFile(ReportFile reportFile) {
		this.doCreateObject(reportFile);
		return reportFile.getId();
	}

	@Override
	public boolean deleteReportFileById(String id) {
		ReportFile reportFile = this.getReportFileById(id);
		this.doDeleteObject(reportFile);
		return true;
	}

	@Override
	public List getQueryFilesByFunId(String funId) {
		String hql = "from "+getModelClass().getName() +" where funModuleId = '"+funId+"'";
		return this.doFind(hql);
	}

	@Override
	public ReportFile getReportFileById(String id) {
		// TODO Auto-generated method stub
		return (ReportFile)this.doFindObjectById(id);
	}

	@Override
	public void updateReportFile(ReportFile reportFile) {
		this.doUpdateObject(reportFile);
		
	}

}
