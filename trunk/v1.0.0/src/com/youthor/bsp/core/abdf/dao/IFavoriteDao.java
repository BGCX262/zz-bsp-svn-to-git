package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.Favorite;
import com.youthor.bsp.core.abdf.model.FavoriteItem;

public interface IFavoriteDao {

    List getFavoriteByOrgId(String orgId);

    String addFavorite(Favorite favorite);

    String addFavoriteItem(FavoriteItem favoriteItem);

    List getFavoriteItemByOrgId(String orgId);

}
