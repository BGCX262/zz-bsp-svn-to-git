package com.youthor.bsp.core.demo.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.demo.dao.ISimpleProcessDemoDAO;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo2;
import com.youthor.bsp.core.demo.service.ISimpleProcessDemoService;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.wfss.common.dao.IFlowEngineDAO;
import com.youthor.bsp.core.wfss.common.helper.FlowDataHelper;
import com.youthor.bsp.core.wfss.common.model.WfActorProperty;
import com.youthor.bsp.core.wfss.common.model.WfOrg;
import com.youthor.bsp.core.wfss.model.Route;

public class SimpleProcessDemoServiceImpl  implements ISimpleProcessDemoService{
    private ISimpleProcessDemoDAO simpleProcessDemoDAO;
    private IFlowEngineDAO flowEngineDAO;

    public void setFlowEngineDAO(IFlowEngineDAO flowEngineDAO) {
        this.flowEngineDAO = flowEngineDAO;
    }

    public void setSimpleProcessDemoDAO(ISimpleProcessDemoDAO simpleProcessDemoDAO) {
        this.simpleProcessDemoDAO = simpleProcessDemoDAO;
    }

    public String submitSimpleProcessDemo(SimpleProcessDemo simpleProcessDemo, Map map) {
        
        String returnValue=simpleProcessDemo.getSimpleId();
        
        if(StringHelper.doWithNull(returnValue).equals(""))
        {
            //选保存业务数据
            returnValue=simpleProcessDemoDAO.addSimpleProcessDemo(simpleProcessDemo);
            //后绑定流程
            this.flowEngineDAO.startup(map, simpleProcessDemo.getTextDemo(), returnValue);
        }
        else
        {
            //只要保存业务数据就可以了。
            returnValue=simpleProcessDemoDAO.updateSimpleProcessDemo(simpleProcessDemo);
            //同时更新待办标题
        }
        this.flowEngineDAO.run(map, simpleProcessDemo.getTextDemo(), returnValue);
        
        return returnValue;
    }

    public SimpleProcessDemo getSimpleProcessDemoById(String id) {
        // TODO Auto-generated method stub
        return simpleProcessDemoDAO.getSimpleProcessDemoById(id);
    }

    @Override
    public SimpleProcessDemo1 getSimpleProcessDemo1ById(String id) {
        // TODO Auto-generated method stub
        return simpleProcessDemoDAO.getSimpleProcessDemo1ById(id);
    }

    @Override
    public String submitSimpleProcessDemo1(
            SimpleProcessDemo1 simpleProcessDemo1, Map map) {
           String returnValue=simpleProcessDemo1.getSimpleId();
            
            if(StringHelper.doWithNull(returnValue).equals(""))
            {
                //选保存业务数据
                returnValue=simpleProcessDemoDAO.addSimpleProcessDemo1(simpleProcessDemo1);
                //后绑定流程
                this.flowEngineDAO.startup(map, null, returnValue);
            }
            else
            {
                //只要保存业务数据就可以了。
                returnValue=simpleProcessDemoDAO.updateSimpleProcessDemo1(simpleProcessDemo1);
                //同时更新待办标题
            }
            this.flowEngineDAO.run(map, null, returnValue);
            
            return returnValue;
    }

	@Override
	public SimpleProcessDemo2 getSimpleProcessDemo2ById(String id) {
		return simpleProcessDemoDAO.getSimpleProcessDemo2ById(id);
	}

	@Override
	public String submitSimpleProcessDemo2(
			SimpleProcessDemo2 simpleProcessDemo2, Map map) {
        String returnValue=simpleProcessDemo2.getSimpleId();
        
        if(StringHelper.doWithNull(returnValue).equals(""))
        {
            //选保存业务数据
            returnValue=simpleProcessDemoDAO.addSimpleProcessDemo2(simpleProcessDemo2);
            //后绑定流程
            this.flowEngineDAO.startup(map, null, returnValue);
        }
        else
        {
            //只要保存业务数据就可以了。
            returnValue=simpleProcessDemoDAO.updateSimpleProcessDemo2(simpleProcessDemo2);
            //同时更新待办标题
        }
        this.flowEngineDAO.run(map, null, returnValue);
        
        return returnValue;
	}

}
