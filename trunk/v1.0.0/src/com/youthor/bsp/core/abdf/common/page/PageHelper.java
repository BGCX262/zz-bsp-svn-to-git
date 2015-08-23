
package com.youthor.bsp.core.abdf.common.page;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanComparator;
import org.hibernate.Query;
import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.common.page.model.SortInfo;



public class PageHelper {
    
    public final static String PAGE_OBJECTS_LIST = "page_objects_list";
    
    public static String getSortHql(String alias,String column,String ascOrDesc){
        return null;
    }
    

    
    
    public static List pageForWithoutDb(Page page,List list){
    
        int totalNum = list.size();
        setTotalNum(page,totalNum);
        int startNum = page.getStartNum();
        int pageSize = page.getPageSize();
        int dataNum = startNum + pageSize -1;
        if(dataNum>totalNum){
            dataNum = totalNum;
        }
        list = sortList(page,list);
        list = list.subList(startNum-1, dataNum);
        return list;
        
    }
    
    
    private static List sortList(Page page,List list){
        String column = page.getSortInfo().getColumn();
        String sortType = page.getSortInfo().getAscOrDesc();
        if(column == null||column.equals("null")) return list;
        if(column.indexOf(".")>0){
        column = column.substring(column.indexOf(".")+1,column.length());
        }
        Collections.sort(list, new BeanComparator(column));
        if(sortType.equals(SortInfo.ORDER_ASC)){
            return list;
        }
        Collections.reverse(list);
        return list;
    }
    

    public static void setTotalNum(Page page ,int totalNum){
        if(page==null){
            page = new Page();
        }
        page.setTotalNumber(totalNum);
    }
    
    
    public static void setSortColumn(Page page,String column){
        page.getSortInfo().setColumn(column);
    }
    
    
    public static void setPageSize(Page page,int pageSize){
        page.setPageSize(pageSize);
    }
    

    public static Query executeQuery(Page page,Session session,String hql,Object obj){
        if(hql.indexOf("from")<0) return null;
        if(page==null)
        {
            Query queryNoPage = session.createQuery(hql);
            setParam(queryNoPage,obj);
            return queryNoPage;
        }
        executeQueryCountNum(page,hql,session,obj);
        Query query = session.createQuery(createSortHql(hql,page));
        setParam(query,obj);
        query.setFirstResult(page.getStartNum()-1);
        query.setMaxResults(page.getPageSize());
        return query;
    }
    
    
    public static Query executeQuery(Page page,Session session,String hql){
        return executeQuery(page,session,hql,null);
    }
    
    private static void setParamForMap(Query query,Map map){
        if(map==null) return;
        Iterator iterator = map.keySet().iterator();
        while(iterator.hasNext()){
            String key = (String) iterator.next();
            query.setParameter(key, map.get(key));
        }
    }
    
    private static void setParamForList(Query query,List list){
        if(list==null)return;
        for(int i=0;i<list.size();i++){
            query.setParameter(i, list.get(i));
        }
    }
    
    private static void executeQueryCountNum(Page page, String hql,Session session,Object obj){
        String countHql = hql;
         countHql = removeOldSort(hql);
        Query query = session.createQuery(createCountHql(countHql));
        setParam(query,obj);
        int totalNum = ((Integer)query.uniqueResult()).intValue();
        storeTotalNum(totalNum,page);
    }

    private static void setParam(Query query,Object obj){
        if(obj instanceof Map){
            setParamForMap(query,(Map)obj);
        }
       if(obj instanceof List){
            setParamForList(query,(List)obj);
        }
    }
    
    
    private static String createSortHql(String hql,Page page){
        if(page.getSortInfo().getColumn()==null||page.getSortInfo().getColumn().equals("null")||page.getSortInfo().getColumn().equals("")){
            return hql;
        }
        return removeOldSort(hql)+page.getSortInfo();
    }
    
    private static String removeOldSort(String hql){
        String newHql = hql;
        if(hql.indexOf("order by")>=0){
            newHql = hql.substring(0, hql.indexOf("order by"));
            }
        return newHql;
    }
    
    
    private static String createCountHql(String hql){
        String str  = "";
        if(hql.indexOf("distinct")>0){
            hql = hql.substring(hql.indexOf("select")+6,hql.length());
            String tempStr = hql.substring(0,hql.indexOf("from"));
            String tempStr2 = hql.substring(hql.indexOf("from")+4,hql.length());
            str = "select count("+tempStr.trim()+") from "+tempStr2;
            System.out.println("str==="+str);
            return str;
        }else{
        str = "select count(*) ";
        String countHql = str + hql.substring(hql.indexOf("from"), hql.length());
        return countHql;
        }
    }
    
    
    private static void storeTotalNum(int totalNum,Page page){
        page.setTotalNumber(totalNum);;
    }

}
