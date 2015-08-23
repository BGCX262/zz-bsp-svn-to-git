package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.RegCompany;

public interface IRegCompanyDao {
    public List queryPageRegCompany(Page page,RegCompany regCompany);
    public String addRegCompany(RegCompany regCompany);
    public String updateRegCompany(RegCompany regCompany);
    public boolean deleteRegCompanyByIds(String [] ids);
    public RegCompany getRegCompanyById(String id);
    public List getCanAddUserComs();
    
}
