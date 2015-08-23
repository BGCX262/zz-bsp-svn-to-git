package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;

public class Participant implements Serializable{
    private static final long serialVersionUID = 7827914434759268451L;
    private String participantId; 
    private String  parentId; 
    private String  parentType; 
    private String  memberId; 
    private String  memberType; 
    private String  participantName; 
    private String  orgTypeCode;
    private int orderIndex;
    public int getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getMemberId() {
        return memberId;
    }
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    public String getMemberType() {
        return memberType;
    }
    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }
    public String getOrgTypeCode() {
        return orgTypeCode;
    }
    public void setOrgTypeCode(String orgTypeCode) {
        this.orgTypeCode = orgTypeCode;
    }
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public String getParentType() {
        return parentType;
    }
    public void setParentType(String parentType) {
        this.parentType = parentType;
    }
    public String getParticipantId() {
        return participantId;
    }
    public void setParticipantId(String participantId) {
        this.participantId = participantId;
    }
    public String getParticipantName() {
        return participantName;
    }
    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

}
