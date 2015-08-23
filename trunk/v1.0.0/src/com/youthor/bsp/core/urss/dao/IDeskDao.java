/**
 * 
 */
package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.Desk;
import com.youthor.bsp.core.urss.model.RegCompany;

/**
 * @author 胡友成  2007-11-3
 *
 */
public interface IDeskDao {
    public List queryPageDeskByComId(Page page,String comId);
    public String addDesk(Desk desk);
    public String updateDesk(Desk desk);
    public boolean deleteDeskByIds(String [] ids);
    public Desk getDeskById(String id);
    public List queryPageDeskByUserId(Page page, String comId, String userId);
}
