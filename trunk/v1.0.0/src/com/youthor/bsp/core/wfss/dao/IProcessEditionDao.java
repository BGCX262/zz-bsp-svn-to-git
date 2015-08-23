package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.wfss.model.ProcessEdition;

public interface IProcessEditionDao {

	List getProcessEditionByComId(String comId);

	String addProcessEdition(ProcessEdition processEdition);

	ProcessEdition getProcessEditionById(String id);

	String updateProcessEdition(ProcessEdition processEdition);

	List getProcessByEditionId(String id, String comId);

	List getAppFormByEditionId(String id);

}
