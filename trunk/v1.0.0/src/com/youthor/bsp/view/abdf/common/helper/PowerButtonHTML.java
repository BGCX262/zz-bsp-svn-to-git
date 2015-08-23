package com.youthor.bsp.view.abdf.common.helper;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.view.wfss.common.WFCacheHelper;

public class PowerButtonHTML {
    
    private static void recursionAddSubResource(List list,Resource resource)
    {
        boolean continueRecursion=true;
        for(int i=0;i<list.size();i++)
        {
            Resource resourceParent=(Resource)list.get(i);
            if(resourceParent.getResourceId().equals(resource.getParentResId()))
            {
                resourceParent.getSubResource().add(resource);
                continueRecursion=false;
            }
        }
        if(continueRecursion)
        {
            for(int i=0;i<list.size();i++)
            {
                Resource resourceParent=(Resource)list.get(i);
                recursionAddSubResource(resourceParent.getSubResource(),resource);
            }
        }
    }
    
    private static void recursionAddRealDisplayResource(List disPlayReal,Resource resource)
    {
        List subList=resource.getSubResource();
        Resource resourceSub=(Resource)subList.get(0);
        int i=resourceSub.getSubResource().size();
        if(i==0)
        {
            disPlayReal.add(resourceSub);
        }
        if(i==1)
        {
            recursionAddRealDisplayResource(disPlayReal,resourceSub);
        }
        else if(i>1)
        {
            disPlayReal.add(resourceSub);
        }
        
    }
    
    public static StringBuffer getPowerHTMLByButton(HttpServletRequest request, List buttonList,String pageType,Map parameter,String type,boolean favorite) {
        StringBuffer buf = new StringBuffer();
        StringBuffer bufJS = new StringBuffer();
         List disPlayTop=new ArrayList();
         List disPlayReal=new ArrayList();
         if ("td".equalsIgnoreCase(type)){
             buf.append("<table cellpadding='0' cellspacing='0' width='100%' border='0'  class='toolBar1'>\n");
             buf.append(" <tr>\n");
             buf.append("<td>\n");
             buf.append("<table id='toolBar' border='0'>\n");
             buf.append("<tr>\n");
             buf.append("<td class='coolButton' align='left' width='3'><img src='"+request.getContextPath()+"/bsp/abdf/skins/default/img/toolbar/toolbar.gif'/></td>\n");
             request.setAttribute("ABDF_BUTTON_TYPE","td");          
         }
         if(buttonList!=null&&buttonList.size()>0)
         {
             for(int i=0;i<buttonList.size();i++)
             {
                 Resource resource=(Resource)buttonList.get(i);
              String groupName=resource.getGroupName();
              String parentId=StringHelper.doWithNull(resource.getParentResId());
                  
                  
                   if(parentId.equals(""))
                   {
                       boolean isAdd=false;
                       if(groupName==null||groupName.equals(""))
                           isAdd=true;
                       else
                       {
                           String [] temp=StringHelper.split(groupName,",");
                           for(int j=0;j<temp.length;j++)
                           {
                               if(pageType.equals(temp[j]))
                               {
                                   isAdd=true;
                                   break;
                               }
                           }
                       }
                       if(isAdd)
                         disPlayTop.add(resource);
                   }
             }
         }
         
          if(buttonList!=null&&buttonList.size()>0)
          {
              for(int i=0;i<buttonList.size();i++)
              {
                  Resource resource=(Resource)buttonList.get(i);
                  String groupName=resource.getGroupName();
                   String parentId=StringHelper.doWithNull(resource.getParentResId());
                   boolean isAdd=false;
                   if(groupName==null||groupName.equals(""))
                       isAdd=true;
                   else
                   {
                       String [] temp=StringHelper.split(groupName,",");
                       for(int j=0;j<temp.length;j++)
                       {
                           if(pageType.equals(temp[j]))
                           {
                               isAdd=true;
                               break;
                           }
                       }
                   }
                   if(!isAdd) continue;
                   if(!parentId.equals(""))
                   {
                       recursionAddSubResource(disPlayTop,resource);
                   }
                  
              }
          }
          if(disPlayTop!=null&&disPlayTop.size()>0)
          {
              for(int i=0;i<disPlayTop.size();i++)
              {
                  Resource resource=(Resource)disPlayTop.get(i);
                  int j=resource.getSubResource().size();
                  if(j==0)
                  {
                      disPlayReal.add(resource);
                  }
                  else if(j==1)
                  {
                      recursionAddRealDisplayResource(disPlayReal,resource);
                  }
                  else if(j>1)
                  {
                      disPlayReal.add(resource);
                  }
              }
          }
          for(int i=0;i<disPlayReal.size();i++)
          {
              Resource resource=(Resource)disPlayReal.get(i);
               String resourceName=resource.getResourceName();
               String implJs=resource.getImplJs();
               String processInfo=resource.getProcessInfo();
               
               if(!StringHelper.doWithNull(processInfo).equals(""))
               {
                  Item item=WFCacheHelper.getInitProcessInfo(processInfo);
                  bufJS.append(" var "+resource.getResourceCode()+"_PROCESS_ITEM=new Item();\n");
                  bufJS.append(resource.getResourceCode()+"_PROCESS_ITEM.setKey('"+item.getKey()+"');\n");
                  bufJS.append(resource.getResourceCode()+"_PROCESS_ITEM.setValue('"+item.getValue()+"');\n");
               }
               String buttonId=resource.getButtonId();
               String buttonStyle=resource.getButtonStyle();
               String resourceCode=resource.getResourceCode();
               String onclick="";
               String id="";
               String styleClass=" class='Button3' ";
               if(buttonStyle!=null&&!buttonStyle.equals(""))
               {
                   styleClass="class='"+buttonStyle+"'";
               }
               if(resource.getSubResource().size()==0)
               {
                   if(implJs!=null&&!implJs.equals(""))
                   {
                       implJs = getJsImpl(request, parameter, implJs);
                       if(type!=null&&type.equals("button")) {
                       onclick="onclick=\""+implJs+"\"";
                       }
                       else if (type!=null&&type.equals("td"))
                       {
                           onclick="onaction=\""+implJs+"\"";
                       }
                   }
               }
                 else
                  {
                      //构建子菜单按钮
                     bufJS.append("Menu.prototype.cssFile = '"+request.getContextPath()+"/bsp/abdf/skins/default/css/popmenu/officexp.css';\n");
                     bufJS.append("var eResourceMenu_"+i+" = new Menu();\n");
                     List subResourceList=resource.getSubResource();
                     for(int j=0;j<subResourceList.size();j++)
                     {
                         Resource resourceSub=(Resource)subResourceList.get(j);
                         processInfo=resourceSub.getProcessInfo();
                           if(!StringHelper.doWithNull(processInfo).equals(""))
                           {
                              Item item=WFCacheHelper.getInitProcessInfo(processInfo);
                              bufJS.append(" var "+resourceSub.getResourceCode()+"_PROCESS_ITEM=new Item();\n");
                              bufJS.append(resourceSub.getResourceCode()+"_PROCESS_ITEM.setKey('"+item.getKey()+"');\n");
                              bufJS.append(resourceSub.getResourceCode()+"_PROCESS_ITEM.setValue('"+item.getValue()+"');\n");
                           }
                           
                         if(resourceSub.getSubResource().size()==0)
                         {
                             implJs=resourceSub.getImplJs();
                             if(implJs!=null&&!implJs.equals(""))
                             {
                                   implJs = getJsImpl(request, parameter, implJs);
                                   onclick="javascript:"+implJs;
                              }
                            bufJS.append("eResourceMenu_"+i+".add(new MenuItem('"+resourceSub.getResourceName()+"', \""+onclick+"\", '"+request.getContextPath()+"/bsp/abdf/skins/default/img/toolbar/label.gif'));\n");
                         }
                         
                    }
                     bufJS.append("function showResourceMenu_"+i+"() {\n");
                     bufJS.append("var el = window.event.srcElement;\n");
                     bufJS.append("var left = window.event.screenX;\n");
                     bufJS.append("var top = window.event.screenY;\n");
                     bufJS.append("eResourceMenu_"+i+".show(left,top);\n");
                     bufJS.append("}\n");
                     if(type!=null&&type.equals("button")) {
                         onclick=" onclick='showResourceMenu_"+i+"()'";
                           }
                           else if (type!=null&&type.equals("td"))
                           {
                               onclick=" onaction='showResourceMenu_"+i+"()'";
                           }
                     
                     
                  }
               if(buttonId!=null&&!buttonId.equals(""))
               {
                   id="id='"+buttonId+"'";
               }
               else
               {
                   if(resourceCode!=null&&!resourceCode.equals(""))
                       id="id='"+ resourceCode+"'";
                  
               }
                   if(type!=null&&type.equals("button")) {
                	   /**
                       buf.append("<SPAN class='btn-input' " + id + "><INPUT  style='WIDTH: 60px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; " +
                               "BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none' " + styleClass + " type='button' value='" + resourceName + 
                               "'  name='POWER_BUTTON' " + onclick + " /></span>\n");
                       //原始代码
                        * */
                        
                       buf.append("&nbsp;&nbsp;<input type='button' name='POWER_BUTTON'  value='"+resourceName+"'  "+styleClass+" "+onclick+" "+id+">\n");      
                   }
                   else {
                       buf.append(" <td class='coolButton' name='POWER_BUTTON'  "+onclick+"  "+id+">"+resourceName+"</td>\n");      
                   }
          }
          
          String method  = request.getMethod();
          if (type!=null && type.equals("td")) {
              if (favorite) {
              if (method!=null && method.equalsIgnoreCase("GET")) {
                  String addFavorite = (String)request.getAttribute("ABDF_FAVORITE");
                  if(addFavorite==null) {
                      //buf.append(" <td class='coolButton' name='POWER_BUTTON' onaction='abdfAddFavorite()'   id='ABDF_FAVORITE'>收藏</td>\n"); 
                      request.setAttribute("ABDF_FAVORITE", "true");
                  }
              }
              }
              buf.append(" </tr>\n");
              buf.append(" </table>\n");
              buf.append("</td>\n");
              buf.append("</tr>\n");
              buf.append("</table>\n");
             
          }
          else {
              if (favorite) {
              if (method!=null && method.equalsIgnoreCase("GET")) {
                  String addFavorite = (String)request.getAttribute("ABDF_FAVORITE");
                  if(addFavorite==null) {
                	  /**
                      buf.append("<SPAN class='btn-input' id='ABDF_FAVORITE'><INPUT style='WIDTH: 60px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; " +
                           "BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none' type='button' value='收藏'  name='POWER_BUTTON'  onclick='abdfAddFavorite()' /></span>\n");
                      */
                      request.setAttribute("ABDF_FAVORITE", "true");
                  }
              }
                  
              }
          }
          buf.append("<SCRIPT language=javascript>\n"+bufJS.toString()+"</SCRIPT>\n");
        return buf;
    }


    private static String getJsImpl(HttpServletRequest request, Map parameter, String implJs) {
        implJs=implJs.replaceAll("\\$\\{baseURL\\}",request.getContextPath());
           implJs=implJs.replaceAll("\\$\\{orgId\\}",WebHelper.getOrgId(request.getSession()));
           
              if(parameter!=null&&parameter.size()>0)
              {
                  Set set=parameter.keySet();
                  Iterator iterator=set.iterator();
                  while(iterator.hasNext())
                  {
                      String key=(String)iterator.next();
                      String value=StringHelper.doWithNull((String)parameter.get(key));
                      implJs=implJs.replaceAll("\\$\\{"+key+"\\}",value);
                  }
              }
        return implJs;
    }

    

}