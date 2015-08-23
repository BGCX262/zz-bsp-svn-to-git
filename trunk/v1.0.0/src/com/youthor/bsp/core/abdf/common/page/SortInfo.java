package com.youthor.bsp.core.abdf.common.page;



public class SortInfo {
    
    public final static String ORDER_ASC = "ASC";
    
    public final static String ORDER_DESC = "DESC";

    private String column;

    private String ascOrDesc = ORDER_ASC;
    
    public SortInfo(){
        
    }
    
    public SortInfo(String column,String ascOrDesc){
        this.column = column;
        this.ascOrDesc = ascOrDesc;
    }

    public String getAscOrDesc() {
        return ascOrDesc;
    }

    public void setAscOrDesc(String ascOrDesc) {
        this.ascOrDesc = ascOrDesc;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }
    
    public String toString(){
        return " order by "+column+" "+ascOrDesc;
    }

}
