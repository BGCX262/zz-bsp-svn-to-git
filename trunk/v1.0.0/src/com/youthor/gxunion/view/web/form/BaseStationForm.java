package com.youthor.gxunion.view.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class BaseStationForm extends BaseForm {

    /**
     * 
     */
    private static final long serialVersionUID = -3059706706215310106L;

    private String id;
    private String code;
    private String name;
    private String description;
    private float northLatitude;
    private float eastLongitude;
    private String createOrgId;
    private String createOrgName;
    private java.util.Date createTime;
    private String updateOrgId;
    private String updateOrgName;
    private java.util.Date updateTime;
    private String status;
    private String memo;

    private float northLatitude2;
    private float eastLongitude2;
    private java.util.Date createTime2;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getNorthLatitude() {
        return northLatitude;
    }

    public void setNorthLatitude(float northLatitude) {
        this.northLatitude = northLatitude;
    }

    public float getEastLongitude() {
        return eastLongitude;
    }

    public void setEastLongitude(float eastLongitude) {
        this.eastLongitude = eastLongitude;
    }

    public String getCreateOrgId() {
        return createOrgId;
    }

    public void setCreateOrgId(String createOrgId) {
        this.createOrgId = createOrgId;
    }

    public String getCreateOrgName() {
        return createOrgName;
    }

    public void setCreateOrgName(String createOrgName) {
        this.createOrgName = createOrgName;
    }

    public java.util.Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.util.Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateOrgId() {
        return updateOrgId;
    }

    public void setUpdateOrgId(String updateOrgId) {
        this.updateOrgId = updateOrgId;
    }

    public String getUpdateOrgName() {
        return updateOrgName;
    }

    public void setUpdateOrgName(String updateOrgName) {
        this.updateOrgName = updateOrgName;
    }

    public java.util.Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(java.util.Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public float getNorthLatitude2() {
        return northLatitude2;
    }

    public void setNorthLatitude2(float northLatitude2) {
        this.northLatitude2 = northLatitude2;
    }

    public float getEastLongitude2() {
        return eastLongitude2;
    }

    public void setEastLongitude2(float eastLongitude2) {
        this.eastLongitude2 = eastLongitude2;
    }

    public java.util.Date getCreateTime2() {
        return createTime2;
    }

    public void setCreateTime2(java.util.Date createTime2) {
        this.createTime2 = createTime2;
    }
}
