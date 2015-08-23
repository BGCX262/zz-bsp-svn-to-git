
package com.youthor.bsp.core.abdf.common.page.model;


public class PageList {
    
    private Page page;
    
    
    private SortInfo sortInfo;
    
    public PageList(Page page,SortInfo sortInfo){
        this.page = page;
        this.sortInfo = sortInfo;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public SortInfo getSortInfo() {
        return sortInfo;
    }

    public void setSortInfo(SortInfo sortInfo) {
        this.sortInfo = sortInfo;
    }

}
