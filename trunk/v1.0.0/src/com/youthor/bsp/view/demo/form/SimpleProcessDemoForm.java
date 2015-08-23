package com.youthor.bsp.view.demo.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts.upload.FormFile;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class SimpleProcessDemoForm extends BaseForm{
    private static final long serialVersionUID = 4201388178041344875L;
    private String  simpleId;
    private String textDemo; 
    private Date dateDemo;
    private String selectDemo;
    private String checkBoxDemo;
    private String radioBoxDemo;
     
    
    
    public String getCheckBoxDemo() {
        return checkBoxDemo;
    }
    public void setCheckBoxDemo(String checkBoxDemo) {
        this.checkBoxDemo = checkBoxDemo;
    }
    public Date getDateDemo() {
        return dateDemo;
    }
    public void setDateDemo(Date dateDemo) {
        this.dateDemo = dateDemo;
    }
    public String getRadioBoxDemo() {
        return radioBoxDemo;
    }
    public void setRadioBoxDemo(String radioBoxDemo) {
        this.radioBoxDemo = radioBoxDemo;
    }
    public String getSelectDemo() {
        return selectDemo;
    }
    public void setSelectDemo(String selectDemo) {
        this.selectDemo = selectDemo;
    }
    public String getSimpleId() {
        return simpleId;
    }
    public void setSimpleId(String simpleId) {
        this.simpleId = simpleId;
    }
    public String getTextDemo() {
        return textDemo;
    }
    public void setTextDemo(String textDemo) {
        this.textDemo = textDemo;
    }
    
    

}
