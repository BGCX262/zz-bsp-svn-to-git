package com.youthor.bsp.core.wfss.model;
public class AgentItem {
       private String id;
       private String orgId;
       private String orgName;
       private String agentOrgId;
       private String agentOrgName;
       private java.util.Date fromDate;
       private java.util.Date toDate;
       private String processId;
       private String activityId;
          public String getId(){
         return id;
      }
       public void setId(String id) {
        this.id = id;
      }
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
         public String getProcessId(){
         return processId;
      }
       public void setProcessId(String processId) {
        this.processId = processId;
      }
         public String getActivityId(){
         return activityId;
      }
       public void setActivityId(String activityId) {
        this.activityId = activityId;
      }
   }