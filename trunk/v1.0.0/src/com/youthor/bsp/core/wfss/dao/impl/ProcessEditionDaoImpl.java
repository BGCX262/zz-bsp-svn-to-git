package com.youthor.bsp.core.wfss.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.wfss.dao.IProcessEditionDao;
import com.youthor.bsp.core.wfss.model.ProcessEdition;

public class ProcessEditionDaoImpl extends BaseDAOHibernate implements  IProcessEditionDao{

    protected Class getModelClass() {
        return ProcessEdition.class;
    }

    @Override
    public List getProcessEditionByComId(String comId) {
        String hql = "from "+ getModelClass().getName() + " as pe where pe.comId='"+comId+"' and pe.deleteFlag = 'N'";
        return this.doFind(hql);
    }

    @Override
    public String addProcessEdition(ProcessEdition processEdition) {
        this.doCreateObject(processEdition);
        return processEdition.getId();
    }

    @Override
    public ProcessEdition getProcessEditionById(String id) {
        ProcessEdition processEdition = (ProcessEdition)this.doFindObjectById(id);
        return processEdition;
    }

    @Override
    public String updateProcessEdition(ProcessEdition processEdition) {
        this.doUpdateObject(processEdition);
        return processEdition.getId();
    }

    @Override
    public List getProcessByEditionId(String id, String comId) {
         String hql = "from "+ com.youthor.bsp.core.wfss.model.Process.class.getName() + " as p where p.editionId='"+id+"'";
         return this.doFind(hql);
    }

    @Override
    public List getAppFormByEditionId(String id) {
    	 String hql = "from "+ com.youthor.bsp.core.wfss.model.AppForm.class.getName() + " as p where p.editionId='"+id+"'";
         return this.doFind(hql);
    }
   
}
