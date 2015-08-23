package com.youthor.bsp.view.demo.wfwxt;

import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.common.criterion.IProcessEndEvent;

public class ProcessEndTest1 implements IProcessEndEvent{

    public void execute(Session session, Map map) {
        System.out.println("测试流程启动后事件");
        
    }

}
