package com.youthor.bsp.core.urss.model;

import java.util.ArrayList;
import java.util.List;

public class PostAssign {
        private String assignId="";
       private String orgId;
       private String postId;
       private String postName; //数据库中没有此记录
       private float orderIndex;
       private List orgs=new ArrayList();
          public String getAssignId(){
         return assignId;
      }
       public PostAssign setAssignId(String assignId) {
        this.assignId = assignId;
        return this;
      }
         public String getOrgId(){
         return orgId;
      }
       public PostAssign setOrgId(String orgId) {
        this.orgId = orgId;
        return this;
      }
         public String getPostId(){
         return postId;
      }
       public PostAssign setPostId(String postId) {
        this.postId = postId;
        return this;
      }
         public float getOrderIndex(){
         return orderIndex;
      }
       public PostAssign setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
        return this;
      }
    public String getPostName() {
        return postName;
    }
    public void setPostName(String postName) {
        this.postName = postName;
    }
    public List getOrgs() {
        return orgs;
    }
    public void setOrgs(List orgs) {
        this.orgs = orgs;
    }
   }