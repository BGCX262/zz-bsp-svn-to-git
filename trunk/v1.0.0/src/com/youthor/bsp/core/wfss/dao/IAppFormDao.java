/**
 * 
 */
package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.AppForm;

/**
 * @author 胡友成  2007-11-21
 *
 */
public interface IAppFormDao {
    public List queryPageAppFormByComId(Page page,String comId);
    public List getAppFormByAppId(String appId);
    public String addAppForm(AppForm appForm);
    public String updateAppForm(AppForm appForm);
    public boolean deleteAppFormByIds(String [] ids);
    public AppForm getAppFormById(String id);
    public AppForm getAppFormByCodeEditionId(String appFormCode,
            String editionId);
	public List getAppFormByAppIdEditionId(String appId, String editionId);    

}
