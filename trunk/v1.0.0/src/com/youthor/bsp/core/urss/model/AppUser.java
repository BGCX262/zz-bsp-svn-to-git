package com.youthor.bsp.core.urss.model;
public class AppUser {
        private String appUserId;
       private String appId;
       private String comUserId;
       
       private String appName;
       private String comUserName;
       
          public String getAppUserId(){
         return appUserId;
      }
       public void setAppUserId(String appUserId) {
        this.appUserId = appUserId;
      }
         public String getAppId(){
         return appId;
      }
       public void setAppId(String appId) {
        this.appId = appId;
      }
         public String getComUserId(){
         return comUserId;
      }
       public void setComUserId(String comUserId) {
        this.comUserId = comUserId;
      }
    public String getAppName() {
        return appName;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public String getComUserName() {
        return comUserName;
    }
    public void setComUserName(String comUserName) {
        this.comUserName = comUserName;
    }
   }
