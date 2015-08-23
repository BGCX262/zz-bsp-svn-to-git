package com.youthor.bsp.core.abdf.common.model;

public class Url {
   private String href;
   private String name;
   private int alertTime;
   private boolean isOftenUse;
   private boolean isPublic;
   private boolean isLog;
   private boolean needLogData;
   
    public boolean getNeedLogData() {
    return needLogData;
}
public void setNeedLogData(boolean needLogData) {
    this.needLogData = needLogData;
}
    public boolean getIsLog() {
    return this.isLog;
}
public void setIsLog(boolean isLog) {
    this.isLog = isLog;
}
    public String getHref() {
        return href;
    }
    public void setHref(String href) {
        this.href = href;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAlertTime() {
        return alertTime;
    }
    public void setAlertTime(int alertTime) {
        this.alertTime = alertTime;
    }
    public boolean isOftenUse() {
        return isOftenUse;
    }
    public void setOftenUse(boolean isOftenUse) {
        this.isOftenUse = isOftenUse;
    }
    public boolean getIsPublic() {
        return isPublic;
    }
    public void setIsPublic(boolean isPublic) {
        this.isPublic = isPublic;
    }
}
