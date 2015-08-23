package com.youthor.bsp.core.demo.service;

import java.util.Map;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo2;

public interface ISimpleProcessDemoService {

    String submitSimpleProcessDemo(SimpleProcessDemo simpleProcessDemo, Map map);

    SimpleProcessDemo getSimpleProcessDemoById(String id);

    SimpleProcessDemo1 getSimpleProcessDemo1ById(String id);

    String submitSimpleProcessDemo1(SimpleProcessDemo1 simpleProcessDemo1,
            Map map1);

	SimpleProcessDemo2 getSimpleProcessDemo2ById(String id);

	String submitSimpleProcessDemo2(SimpleProcessDemo2 simpleProcessDemo2,
			Map map1);

}
