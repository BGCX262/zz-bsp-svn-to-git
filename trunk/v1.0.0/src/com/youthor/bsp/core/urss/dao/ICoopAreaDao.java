/**
 * 
 */
package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Role;


public interface ICoopAreaDao {

   
    public String addCoopArea(CoopArea coopArea);
    public String updateCoopArea(CoopArea coopArea);
    public CoopArea getCoopAreaById(String id);
    public List getAllCoopArea();
    public List getCoopAreaByAllCoopAreaId(String coopAreaId);
    public CoopArea getCoopAreaByCode(String code);
	public void deleteCoopAreaById(String string);


}
