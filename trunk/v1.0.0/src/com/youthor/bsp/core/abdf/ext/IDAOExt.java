package com.youthor.bsp.core.abdf.ext;

import java.util.Map;

import org.hibernate.Session;

public interface IDAOExt {
     public void execute(Session session,Map parMap);
}
