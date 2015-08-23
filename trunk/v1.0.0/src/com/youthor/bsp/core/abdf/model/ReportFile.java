package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ReportFile implements Serializable{
      

    private static final long serialVersionUID = 6963505851394036749L;
        private String id;
        private String fileName;
        private String funModuleId;
        private String desc;
        private String funCode;
        public String getFunCode() {
			return funCode;
		}
		public void setFunCode(String funCode) {
			this.funCode = funCode;
		}
		public String getId() {
            return id;
        }
        public void setId(String id) {
            this.id = id;
        }
        public String getFileName() {
            return fileName;
        }
        public void setFileName(String fileName) {
            this.fileName = fileName;
        }
        public String getFunModuleId() {
            return funModuleId;
        }
        public void setFunModuleId(String funModuleId) {
            this.funModuleId = funModuleId;
        }
        public String getDesc() {
            return desc;
        }
        public void setDesc(String desc) {
            this.desc = desc;
        }
       

}
