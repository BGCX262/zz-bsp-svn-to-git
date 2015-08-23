package com.youthor.bsp.core.abdf.model;
public class UrlLog {
        private String id;
       private String url;
       private String name;
       private String userId;
       private String userName;
       private float timeLong;
       private java.util.Date logTime;
       private String commitMethod;
       private String commitData;
          public String getId(){
         return id;
      }
       public void setId(String id) {
        this.id = id;
      }
         public String getUrl(){
         return url;
      }
       public void setUrl(String url) {
        this.url = url;
      }
         public String getName(){
         return name;
      }
       public void setName(String name) {
        this.name = name;
      }
        
         public float getTimeLong(){
         return timeLong;
      }
       public void setTimeLong(float timeLong) {
        this.timeLong = timeLong;
      }
         public java.util.Date getLogTime(){
         return logTime;
      }
       public void setLogTime(java.util.Date logTime) {
        this.logTime = logTime;
      }
         public String getCommitMethod(){
         return commitMethod;
      }
       public void setCommitMethod(String commitMethod) {
        this.commitMethod = commitMethod;
      }
         public String getCommitData(){
         return commitData;
      }
       public void setCommitData(String commitData) {
        this.commitData = commitData;
      }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
   }
