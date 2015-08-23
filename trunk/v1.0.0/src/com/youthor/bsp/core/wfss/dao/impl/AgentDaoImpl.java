package com.youthor.bsp.core.wfss.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.wfss.dao.IAgentDao;
import com.youthor.bsp.core.wfss.model.Agent;

public class AgentDaoImpl  extends BaseDAOHibernate implements IAgentDao{

	@Override
	protected Class getModelClass() {
		// TODO Auto-generated method stub
		return Agent.class;
	}

	@Override
	public Agent getAgentByOrgId(String orgId) {
		
		return (Agent)this.doFindObjectById(orgId);
	}

	@Override
	public String addAgent(Agent agent) {
		this.doCreateObject(agent);
		return agent.getOrgId();
	}

	@Override
	public String updateAgent(Agent agent) {
		this.doUpdateObject(agent);
		return agent.getOrgId();
	}

	@Override
	public List getAllAgent() {
		// TODO Auto-generated method stub
		return this.doListAllObject();
	}

}
