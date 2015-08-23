package com.youthor.bsp.core.abdf.dao;

import java.util.Date;
import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.Information;

public interface IInformationDao {

    public String addInformation(Information information);
    
    public String updateInformation(Information information);
    
    public List getValidateInformations(Date date);
    
    public List getAllInformations(Page page,Information information);
    
    public List getValidateInformationsByType(String type,Date date);
    
    public Information getInformationById(String informationId);

    public void deleteInformation(Information information);
}
