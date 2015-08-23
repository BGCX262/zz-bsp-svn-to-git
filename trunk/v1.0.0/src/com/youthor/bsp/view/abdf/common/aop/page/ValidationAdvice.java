package com.youthor.bsp.view.abdf.common.aop.page;

import javax.servlet.http.HttpServletRequest;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class ValidationAdvice  implements MethodInterceptor{
	public Object invoke(MethodInvocation invocation) throws Throwable {
        // TODO Auto-generated method stub
        HttpServletRequest request = (HttpServletRequest)invocation.getArguments()[2];
        Object result = null;
        System.out.println("gggg");
        try{
            result = invocation.proceed();
            }
        catch(Exception e){
                e.printStackTrace();
                throw new Exception(e);
            }
        finally{
                
            }
        
        return result;
    }
}
