package com.youthor.bsp.core.abdf.model;

import java.util.ArrayList;
import java.util.List;

public class DictTreeType {
       private String treeTypeId;
       private String treeTypeName;
       private String treeTypeCode;
       private String modelClass;
       private String treeStyle;
       private String importJs;
       private String extCheckMethod;
       private String delMode;
       private String formId;
       private String moduleCode;
       private String deleteExt;
       
       private List subPropertyList=new ArrayList();
       
       private String deleteIds;//要删除的id集合。(子表中的)
      
          public String getTreeTypeId(){
         return treeTypeId;
      }
       public void setTreeTypeId(String treeTypeId) {
        this.treeTypeId = treeTypeId;
      }
         public String getTreeTypeName(){
         return treeTypeName;
      }
       public void setTreeTypeName(String treeTypeName) {
        this.treeTypeName = treeTypeName;
      }
         public String getTreeTypeCode(){
         return treeTypeCode;
      }
       public void setTreeTypeCode(String treeTypeCode) {
        this.treeTypeCode = treeTypeCode;
      }
         public String getModelClass(){
         return modelClass;
      }
       public void setModelClass(String modelClass) {
        this.modelClass = modelClass;
      }
    public List getSubPropertyList() {
        return subPropertyList;
    }
    public void setSubPropertyList(List subPropertyList) {
        this.subPropertyList = subPropertyList;
    }
    public String getDeleteIds() {
        return deleteIds;
    }
    public void setDeleteIds(String deleteIds) {
        this.deleteIds = deleteIds;
    }
    public String getDelMode() {
        return delMode;
    }
    public void setDelMode(String delMode) {
        this.delMode = delMode;
    }
    public String getExtCheckMethod() {
        return extCheckMethod;
    }
    public void setExtCheckMethod(String extCheckMethod) {
        this.extCheckMethod = extCheckMethod;
    }
    public String getImportJs() {
        return importJs;
    }
    public void setImportJs(String importJs) {
        this.importJs = importJs;
    }
    public String getTreeStyle() {
        return treeStyle;
    }
    public void setTreeStyle(String treeStyle) {
        this.treeStyle = treeStyle;
    }
    public String getFormId() {
        return formId;
    }
    public void setFormId(String formId) {
        this.formId = formId;
    }
    public String getModuleCode() {
        return moduleCode;
    }
    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }
    public String getDeleteExt() {
        return deleteExt;
    }
    public void setDeleteExt(String deleteExt) {
        this.deleteExt = deleteExt;
    }
    
    
        
   
   }
