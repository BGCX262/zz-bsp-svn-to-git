package com.youthor.bsp.core.abdf.model;

import java.util.ArrayList;
import java.util.List;

public class Subassembly {
        private String subassemblyId;
       private String subassemblyName;
       private String parentId;
       private String tableName;
       
       private List subassemblyFieldList=new ArrayList();
          public List getSubassemblyFieldList() {
        return subassemblyFieldList;
    }
    public void setSubassemblyFieldList(List subassemblyFieldList) {
        this.subassemblyFieldList = subassemblyFieldList;
    }
        public String getSubassemblyId(){
         return subassemblyId;
      }
       public Subassembly setSubassemblyId(String subassemblyId) {
        this.subassemblyId = subassemblyId;
        return this;
      }
         public String getSubassemblyName(){
         return subassemblyName;
      }
       public Subassembly setSubassemblyName(String subassemblyName) {
        this.subassemblyName = subassemblyName;
        return this;
      }
         public String getParentId(){
         return parentId;
      }
       public Subassembly setParentId(String parentId) {
        this.parentId = parentId;
        return this;
      }
         public String getTableName(){
         return tableName;
      }
       public Subassembly setTableName(String tableName) {
        this.tableName = tableName;
        return this;
      }
   }
