package com.youthor.bsp.core.urss.common.model;

import java.util.List;

public class MrgRightMenu {
    private String name;
    private String url;
    private String show;
    private String type;
    private List subMeu;
    
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getShow() {
        return show;
    }
    public void setShow(String show) {
        this.show = show;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public List getSubMeu() {
        return subMeu;
    }
    public void setSubMeu(List subMeu) {
        this.subMeu = subMeu;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    

}
