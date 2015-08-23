package com.youthor.bsp.core.abdf.common.page.model;

public class Page {
    
    public final static String PAGE_INFO = "page_info";
    
    
    private int pageSize = 0;

    private int totalNumber;

    
    private int totalPage;

    
    private int currentPage = 1;
 
    private Object queryObject;
    
    private boolean hasPrevious = false;

    private boolean hasNext = false;

    
    private int startNum;

    
    private SortInfo sortInfo = new SortInfo();
    
    public Page(){
        
    }
    
    
    public Page(int pageSize, int totalNum, int currentPageNo)
    {
        this.totalNumber = totalNum;
        this.currentPage = currentPageNo;
        this.pageSize = pageSize;
        this.totalPage = (totalNumber - 1) / pageSize + 1;
        this.hasPrevious = currentPage <= 1 ? false : true;
        this.hasNext = currentPage >= totalPage ? false : true;
        this.startNum = (currentPage - 1) * pageSize + 1;

    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }


    public boolean isHasNext() {
        return this.getCurrentPage() >= this.getTotalPage() ? false : true;
    }

    public void setHasNext(boolean hasNext) {
        this.hasNext = hasNext;
    }

    public boolean isHasPrevious() {
        return currentPage <= 1 ? false : true;
    }

    public void setHasPrevious(boolean hasPrevious) {
        this.hasPrevious = hasPrevious;
    }

    public int getPageSize() {
        return pageSize==0?30:pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStartNum() {
        return (this.getCurrentPage() - 1) * this.getPageSize() + 1;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

    public int getTotalPage() {
        return (totalNumber - 1) / this.getPageSize() + 1;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public SortInfo getSortInfo() {
        return sortInfo;
    }

    public void setSortInfo(SortInfo sortInfo) {
        this.sortInfo = sortInfo;
    }


    public Object getQueryObject() {
        return queryObject;
    }


    public void setQueryObject(Object queryObject) {
        this.queryObject = queryObject;
    }
    
    

}
