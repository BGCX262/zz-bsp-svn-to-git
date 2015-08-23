/**
 * 
 */
package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.Process;

/**
 * @author 胡友成  2007-11-21
 *
 */
public interface IProcessDao {
    public List queryPageProcessByComId(Page page,String comId);
    public List getAllProcessByComId(String comId);
    public List getProcessByAppId(String appId);
    public String addProcess(Process process);
    public String updateProcess(Process process);
    public boolean deleteProcessByIds(String [] ids);
    public Process getProcessById(String id);
    public Process getProcessByAlias(String processAlias,String isUsed);
	public List getProcessByAppIdCode(String alias, String appId);    

}
