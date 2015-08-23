package com.youthor.gxunion.core.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.gxunion.core.model.BaseStation;

public interface IBaseStationDAO {

    public List getAllValidBaseStation();
    
    public BaseStation getBaseStationById(String id);
    
    public BaseStation updateBaseStation(BaseStation model);
    
    public BaseStation addBaseStation(BaseStation model);
    
    public List getValidBaseStation(Page page,BaseStation model);    
}
