package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.wfss.model.Participant;

public interface IParticipantDao {

    String addParticipant(Participant participant);

    List getParticipantByAId(String activityId);

    void deleteParticipant(Participant participant);

	String updateParticipant(Participant participant);

}
