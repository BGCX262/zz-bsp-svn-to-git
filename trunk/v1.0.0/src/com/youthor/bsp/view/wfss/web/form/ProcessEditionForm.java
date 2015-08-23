package com.youthor.bsp.view.wfss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class ProcessEditionForm extends BaseForm {
    private String id;
    private String name;
    private String deleteFlag;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
