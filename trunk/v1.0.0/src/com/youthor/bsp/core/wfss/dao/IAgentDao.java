package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.wfss.model.Agent;

public interface IAgentDao {

	Agent getAgentByOrgId(String orgId);

	String addAgent(Agent agent);

	String updateAgent(Agent agent);

	List getAllAgent();

}
