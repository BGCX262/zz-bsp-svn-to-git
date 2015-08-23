package com.youthor.gxunion.core.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.gxunion.core.model.SimpleMaterials;

public interface ISimpleMaterialsDAO {

    public List getAllSimpleValidMaterials();
    
    public SimpleMaterials getSimpleMaterialsById(String id);
    
    public SimpleMaterials updateSimpleMaterials(SimpleMaterials model);
    
    public SimpleMaterials addSimpleMaterials(SimpleMaterials model);
    
    public List getValidSimpleMaterials(Page page,SimpleMaterials model);    
}
