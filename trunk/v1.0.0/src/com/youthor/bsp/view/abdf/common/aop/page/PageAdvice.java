package com.youthor.bsp.view.abdf.common.aop.page;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.beanutils.BeanUtils;
import com.youthor.bsp.core.abdf.common.page.model.Page;





public class PageAdvice implements MethodInterceptor {

    public Object invoke(MethodInvocation invocation) throws Throwable {
        // TODO Auto-generated method stub
        HttpServletRequest request = (HttpServletRequest)invocation.getArguments()[2];
        Page page=initPageInfo(request);
        storePage(request,page);
        Object result = null;
        try{
        result = invocation.proceed();
        }catch(Exception e){
            e.printStackTrace();
            throw new Exception(e);
        }finally{
            
        }
        return result;
    }
    
    
    private void storePage(HttpServletRequest request,Page page){
        request.setAttribute(Page.PAGE_INFO, page);
    }
    private Page initPageInfo(HttpServletRequest request){
        Page page = new Page();
        String currentPageNo = request.getParameter("page.currentPage");
        if(null==currentPageNo||currentPageNo.equals("")) return page;
        Map paramMap = request.getParameterMap();
        populatePageParam(page,paramMap);
        return page;
    }
    
    private void populatePageParam(Page page,Map map){
        try{
        BeanUtils.populate(page, filterMap(map));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    private Map filterMap(Map map){
        Map newMap = new HashMap();
        Iterator names = map.keySet().iterator();
        while (names.hasNext()) {
            // Identify the property name and value(s) to be assigned
            String name = (String) names.next();
            if (name == null) {
                continue;
            }
            if(name.startsWith("page")) newMap.put(name.substring(name.indexOf("page.")+5, name.length()), map.get(name));
        }
        return newMap;
    }
}
