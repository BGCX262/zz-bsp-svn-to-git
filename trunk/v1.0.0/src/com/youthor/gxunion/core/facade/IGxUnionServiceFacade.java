package com.youthor.gxunion.core.facade;

import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.gxunion.core.model.BaseStation;
import com.youthor.gxunion.core.model.SimpleMaterials;

public interface IGxUnionServiceFacade {

    //基站信息
    public List getAllValidBaseStation();
    public BaseStation getBaseStationById(String id);
    public BaseStation updateBaseStation(BaseStation model);
    public BaseStation addBaseStation(BaseStation model);
    public List getValidBaseStation(Page page, BaseStation model);
    
    //物料管理
    public List getAllValidSimpleMaterials();
    public SimpleMaterials getSimpleMaterialsById(String id);
    public SimpleMaterials updateSimpleMaterials(SimpleMaterials model);
    public SimpleMaterials addSimpleMaterials(SimpleMaterials model);
    public List getValidSimpleMaterials(Page page, SimpleMaterials model);
    public String submitBaseStation(BaseStation baseStation, Map map1);
    
}
