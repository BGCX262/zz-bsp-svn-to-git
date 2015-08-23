package com.youthor.gxunion.core.facade.impl;

import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.common.dao.IFlowEngineDAO;
import com.youthor.gxunion.core.dao.IBaseStationDAO;
import com.youthor.gxunion.core.dao.ISimpleMaterialsDAO;
import com.youthor.gxunion.core.facade.IGxUnionServiceFacade;
import com.youthor.gxunion.core.model.BaseStation;
import com.youthor.gxunion.core.model.SimpleMaterials;

public class GxUnionServiceFacade implements IGxUnionServiceFacade{

    private IBaseStationDAO baseStationDAO;
    private ISimpleMaterialsDAO simpleMaterialsDAO;
    private IFlowEngineDAO flowEngineDAO;
    

    public void setFlowEngineDAO(IFlowEngineDAO flowEngineDAO) {
        this.flowEngineDAO = flowEngineDAO;
    }

    public BaseStation addBaseStation(BaseStation model) {
        return baseStationDAO.addBaseStation(model);
    }

    @Override
    public List getAllValidBaseStation() {
        return baseStationDAO.getAllValidBaseStation();
    }

    @Override
    public BaseStation getBaseStationById(String id) {
        return baseStationDAO.getBaseStationById(id);
    }

    @Override
    public List getValidBaseStation(Page page, BaseStation model) {
        return baseStationDAO.getValidBaseStation(page, model);
    }

    @Override
    public BaseStation updateBaseStation(BaseStation model) {
        return baseStationDAO.updateBaseStation(model);
    }

    @Override
    public SimpleMaterials addSimpleMaterials(SimpleMaterials model) {
        return simpleMaterialsDAO.addSimpleMaterials(model);
    }

    @Override
    public List getAllValidSimpleMaterials() {
        return simpleMaterialsDAO.getAllSimpleValidMaterials();
    }

    @Override
    public SimpleMaterials getSimpleMaterialsById(String id) {
        return simpleMaterialsDAO.getSimpleMaterialsById(id);
    }

    @Override
    public List getValidSimpleMaterials(Page page, SimpleMaterials model) {
        return simpleMaterialsDAO.getValidSimpleMaterials(page, model);
    }

    @Override
    public SimpleMaterials updateSimpleMaterials(SimpleMaterials model){
        return simpleMaterialsDAO.updateSimpleMaterials(model);
    }
    
    public IBaseStationDAO getBaseStationDAO() {
        return baseStationDAO;
    }

    public void setBaseStationDAO(IBaseStationDAO baseStationDAO) {
        this.baseStationDAO = baseStationDAO;
    }
    
    public ISimpleMaterialsDAO getSimpleMaterialsDAO() {
        return simpleMaterialsDAO;
    }

    public void setSimpleMaterialsDAO(ISimpleMaterialsDAO simpleMaterialsDAO) {
        this.simpleMaterialsDAO = simpleMaterialsDAO;
    }

    
    public String submitBaseStation(BaseStation baseStation, Map map1) {
    String returnValue=baseStation.getId();
        
        if(StringHelper.doWithNull(returnValue).equals(""))
        {
            //选保存业务数据
            returnValue=baseStationDAO.addBaseStation(baseStation).getId();
            //后绑定流程
            this.flowEngineDAO.startup(map1, baseStation.getName(), returnValue);
        }
        else
        {
            //只要保存业务数据就可以了。
            returnValue=baseStationDAO.updateBaseStation(baseStation).getId();
            //同时更新待办标题
        }
        this.flowEngineDAO.run(map1, baseStation.getName(), returnValue);
        
        return returnValue;
    }
}
