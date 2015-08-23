package com.youthor.bsp.view.wfss.web.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.upload.FormFile;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class ProcessAttachForm extends BaseForm{
    private String workItemId;
     private List attahFormList = new ArrayList();

    public List getAttahFormList() {
            return attahFormList;
        }

        public void setAttahFormList(List attahFormList) {
            this.attahFormList = attahFormList;
        }

    public void setUploadFile(String index, FormFile formFile) {
            this.attahFormList.add(formFile);
        }
    
     private List flowAttachTypeList = new ArrayList();

        public List getfFlowAttachTypeList() {
            return flowAttachTypeList;
        }

        public void setFlowAttachTypeList(List flowAttachTypeList) {
            this.flowAttachTypeList = flowAttachTypeList;
        }

    public void setFlowAttachType(String index, String flowAttachType) {
            this.flowAttachTypeList.add(flowAttachType);
        }

    public String getWorkItemId() {
        return workItemId;
    }

    public void setWorkItemId(String workItemId) {
        this.workItemId = workItemId;
    }
    

}
