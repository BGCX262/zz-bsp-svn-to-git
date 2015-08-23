package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class SubassemblyFieldForm extends BaseForm{
        private String fieldId;
       private String fieldDes;
       private String dataFieldName;
       private String webInputName;
       private String webInput;
       private String dictTypeCode;
       private String subassemblyId;
          public String getFieldId(){
         return fieldId;
      }
       public SubassemblyFieldForm setFieldId(String fieldId) {
        this.fieldId = fieldId;
        return this;
      }
         public String getFieldDes(){
         return fieldDes;
      }
       public SubassemblyFieldForm setFieldDes(String fieldDes) {
        this.fieldDes = fieldDes;
        return this;
      }
         public String getDataFieldName(){
         return dataFieldName;
      }
       public SubassemblyFieldForm setDataFieldName(String dataFieldName) {
        this.dataFieldName = dataFieldName;
        return this;
      }
         public String getWebInputName(){
         return webInputName;
      }
       public SubassemblyFieldForm setWebInputName(String webInputName) {
        this.webInputName = webInputName;
        return this;
      }
         public String getWebInput(){
         return webInput;
      }
       public SubassemblyFieldForm setWebInput(String webInput) {
        this.webInput = webInput;
        return this;
      }
         public String getDictTypeCode(){
         return dictTypeCode;
      }
       public SubassemblyFieldForm setDictTypeCode(String dictTypeCode) {
        this.dictTypeCode = dictTypeCode;
        return this;
      }
         public String getSubassemblyId(){
         return subassemblyId;
      }
       public SubassemblyFieldForm setSubassemblyId(String subassemblyId) {
        this.subassemblyId = subassemblyId;
        return this;
      }
   }
