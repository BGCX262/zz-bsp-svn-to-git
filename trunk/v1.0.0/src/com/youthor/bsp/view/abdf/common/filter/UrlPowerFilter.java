package com.youthor.bsp.view.abdf.common.filter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.Url;
import com.youthor.bsp.core.abdf.model.UrlLog;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IPortalUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.User;



public class UrlPowerFilter implements Filter {
     private FilterConfig filterConfig;

      public void init(FilterConfig filterConfig) throws
        ServletException {
        this.filterConfig = filterConfig;
      }

      public void destroy() {
        this.filterConfig = null;
      }
      public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
          HttpServletRequest request = (HttpServletRequest)servletRequest;
          HttpServletResponse response = (HttpServletResponse)servletResponse;
          HttpSession session = request.getSession();
          
          String urlRealPath = request.getRealPath("/WEB-INF/classes/urls");
            File file = new File(urlRealPath);
            File [] files = file.listFiles();
            Map map = new HashMap();
            if(files!=null && files.length>0) {
                for(int i =0;i<files.length;i++) {
                    File subFile = files[i];
                    String fileName = subFile.getName();
                    
                    String [] names = StringHelper.split(fileName, ".");
                    if(names.length == 1) continue;
                    if(names.length==2 && names[1]!=null && !names[1].equals("") && !names[1].equals("xml")) continue;
                    if(names.length>2) continue;
                    if(subFile.isDirectory()) continue;
                    java.io.InputStream xmlDocInput = null;
                    try {
                        xmlDocInput = new FileInputStream(subFile);
                    } catch (FileNotFoundException e1) {
                        // TODO Auto-generated catch block
                        e1.printStackTrace();
                    }
                     SAXBuilder saxBuilder = new SAXBuilder();
                     Document xmlMapDoc= null;
                    try {
                        xmlMapDoc = saxBuilder.build(xmlDocInput);
                    } catch (JDOMException e1) {
                        // TODO Auto-generated catch block
                        e1.printStackTrace();
                    } catch (IOException e1) {
                        // TODO Auto-generated catch block
                        e1.printStackTrace();
                    }
                         Element root = xmlMapDoc.getRootElement();
                         List xmlList=root.getChildren();
                         for(int j=0;j<xmlList.size();j++)
                         {
                            Element e = (Element)xmlList.get(j);
                            Url url = new Url();
                            url.setHref(e.getAttributeValue("href"));
                            url.setName(e.getAttributeValue("name"));
                            String isOftenUse = e.getAttributeValue("isOftenUse");
                            if(isOftenUse.equals("true")) {
                                url.setOftenUse(true);
                            }
                            else {
                                url.setOftenUse(false);
                            }
                            
                            String isPublic = e.getAttributeValue("isPublic");
                            if(isPublic.equals("true")) {
                                url.setIsPublic(true);
                            }
                            else {
                                url.setIsPublic(false);
                            }
                            
                            String isLog = e.getAttributeValue("isLog");
                            if(isLog.equals("true")) {
                                url.setIsLog(true);
                            }
                            else {
                                url.setIsLog(false);
                            }
                            
                            String needLogData = e.getAttributeValue("needLogData");
                            if(needLogData.equals("true")) {
                                url.setNeedLogData(true);
                            }
                            else {
                                url.setNeedLogData(false);
                            }
                            
                            String alertTime = e.getAttributeValue("alertTime");
                            if(alertTime!=null && !alertTime.equals("")) {
                                url.setAlertTime(Integer.parseInt(alertTime));
                            }
                            map.put(url.getHref(), url);
                         }
                        
                
                }
                 AbdfCache.mapURLData=map; 
            }
          
          User user =  (User)session.getAttribute(Constants.GLOBAL_USER);
          String uri = request.getRequestURI();
          String baseURL = request.getContextPath();
          uri = uri.substring(baseURL.length());
          System.out.println("uri==="+uri);
          boolean isNeedPower = true;
          Url  url =(Url)AbdfCache.mapURLData.get(uri);
          //if (url == null) return;
          //if (url == null) isNeedPower = false;
          if (url!=null && url.getIsPublic()) isNeedPower = false;
          System.out.println("url==="+url.getName());
          if(isNeedPower) {
              //对当前用户进行url后台验证,验证通过,进入下一下,验证不通过,则转入没有权限提示页面
              Org org =  (Org)session.getAttribute(Constants.GLOBAL_ORG);
              IPortalUrssServiceFacade portalUrssServiceFacade = (IPortalUrssServiceFacade)SpringHelper.getBean("portalUrssServiceFacade");
              try {
              boolean hasPower = portalUrssServiceFacade.hasPowerByUrl(AbdfCache.app.getAppId(),org.getOrgId(),url.getHref());
              
              if (!hasPower) {
                  response.sendRedirect(request.getContextPath()+"/forwardNoPowerInfo_abdf.do");
                 
                  return;
              }
              }catch(Exception e) {
                  e.printStackTrace();
              }
          }
          
          int beginTime = (int)System.currentTimeMillis();
                chain.doFilter(request, response);
          int endTime = (int)System.currentTimeMillis();
          
          if(user!=null) {
              if (url.getIsLog()) {
                  UrlLog urlLog = new UrlLog();
                  urlLog.setUrl(uri);
                  urlLog.setTimeLong(endTime-beginTime);
                  urlLog.setCommitMethod(request.getMethod());
                  urlLog.setLogTime(new Date());
                  if (url != null) {
                      urlLog.setName(url.getName());
                  }
                  urlLog.setUserId(user.getUserId());
                  urlLog.setUserName(user.getUserName());
                  if(url.getNeedLogData()) {
                     urlLog.setCommitData(getXMLFormRequest(request).toString());
                  }
                  
                  try {
                      IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
                      abdfServiceFacade.addUrlLog(urlLog);
                  }
                  catch(Exception e) {
                      e.printStackTrace();
                  }
              }
          } 
      }
      
      
      private StringBuffer getXMLFormRequest(HttpServletRequest request) {
          StringBuffer sb = new StringBuffer();
          Map dataMap = request.getParameterMap();
          if(dataMap!=null && !dataMap.isEmpty()) {
              sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
              sb.append("<data>");
              Iterator iterator = dataMap.keySet().iterator();
              while(iterator.hasNext()) {
                  String key = (String)iterator.next();
                  String [] values = (String[]) dataMap.get(key);
                  String value = StringHelper.arrToString(values);
                  sb.append("<"+key+">");
                  sb.append(value);
                  sb.append("</"+key+">");
              }
              sb.append("</data>");
          }
          return sb;
      }
}
