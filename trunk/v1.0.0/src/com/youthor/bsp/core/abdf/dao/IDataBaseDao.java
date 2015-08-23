package com.youthor.bsp.core.abdf.dao;

import java.util.List;

public interface IDataBaseDao {
    
    public List getDataTable();
    public List getDataTableField(String tableName);

}
