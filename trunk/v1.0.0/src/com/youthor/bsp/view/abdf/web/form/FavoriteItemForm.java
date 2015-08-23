package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class FavoriteItemForm extends BaseForm{
       private String id;
       private String name;
       private String favoriteId;
       private String url;
       private String orgId;
       private String orgName;
       private String isNewFavorite;
       private String  favoriteName;
       private String allParentId; 
       private String allParentName; 
       private String favoriteNameView;
       
    public String getFavoriteNameView() {
        return favoriteNameView;
    }
    public void setFavoriteNameView(String favoriteNameView) {
        this.favoriteNameView = favoriteNameView;
    }
    public String getAllParentId() {
        return allParentId;
    }
    public void setAllParentId(String allParentId) {
        this.allParentId = allParentId;
    }
    public String getAllParentName() {
        return allParentName;
    }
    public void setAllParentName(String allParentName) {
        this.allParentName = allParentName;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getFavoriteId() {
        return favoriteId;
    }
    public void setFavoriteId(String favoriteId) {
        this.favoriteId = favoriteId;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getOrgId() {
        return orgId;
    }
    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    public String getOrgName() {
        return orgName;
    }
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
    public String getIsNewFavorite() {
        return isNewFavorite;
    }
    public void setIsNewFavorite(String isNewFavorite) {
        this.isNewFavorite = isNewFavorite;
    }
    public String getFavoriteName() {
        return favoriteName;
    }
    public void setFavoriteName(String favoriteName) {
        this.favoriteName = favoriteName;
    }
}
