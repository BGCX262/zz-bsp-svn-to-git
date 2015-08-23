package com.youthor.bsp.view.abdf.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class RequestWrapper extends HttpServletRequestWrapper
{
    public RequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
      }

      public String[] getParameterValues(String parameter) {
        String[] results = super.getParameterValues(parameter);
        if (results==null)
          return null;
        int count = results.length;

        String[] trimResults = new String[count];
        for (int i=0; i<count; i++) {
          trimResults[i] = results[i].trim();
        }
        return trimResults;
      }

      public String getParameter(String parameter) {
            String results = super.getParameter(parameter);
            if(results==null) results=(String)super.getAttribute(parameter);
            if (results==null)
              return "";
            return results.trim();
          }


}
