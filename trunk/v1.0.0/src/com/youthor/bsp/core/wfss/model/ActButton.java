package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;

public class ActButton implements Serializable{
    private static final long serialVersionUID = 5438270714093444822L;
        private String actButId;
       private String buttonStyleId;
       private String activityId;
       private String buttonName;
       private String extJava;
       private String jsMethod;
       private String buttonPosition;
       private String buttonGroup;
       private int orderIndex;
          public int getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }
        public String getActButId(){
         return actButId;
      }
       public void setActButId(String actButId) {
        this.actButId = actButId;
      }
         public String getButtonStyleId(){
         return buttonStyleId;
      }
       public void setButtonStyleId(String buttonStyleId) {
        this.buttonStyleId = buttonStyleId;
      }
         public String getActivityId(){
         return activityId;
      }
       public void setActivityId(String activityId) {
        this.activityId = activityId;
      }
         public String getButtonName(){
         return buttonName;
      }
       public void setButtonName(String buttonName) {
        this.buttonName = buttonName;
      }
         public String getExtJava(){
         return extJava;
      }
       public void setExtJava(String extJava) {
        this.extJava = extJava;
      }
         public String getJsMethod(){
         return jsMethod;
      }
       public void setJsMethod(String jsMethod) {
        this.jsMethod = jsMethod;
      }
         public String getButtonPosition(){
         return buttonPosition;
      }
       public void setButtonPosition(String buttonPosition) {
        this.buttonPosition = buttonPosition;
      }
         public String getButtonGroup(){
         return buttonGroup;
      }
       public void setButtonGroup(String buttonGroup) {
        this.buttonGroup = buttonGroup;
      }
   }
