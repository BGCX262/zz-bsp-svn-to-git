package com.youthor.bsp.core.wfss.model;

import java.util.ArrayList;
import java.util.List;

public class ProcessEdition {
    private String id;
    private String name;
    private String deleteFlag;
    private String comId;
    private List processs = new ArrayList();
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }
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
	public List getProcesss() {
		return processs;
	}
	public void setProcesss(List processs) {
		this.processs = processs;
	}
    
    
}
