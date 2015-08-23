package com.youthor.bsp.core.abdf.model;
public class Favorite {
        private String favoriteId;
       private String favoriteName;
       private String parentId;
       private String orgId;
       private String orgName;
       private String allParentId; 
          private String allParentName; 
       private float orderIndex; 
          public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
        public String getFavoriteId(){
         return favoriteId;
      }
       public void setFavoriteId(String favoriteId) {
        this.favoriteId = favoriteId;
      }
         public String getFavoriteName(){
         return favoriteName;
      }
       public void setFavoriteName(String favoriteName) {
        this.favoriteName = favoriteName;
      }
         public String getParentId(){
         return parentId;
      }
       public void setParentId(String parentId) {
        this.parentId = parentId;
      }
         public String getOrgId(){
         return orgId;
      }
       public void setOrgId(String orgId) {
        this.orgId = orgId;
      }
         public String getOrgName(){
         return orgName;
      }
       public void setOrgName(String orgName) {
        this.orgName = orgName;
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
   }
