<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.abdf.model.Favorite"%>
<%@page import="com.youthor.bsp.core.abdf.model.FavoriteItem"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<html>
    <head>
        <title></title>
        <%
  String baseURL = request.getContextPath(); 
    
        %>
          <%!
  private void buildFavoriteTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
          
         List  favoriteList =(List)request.getAttribute("favoriteList");
         List favoriteItemList = (List)request.getAttribute("favoriteItemList");
         if(favoriteItemList!=null && favoriteItemList.size()>0){
             for(int n=0;n<favoriteItemList.size();n++) {
                 FavoriteItem favoriteItem = (FavoriteItem)favoriteItemList.get(n);
                 if(favoriteItem.getFavoriteId()==null || favoriteItem.getFavoriteId().equals("")) {
                     out.println("parent.eMenuFavorite.add(new parent.MenuItem('"+favoriteItem.getName()+"', 'javascript:viewFavorite(\\'"+favoriteItem.getUrl()+"\\')', '"+baseURL+"/bsp/abdf/skins/default/img/e.gif' ) );");
                 }
             }
         }
          
             if(favoriteList!=null&&favoriteList.size()>0)
             {
                for(int i=0;i<favoriteList.size();i++)
                {
                    Favorite favorite=(Favorite)favoriteList.get(i);
                   if(favorite.getParentId()==null||favorite.getParentId().equals(""))
                   {
                       out.println("var  menu_"+i+" = new parent.Menu();");
                       out.println("parent.eMenuFavorite.add(new parent.MenuItem('"+favorite.getFavoriteName()+"', '#', '"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png', menu_"+i+") )");
                       if(favoriteItemList!=null && favoriteItemList.size()>0){
                           for(int n=0;n<favoriteItemList.size();n++) {
                               FavoriteItem favoriteItem = (FavoriteItem)favoriteItemList.get(n);
                               if(favoriteItem.getFavoriteId()!=null && favoriteItem.getFavoriteId().equals(favorite.getFavoriteId())) {
                                   out.println("menu_"+i+".add(new parent.MenuItem('"+favoriteItem.getName()+"', 'javascript:viewFavorite(\\'"+favoriteItem.getUrl()+"\\')', '"+baseURL+"/bsp/abdf/skins/default/img/e.gif' ) );");
                               }
                           }
                       }
                       buildSubFavoriteTree(favorite,favoriteList,baseURL,out,i+"",favoriteItemList);
                   }
                }
             }
          
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildFavoriteTreeSrc.\n" + ex);
    }
  }
 private void buildSubFavoriteTree(Favorite favorite,List favoriteList,String baseURL,JspWriter out,String j,List favoriteItemList) throws Exception
 {
   if(favoriteList!=null&&favoriteList.size()>0)
    {
      for(int i=0;i<favoriteList.size();i++)
      {
                  Favorite subFavorite=(Favorite)favoriteList.get(i);
                   if(!StringHelper.doWithNull(subFavorite.getParentId()).equals("")&&subFavorite.getParentId().equals(favorite.getFavoriteId()))
                   {
                        
                       out.println("var  menu_"+i+"_"+j+" = new parent.Menu();");
                       out.println("menu_"+j+".add(new parent.MenuItem('"+subFavorite.getFavoriteName()+"', '#', '"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png', menu_"+i+"_"+j+") )");
                       if(favoriteItemList!=null && favoriteItemList.size()>0){
                             for(int n=0;n<favoriteItemList.size();n++) {
                                 FavoriteItem favoriteItem = (FavoriteItem)favoriteItemList.get(n);
                                 if(favoriteItem.getFavoriteId()!=null && favoriteItem.getFavoriteId().equals(subFavorite.getFavoriteId())) {
                                     out.println("menu_"+i+"_"+j+".add(new parent.MenuItem('"+favoriteItem.getName()+"', 'javascript:viewFavorite(\\'"+favoriteItem.getUrl()+"\\')', '"+baseURL+"/bsp/abdf/skins/default/img/e.gif' ) );");
                                 }
                             }
                         }
                       buildSubFavoriteTree(subFavorite,favoriteList,baseURL,out,i+"_"+j,favoriteItemList);
                      
                   }
                }
             }
 }
%>
    </head>
    <body>
        <script>
       <%   buildFavoriteTreeSrc(out,request,session);%>
         
        </script>
    </body>

</html>


