package com.youthor.bsp.core.wfss.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.wfss.dao.IParticipantDao;
import com.youthor.bsp.core.wfss.model.Participant;

public class ParticipantDaoImpl extends BaseDAOHibernate implements IParticipantDao{

    protected Class getModelClass() {
        return Participant.class;
    }

    public String addParticipant(Participant participant) {
        super.doCreateObject(participant);
        return participant.getParticipantId();
    }

    public List getParticipantByAId(String activityId) {
        String hql="from "+getModelClass().getName()+" as p where p.parentId='"+activityId+"' and p.parentType='A' order by p.orderIndex";
        return super.doFind(hql);
    }

    public void deleteParticipant(Participant participant) {
        super.doDeleteObject(participant);
        
    }

	@Override
	public String updateParticipant(Participant participant) {
		super.doUpdateObject(participant);
		return participant.getParticipantId();
	}

}
