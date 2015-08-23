<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.abdf.model.Favorite"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>

<html>
    <head>
       <%@include file="/bsp/abdf/common.jsp"%>
       <%!
  private void buildFavoriteTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
          
         List  favoriteList =(List)request.getAttribute("favoriteList");
         out.println("var t0 = new WebFXTree('收藏夹','javascript:doNothing()')");
          
             if(favoriteList!=null&&favoriteList.size()>0)
             {
                for(int i=0;i<favoriteList.size();i++)
                {
                    Favorite favorite=(Favorite)favoriteList.get(i);
                   if(favorite.getParentId()==null||favorite.getParentId().equals(""))
                   {
                       out.println("var t"+favorite.getFavoriteId()+" = new WebFXTreeItem('"+favorite.getFavoriteName()+"','javascript:doChangeMain(\\'"+favorite.getFavoriteName()+"\\',\\'"+favorite.getFavoriteId()+"\\',\\'"+StringHelper.doWithNull(favorite.getAllParentId())+"\\',\\'"+StringHelper.doWithNull(favorite.getAllParentName())+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png')");
                       buildSubFavoriteTree(favorite,favoriteList,baseURL,out);
                   }
                }
             }
          
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildFavoriteTreeSrc.\n" + ex);
    }
  }
 private void buildSubFavoriteTree(Favorite favorite,List favoriteList,String baseURL,JspWriter out) throws Exception
 {
   if(favoriteList!=null&&favoriteList.size()>0)
    {
      for(int i=0;i<favoriteList.size();i++)
      {
                  Favorite subFavorite=(Favorite)favoriteList.get(i);
                   if(!StringHelper.doWithNull(subFavorite.getParentId()).equals("")&&subFavorite.getParentId().equals(favorite.getFavoriteId()))
                   {
                       out.println("var t"+subFavorite.getFavoriteId()+" = new WebFXTreeItem('"+subFavorite.getFavoriteName()+"','javascript:doChangeMain(\\'"+subFavorite.getFavoriteName()+"\\',\\'"+subFavorite.getFavoriteId()+"\\',\\'"+StringHelper.doWithNull(subFavorite.getAllParentId())+"\\',\\'"+StringHelper.doWithNull(subFavorite.getAllParentName())+"\\')',t"+favorite.getFavoriteId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png')");
                       buildSubFavoriteTree(subFavorite,favoriteList,baseURL,out);
                   }
                }
             }
 }
%>
        <script type="text/javascript" language="javascript">
        function doNothing(){
          document.getElementById("favoriteNameView").value='';
          document.getElementById("favoriteId").value='';
       
       
         document.getElementById("allParentId").value='';
         document.getElementById("allParentName").value='';
       
        }
        
function closeWidow()
{
    window.close();
}
function closeWidowOK()
{
    returnValue = true;
    window.close();
}
function doChangeMain(name,functionId,allParentIds,allParentNames){
    
       document.getElementById("favoriteNameView").value=name;
       document.getElementById("favoriteId").value=functionId;
       
       var isNewFavoriteValue = document.getElementById("isNewFavorite").value;
       if(isNewFavoriteValue=="Y") {
         document.getElementById("allParentId").value=allParentIds;
         document.getElementById("allParentName").value=allParentNames;
       }
       
     
        
  }
function initData()
{
    document.getElementById("name").value=window.dialogArguments.document.title;
    document.getElementById("url").value=window.dialogArguments.location.href;
}

function sumbitFormSelf()
{
    var formObj=document.getElementById("addFavorite")
    if(document.getElementById("name").value==  '')
    {
        alert("名称为必填内容，请您填写");
        document.getElementById("name").select();
        return;
    }
    var  isNewFavoriteValue = document.getElementById("isNewFavorite").value;
    if(isNewFavoriteValue == 'Y') {
        if(document.getElementById("favoriteNameNew").value=='')
        {
            alert("新建名称为必填内容，请您填写");
            document.getElementById("favoriteNameNew").select();
            return;
        }
    }
     
    
    formObj.target="submitFormFrame";
    formObj.submit();
}

function displayNewFavorite(obj) {
   document.getElementById("FAVORITE_Tree").style.height = 300;
   document.getElementById("favorite_new").style.display="";
   obj.style.display="none";
   
   document.getElementById("favoriteTitle").innerHTML="父收藏夹:";
   document.getElementById("isNewFavorite").value= "Y";
}

function hiddleNewFavorite() {
   document.getElementById("FAVORITE_Tree").style.height = 350;
   document.getElementById("favorite_old").style.display="";
    document.getElementById("favoriteNewButton").style.display="";
   
   
   document.getElementById("favoriteTitle").innerHTML="收藏夹:";
   document.getElementById("isNewFavorite").value= "N";
}
</script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<script>
var webFXTreeConfig = {
    rootIcon        : '<%=baseURL%>/bsp/abdf/skins/images/function/42.jpg',
    openRootIcon    : '<%=baseURL%>/bsp/abdf/skins/images/function/42.jpg',
    folderIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png',
    openFolderIcon  : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
    fileIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
    iIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/I.png',
    lIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/L.png',
    lMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lminus.png',
    lPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lplus.png',
    tIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/T.png',
    tMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tminus.png',
    tPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tplus.png',
    blankIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/blank.png',
    defaultText     : 'Tree Item',
    defaultAction   : 'javascript:void(0);',
    defaultBehavior : 'classic',
    usePersistence    : false
};
</script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
        <title>添加到收藏夹</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    <body onload="initData()">
        <html:form action="/saveFavoriteItem_abdf.do" method="post" style="margin: 0" styleId="addFavorite">
        <table width="100%" border="0" cellSpacing="0" cellpadding="1" bordercolorlight="#E2D7CF" bordercolordark="#FAF8F6"> 
            <tr>
                <td rowspan="2" width="80" align="center">
                    <img src='<%=baseURL%>/bsp/abdf/skins/default/img/favorite.gif' align='middle'>
                </td>
                <td rowspan="2" width="250">
                    系统将把该页加入到您的收藏夹列表中
                </td>
                <td>
                    <input type='button' name='power_button'  value='确定'   class='Button3'  onclick="sumbitFormSelf()">
                </td>
            </tr>
            <tr>
                <td>
                    <input type='button' name='power_button'  value='关闭'   class='Button3'  onclick="closeWidow()">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <font color="red">名称:</font>
                </td>
                <td>
                   <html:hidden property="id" name="FavoriteItemForm" styleId="id"/>
                    <html:hidden property="url" name="FavoriteItemForm" styleId="url"/>
                    <html:text property="name" name="FavoriteItemForm" styleId="name" styleClass="formStyleall" style="width=100%"></html:text>
                </td>
                <td>
                    
                </td>
            </tr>
            
            <tr  id="createToTree">
                
                <td colspan="3">
                
                  <table border="0" width="100%" align="center">
            <tr>
                <td>
                    <div class="tab-pane" id="FAVORITE_SELECT_tabPane1" style="height:390">
                        <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("FAVORITE_SELECT_tabPane1"));</script>
                        <div class="tab-page" id="FAVORITE_SELECT_tabPage2" style="height:390" style="overflow:hidden">
                            <h2 class="tab" ><span >创建到</span></h2>
                            <script type="text/javascript">tp1.addTabPage(document.getElementById("FAVORITE_SELECT_tabPage2" ) );</script>
                             <input type="hidden" id="handleType" name="handleType" value="orgTree"/>
                               <div  id="FAVORITE_Tree" style="height:350" style="overflow:auto">
                                <script>
                                  <%   buildFavoriteTreeSrc(out,request,session);%>
                                    document.write(t0)
                                    t0.expandAll();
                                     </script>
                               </div>
                               <span id="favorite_old" >
                               <span id="favoriteTitle">收藏夹:</span><input size="30"  name="favoriteNameView" class="formStyleall" type="text"  id="favoriteNameView" readonly="true">
                               <input type='button' name='power_button' id="favoriteNewButton"  value='新建收藏夹'   class='Button3'  onclick="displayNewFavorite(this)"></span><br><br>
                               <span id="favorite_new" style="display:none"><font color="red">新建名称:</font><input size="30"  name="favoriteName" class="formStyleall" type="text"  id="favoriteNameNew" >
                               <input type='button' name='power_button'  value='保存/确定'   class='Button3' onclick="sumbitFormSelf()"><input type='button' name='power_button'  value='取消'   class='Button2'  onclick="hiddleNewFavorite()"/>
                               <input type="hidden" name="isNewFavorite" id="isNewFavorite" value="N">
                                 <input type="hidden" name="allParentId" id="allParentId" value="">
                                  <input type="hidden" name="allParentName" id="allParentName" value="">
                                   <input type="hidden" name="favoriteId" id="favoriteId" value="">
                                  
                             </span>
                        </div>
                        
                        
                    </div>
                </td>
            </tr>
        </table>
        
                
                </td>
            </tr>
            
        </table>
        </html:form>
        <IFRAME id="submitFormFrame" name="submitFormFrame" style="display:none"></IFRAME>
    </body>

</html>


