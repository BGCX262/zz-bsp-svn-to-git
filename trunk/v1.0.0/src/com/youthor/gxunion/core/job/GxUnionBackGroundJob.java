package com.youthor.gxunion.core.job;


import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.youthor.gxunion.core.facade.IStockMonitor;

/**
 * 后台运行进程
 * @author jason
 *
 */
public class GxUnionBackGroundJob extends QuartzJobBean{
    
    private Object manager;
    
    @Override
    protected void executeInternal(JobExecutionContext job) throws JobExecutionException {
        
        System.out.println("---GxUnionBackGroundJob start---");
        
        try{
            //库存监控进程
            if(manager instanceof IStockMonitor){
                IStockMonitor stockMonitor = (IStockMonitor)manager;
                stockMonitor.monitorStock();
            }
        }
        catch(Exception e){
            
        }
        
    }

    public Object getManager() {
        return manager;
    }

    public void setManager(Object manager) {
        this.manager = manager;
    }
}
