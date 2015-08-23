package com.youthor.bsp.view.abdf.common.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class TreeForm extends BaseForm{
    private static final long serialVersionUID = -8620626913250249518L;
    private String id; //数据库id
    private String  name; //名称
    private String  parentId; //父id
    private String  allParentId; //所有父id
    private String  allParentName;//所有父名称���и����
    private float orderIndex;//排序号
    private String deleteFlag="N";
    public String getDeleteFlag() {
        return deleteFlag;
    }
    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
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
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public String getAllParentId() {
        return allParentId;
    }
    public void setAllParentId(String allParentId) {
        this.allParentId = allParentId;
    }
    public String getAllParentName() {
        return allParentName;
    }
    public void setAllParentName(String allParentName) {
        this.allParentName = allParentName;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    

}
