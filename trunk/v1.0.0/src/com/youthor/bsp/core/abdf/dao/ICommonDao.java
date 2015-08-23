package com.youthor.bsp.core.abdf.dao;

import java.util.Map;

public interface ICommonDao {

	Object getObjectByClassAndIdValue(Class clazz, String idValue);

	int getExistRecordNum(String className, String idProperty,
			String idPropertyValue, Map map);

	int getExistRecordNum(String className, Map map);

}
