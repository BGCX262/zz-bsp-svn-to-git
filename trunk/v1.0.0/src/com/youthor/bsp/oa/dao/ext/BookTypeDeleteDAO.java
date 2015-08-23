package com.youthor.bsp.oa.dao.ext;

import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.ext.IDAOExt;

public class BookTypeDeleteDAO implements IDAOExt{

    public void execute(Session session, Map parMap) {
        String treeNodeId = (String)parMap.get("treeNodeId");
        System.out.println("treeNodeId=="+treeNodeId);
        
    }

}
