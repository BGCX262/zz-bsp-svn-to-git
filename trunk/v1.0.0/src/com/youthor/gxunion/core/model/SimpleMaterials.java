package com.youthor.gxunion.core.model;

public class SimpleMaterials {
    private String id;
    private String code;
    private String name;
    private float inventory;
    private float warningMinValue;
    private String principalEmail;
    private String status;

    private float inventory2;
    private float warningMinValue2;
    
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

    public float getInventory() {
        return inventory;
    }

    public void setInventory(float inventory) {
        this.inventory = inventory;
    }

    public float getWarningMinValue() {
        return warningMinValue;
    }

    public void setWarningMinValue(float warningMinValue) {
        this.warningMinValue = warningMinValue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getInventory2() {
        return inventory2;
    }

    public void setInventory2(float inventory2) {
        this.inventory2 = inventory2;
    }

    public float getWarningMinValue2() {
        return warningMinValue2;
    }

    public void setWarningMinValue2(float warningMinValue2) {
        this.warningMinValue2 = warningMinValue2;
    }

    public String getPrincipalEmail() {
        return principalEmail;
    }

    public void setPrincipalEmail(String principalEmail) {
        this.principalEmail = principalEmail;
    }
}
