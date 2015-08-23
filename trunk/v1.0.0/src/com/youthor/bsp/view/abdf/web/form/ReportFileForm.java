package com.youthor.bsp.view.abdf.web.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;



public class ReportFileForm extends ActionForm {

	private static final long serialVersionUID = 4421498834744967445L;
	private String id;
    private String fileName;
    private String funModuleId;
    private String desc;
    
    private FormFile formFile;

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

	public FormFile getFormFile() {
		return formFile;
	}

	public void setFormFile(FormFile formFile) {
		this.formFile = formFile;
	}
}
