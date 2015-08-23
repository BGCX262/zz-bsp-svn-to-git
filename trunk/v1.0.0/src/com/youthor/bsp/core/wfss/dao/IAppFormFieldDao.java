/**
 * 
 */
package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.AppFormField;

/**
 * @author 胡友成  2007-11-21
 *
 */
public interface IAppFormFieldDao {
    public List getAppFormFieldByFormId(String appId);
    public String addAppFormField(AppFormField appFormField);
    public String updateAppFormField(AppFormField appFormField);
    public boolean deleteAppFormFieldByIds(String [] ids);
    public AppFormField getAppFormFieldById(String id);    

}
