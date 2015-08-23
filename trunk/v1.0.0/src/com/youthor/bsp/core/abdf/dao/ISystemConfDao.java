package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.SystemConf;

public interface ISystemConfDao {
    
    public List getAllSystemConf();
    public String updateSystemConf(SystemConf model);
    public SystemConf getSystemConfById(String id);
}
