package com.youthor.bsp.core.abdf.model;
public class FormLayout {
        private String formLayoutId;
       private String propertyName;
       private String propertyDes;
       private String inputType;
       private String inputKey;
       private int cols;
       private int orderIndex;
       private String parentId;
       private String propertyDataType;
       private String layoutGroup;
       
      
          public String getLayoutGroup() {
        return layoutGroup;
    }
    public void setLayoutGroup(String layoutGroup) {
        this.layoutGroup = layoutGroup;
    }
    
         public String getFormLayoutId() {
        return formLayoutId;
    }
    public void setFormLayoutId(String formLayoutId) {
        this.formLayoutId = formLayoutId;
    }
    public String getPropertyName(){
         return propertyName;
      }
       public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
      }
         public String getPropertyDes(){
         return propertyDes;
      }
       public void setPropertyDes(String propertyDes) {
        this.propertyDes = propertyDes;
      }
         public String getInputType(){
         return inputType;
      }
       public void setInputType(String inputType) {
        this.inputType = inputType;
      }
         public String getInputKey(){
         return inputKey;
      }
       public void setInputKey(String inputKey) {
        this.inputKey = inputKey;
      }
         public int getCols(){
         return cols;
      }
       public void setCols(int cols) {
        this.cols = cols;
      }
        
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public int getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getPropertyDataType() {
        return propertyDataType;
    }
    public void setPropertyDataType(String propertyDataType) {
        this.propertyDataType = propertyDataType;
    }
   }
