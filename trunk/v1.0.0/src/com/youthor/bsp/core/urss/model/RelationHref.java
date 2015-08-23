package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

public class RelationHref implements Serializable{
    private static final long serialVersionUID = -3946217180665421499L;
    private String relationHrefId;
    private String funModuleId;
    private String funModuleName;
    private String resourceId;
    private String relationName;
    private String dynamic;
    private String javaImpl;
    private String jsImpl;
    private float orderIndex;
    public String getDynamic() {
        return dynamic;
    }
    public void setDynamic(String dynamic) {
        this.dynamic = dynamic;
    }
    public String getFunModuleId() {
        return funModuleId;
    }
    public void setFunModuleId(String funModuleId) {
        this.funModuleId = funModuleId;
    }
    public String getFunModuleName() {
        return funModuleName;
    }
    public void setFunModuleName(String funModuleName) {
        this.funModuleName = funModuleName;
    }
    public String getJavaImpl() {
        return javaImpl;
    }
    public void setJavaImpl(String javaImpl) {
        this.javaImpl = javaImpl;
    }
    public String getJsImpl() {
        return jsImpl;
    }
    public void setJsImpl(String jsImpl) {
        this.jsImpl = jsImpl;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getRelationHrefId() {
        return relationHrefId;
    }
    public void setRelationHrefId(String relationHrefId) {
        this.relationHrefId = relationHrefId;
    }
    public String getRelationName() {
        return relationName;
    }
    public void setRelationName(String relationName) {
        this.relationName = relationName;
    }
    public String getResourceId() {
        return resourceId;
    }
    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }
    
}
