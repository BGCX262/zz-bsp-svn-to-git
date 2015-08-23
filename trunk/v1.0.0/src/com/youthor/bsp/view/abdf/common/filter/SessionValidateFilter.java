package com.youthor.bsp.view.abdf.common.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.wrapper.RequestWrapper;

public class SessionValidateFilter implements Filter {
      private FilterConfig filterConfig;

      public void init(FilterConfig filterConfig) throws
        ServletException {
        this.filterConfig = filterConfig;
      }

      public void destroy() {
        this.filterConfig = null;
      }

      public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
        FilterChain filterChain)
        throws IOException, ServletException {
          HttpServletRequest request = (HttpServletRequest)servletRequest;
          HttpServletResponse response = (HttpServletResponse)servletResponse;
          HttpSession session = request.getSession();
          Org org =  (Org)session.getAttribute(Constants.GLOBAL_ORG);
          String noFilterURI=this.filterConfig.getInitParameter("noFilterURI");
            String [] noFilterURIArr=null;
            String urlFrom = request.getRequestURI();
            String urlQuery = request.getQueryString();
            if(noFilterURI!=null)
                noFilterURIArr=StringHelper.split(noFilterURI,",");
            boolean noFilter=false;
            if(noFilterURIArr!=null&&noFilterURIArr.length>0)
            {
                for(int i=0;i<noFilterURIArr.length;i++)
                {
                    
                    String uri=request.getContextPath()+noFilterURIArr[i];
                    if(uri.equals(request.getRequestURI()))
                    {
                        noFilter=true;
                        break;
                    }
                }
            }
            if(noFilter)
            {
                filterChain.doFilter(servletRequest, servletResponse);
            }
            else
            {
                if(org==null) 
                {
                    request.setAttribute("hintMessage", "当前会话失效,请重新登陆！");
                    if (StringHelper.isHasContent(urlQuery)){
                       request.setAttribute("to_next", urlFrom+"?"+urlQuery);
                    }
                    else {
                        request.setAttribute("to_next", urlFrom);
                    }
                    
                    request.getRequestDispatcher("/forwardReIndex_abdf.do").forward(request, response);
                    
                }
                else
                {
                    filterChain.doFilter(servletRequest, servletResponse);
                }
            }
      }
    }

