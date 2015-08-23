package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IFavoriteDao;
import com.youthor.bsp.core.abdf.model.Favorite;
import com.youthor.bsp.core.abdf.model.FavoriteItem;

public class FavoriteDaoImpl extends BaseDAOHibernate implements IFavoriteDao{

protected Class getModelClass() {
    return Favorite.class;
  }


public List getFavoriteByOrgId(String orgId) {
    String hql = "from "+Favorite.class.getName()+ " as f where f.orgId = '"+orgId+"'";
    return this.doFind(hql);
}



public String addFavorite(Favorite favorite) {
    Session session = this.getSession();
    session.save(favorite);
    return favorite.getFavoriteId();
}



public String addFavoriteItem(FavoriteItem favoriteItem) {
    Session session = this.getSession();
    session.save(favoriteItem);
    return favoriteItem.getId();
}



public List getFavoriteItemByOrgId(String orgId) {
    String hql = "from "+FavoriteItem.class.getName()+ " as f where f.orgId = '"+orgId+"'";
    return this.doFind(hql);
} 
}
