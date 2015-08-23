package com.youthor.bsp.core.demo.dao;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo2;

public interface ISimpleProcessDemoDAO {

    String updateSimpleProcessDemo(SimpleProcessDemo simpleProcessDemo);

    String addSimpleProcessDemo(SimpleProcessDemo simpleProcessDemo);

    SimpleProcessDemo getSimpleProcessDemoById(String id);

    SimpleProcessDemo1 getSimpleProcessDemo1ById(String id);

    String addSimpleProcessDemo1(SimpleProcessDemo1 simpleProcessDemo1);

    String updateSimpleProcessDemo1(SimpleProcessDemo1 simpleProcessDemo1);

	SimpleProcessDemo2 getSimpleProcessDemo2ById(String id);

	String addSimpleProcessDemo2(SimpleProcessDemo2 simpleProcessDemo2);

	String updateSimpleProcessDemo2(SimpleProcessDemo2 simpleProcessDemo2);



}
