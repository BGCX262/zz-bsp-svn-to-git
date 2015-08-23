package com.youthor.bsp.core.wfss.model;
public class Agent {
       private String orgId;
       private String orgName;
       private java.util.Date fromDate;
       private java.util.Date toDate;
       private String agentType;
       private String agentOrgId;
       private String agentOrgName;
          public String getOrgId(){
         return orgId;
      }
       public void setOrgId(String orgId) {
        this.orgId = orgId;
      }
         public String getOrgName(){
         return orgName;
      }
       public void setOrgName(String orgName) {
        this.orgName = orgName;
      }
         public java.util.Date getFromDate(){
         return fromDate;
      }
       public void setFromDate(java.util.Date fromDate) {
        this.fromDate = fromDate;
      }
         public java.util.Date getToDate(){
         return toDate;
      }
       public void setToDate(java.util.Date toDate) {
        this.toDate = toDate;
      }
         public String getAgentType(){
         return agentType;
      }
       public void setAgentType(String agentType) {
        this.agentType = agentType;
      }
         public String getAgentOrgId(){
         return agentOrgId;
      }
       public void setAgentOrgId(String agentOrgId) {
        this.agentOrgId = agentOrgId;
      }
         public String getAgentOrgName(){
         return agentOrgName;
      }
       public void setAgentOrgName(String agentOrgName) {
        this.agentOrgName = agentOrgName;
      }
   }