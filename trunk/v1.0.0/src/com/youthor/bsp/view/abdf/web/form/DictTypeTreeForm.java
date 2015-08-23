package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class DictTypeTreeForm extends BaseForm{
    private static final long serialVersionUID = -4459280257824543402L;
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

   
    private String deleteIds;//要删除的id集合。(子表中的)

    public String getDeleteIds() {
        return deleteIds;
    }
    public void setDeleteIds(String deleteIds) {
        this.deleteIds = deleteIds;
    }
    public String getModelClass() {
        return modelClass;
    }
    public void setModelClass(String modelClass) {
        this.modelClass = modelClass;
    }
    
    public String getTreeTypeCode() {
        return treeTypeCode;
    }
    public void setTreeTypeCode(String treeTypeCode) {
        this.treeTypeCode = treeTypeCode;
    }
    public String getTreeTypeId() {
        return treeTypeId;
    }
    public void setTreeTypeId(String treeTypeId) {
        this.treeTypeId = treeTypeId;
    }
    public String getTreeTypeName() {
        return treeTypeName;
    }
    public void setTreeTypeName(String treeTypeName) {
        this.treeTypeName = treeTypeName;
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
