package com.youthor.bsp.view.wfss.web.form;



import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class ButtonForm  extends BaseForm{

    
       private String buttonId;
       private String buttonStyleId;
       private String buttonName;
       private String [] buttonPositions;
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
        
         public String[] getButtonPositions() {
        return buttonPositions;
    }
    public void setButtonPositions(String[] buttonPositions) {
        this.buttonPositions = buttonPositions;
    }
    public String getJsMethod(){
         return jsMethod;
      }
       public void setJsMethod(String jsMethod) {
        this.jsMethod = jsMethod;
      }
   }
