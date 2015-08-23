package com.youthor.bsp.core.urss.model;
public class PostOrg {
        private String postOrgId;
       private String assignId;
       private String orgId;
       private String orgName;
       private float orderIndex;
          public String getPostOrgId(){
         return postOrgId;
      }
       public PostOrg setPostOrgId(String postOrgId) {
        this.postOrgId = postOrgId;
        return this;
      }
         public String getAssignId(){
         return assignId;
      }
       public PostOrg setAssignId(String assignId) {
        this.assignId = assignId;
        return this;
      }
         public String getOrgId(){
         return orgId;
      }
       public PostOrg setOrgId(String orgId) {
        this.orgId = orgId;
        return this;
      }
         public String getOrgName(){
         return orgName;
      }
       public PostOrg setOrgName(String orgName) {
        this.orgName = orgName;
        return this;
      }
         public float getOrderIndex(){
         return orderIndex;
      }
       public PostOrg setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
        return this;
      }
   }