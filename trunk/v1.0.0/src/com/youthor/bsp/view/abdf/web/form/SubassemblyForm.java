package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class SubassemblyForm extends BaseForm{
        private String subassemblyId;
       private String subassemblyName;
       private String parentId;
       private String tableName;
          public String getSubassemblyId(){
         return subassemblyId;
      }
       public void setSubassemblyId(String subassemblyId) {
        this.subassemblyId = subassemblyId;
        
      }
         public String getSubassemblyName(){
         return subassemblyName;
      }
       public void setSubassemblyName(String subassemblyName) {
        this.subassemblyName = subassemblyName;
        
      }
         public String getParentId(){
         return parentId;
      }
       public void setParentId(String parentId) {
        this.parentId = parentId;
        
      }
         public String getTableName(){
         return tableName;
      }
       public void setTableName(String tableName) {
        this.tableName = tableName;
        
      }
   }
