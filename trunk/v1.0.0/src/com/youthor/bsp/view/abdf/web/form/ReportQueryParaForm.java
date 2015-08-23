package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class ReportQueryParaForm extends BaseForm{

	private static final long serialVersionUID = 6207944120847508585L;

	private String id;
    private String paraKey;
    private String name;
    private String funModuleId;
    private String inputType;
    private String dictTypeCode;
    private String notNull;
    private String paraCol;
    private String dataType;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParaKey() {
		return paraKey;
	}
	public void setParaKey(String paraKey) {
		this.paraKey = paraKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFunModuleId() {
		return funModuleId;
	}
	public void setFunModuleId(String funModuleId) {
		this.funModuleId = funModuleId;
	}
	public String getInputType() {
		return inputType;
	}
	public void setInputType(String inputType) {
		this.inputType = inputType;
	}
	public String getDictTypeCode() {
		return dictTypeCode;
	}
	public void setDictTypeCode(String dictTypeCode) {
		this.dictTypeCode = dictTypeCode;
	}
	public String getNotNull() {
		return notNull;
	}
	public void setNotNull(String notNull) {
		this.notNull = notNull;
	}
	public String getParaCol() {
		return paraCol;
	}
	public void setParaCol(String paraCol) {
		this.paraCol = paraCol;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
}
