package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;

public class DictTree implements Serializable{
    private static final long serialVersionUID = 2674544948760467234L;
    private String treeId; //数据库id
    private String  treeName; //名称
    private String  treeType; //类型
    private String  parentId; //父id
    private String  allParentId; //所有父id
    private String  allParentName;//所有父名称���и����
    private float orderShow;//排序号
    
    public float getOrderShow() {
        return orderShow;
    }
    public void setOrderShow(float orderShow) {
        this.orderShow = orderShow;
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
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public String getTreeId() {
        return treeId;
    }
    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }
    public String getTreeName() {
        return treeName;
    }
    public void setTreeName(String treeName) {
        this.treeName = treeName;
    }
    public String getTreeType() {
        return treeType;
    }
    public void setTreeType(String treeType) {
        this.treeType = treeType;
    }
}
