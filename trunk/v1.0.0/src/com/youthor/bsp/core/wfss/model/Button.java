package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;

public class Button implements Serializable{

    private static final long serialVersionUID = -3791121147415966052L;
       private String buttonId;
       private String buttonStyleId;
       private String buttonName;
       private String buttonPosition;
       private String jsMethod;
       private int orderIndex;
        
        public int getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }
        public String getButtonId(){
         return buttonId;
      }
       public void setButtonId(String buttonId) {
        this.buttonId = buttonId;
      }
         public String getButtonStyleId(){
         return buttonStyleId;
      }
       public void setButtonStyleId(String buttonStyleId) {
        this.buttonStyleId = buttonStyleId;
      }
         public String getButtonName(){
         return buttonName;
      }
       public void setButtonName(String buttonName) {
        this.buttonName = buttonName;
      }
         public String getButtonPosition(){
         return buttonPosition;
      }
       public void setButtonPosition(String buttonPosition) {
        this.buttonPosition = buttonPosition;
      }
         public String getJsMethod(){
         return jsMethod;
      }
       public void setJsMethod(String jsMethod) {
        this.jsMethod = jsMethod;
      }
   }
