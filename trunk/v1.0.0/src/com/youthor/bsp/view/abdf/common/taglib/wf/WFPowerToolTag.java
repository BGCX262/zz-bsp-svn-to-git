package com.youthor.bsp.view.abdf.common.taglib.wf;

import java.io.IOException;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;


public class WFPowerToolTag extends BodyTagSupport{

    /**
     * 
     */
    private static final long serialVersionUID = -8050506601268463313L;
    private String formId="";
    private String moduleName="";
    private String type= "td";
    

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public int doStartTag() {
            return EVAL_BODY_INCLUDE;
        }
     
      public int doEndTag() throws JspException {
          HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
          HttpSession session = request.getSession();
          String orgId = WebHelper.getTopOrgId(session, "GS");
          String orgName = WebHelper.getTopOrgName(session, "GS");
          int ddWorkItemDoIng = 0;
          JspWriter out = pageContext.getOut();
          StringBuffer buf=new StringBuffer();
          String workItemId=(String)request.getAttribute("wfss_workItemId");
          if(workItemId==null) workItemId="";
          String openAction= (String) request.getAttribute("wfss_openAction");
          if(openAction==null) openAction="";
           Activity activity= (Activity) request.getAttribute("CURR_ACTIVITY");
           String activityId=activity.getActivityId();
           WorkItemDoing workItemDoing = null;
           IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
           workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
           ProcessInstance processInstance = null;
           if (!workItemId.equals("")) {
                processInstance = wfssServiceFacade.getProcessInstanceByWorkItemId(workItemId);
               String statusPI = processInstance.getStatus();
               if(Constants.WF_CANCEL.equals(statusPI)) {
                   return EVAL_PAGE;    
               }
           }
           Process process= (Process) request.getAttribute("CURR_PROCESS");
           String processId=process.getProcessId();
           
          if (openAction == null) openAction="";
          buf.append("<script>\n");
         buf.append("var SUBMIT_WF_VALUE=new Item();\n");
         buf.append("</script>\n");
         if (type!=null && type.equals("td")) {
             
             buf.append("<table cellpadding='0' cellspacing='0' width='100%' border='0'  class='toolBar1'>\n");
             buf.append(" <tr>\n");
             buf.append("<td>\n");
             buf.append("<table id='toolBar' border='0'>\n");
             buf.append("<tr>\n");
             buf.append("<td class='coolButton' align='left' width='3'><img src='"+request.getContextPath()+"/bsp/abdf/skins/default/img/toolbar/toolbar.gif'/></td>\n");
             request.setAttribute("ABDF_BUTTON_TYPE","td");          
         }
         if (!workItemId.equals("")) {
                processInstance = wfssServiceFacade.getProcessInstanceByWorkItemId(workItemId);
               String statusPI = processInstance.getStatus();
               if(Constants.WF_HANG.equals(statusPI)) {
            	   if(type!=null&&type.equals("button")) {
            	   buf.append("<input type='button' name='power_button' value='取消挂起' class='Button3' onclick=\"cancelHangProcessInst('"+workItemId+"')\" >&nbsp;&nbsp;\n");
            	   }
            	   else {
            		   buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"cancelHangProcessInst('"+workItemId+"')\">取消挂起</td>\n"); 
            	   }
            	   try {
                         out.println(buf.toString());
                 } catch (IOException e) {
                         e.printStackTrace();
                 }
                   return EVAL_PAGE;    
               }
           }
          //buf.append("<input type='button' name='power_button' value='流程作废' class='Button3' onclick=\"cancelProcessInst('"+workItemId+"')\" >&nbsp;&nbsp;\n");
          //buf.append("<input type='button' name='power_button' value='流程挂起' class='Button3' onclick=\"hangProcessInst('"+workItemId+"')\" >&nbsp;&nbsp;\n");
          
          if(openAction.equals(""))
          {
        	  if(type!=null&&type.equals("button")) {
        	  buf.append("<input type='button' name='power_button' value='保存' class='Button3' onclick=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\" >&nbsp;&nbsp;\n");
        	  }
        	  else {
        		  buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\">保存</td>\n"); 
        	  }
        	  getSubmitButton(buf,activity,ddWorkItemDoIng,workItemId);
            
          }
          else if (openAction.equals(Constants.WF_DB))
         {
             
                /**
                  * 当是顺序会签时如果还有未激活的待办，那么提交时只是激活待办。
                  * 使下一处理人能够处理.如果没有可以激活的待办，那么提交要求最后处理人选择下一活动处理人
                  */
              if(activity.getOperateMode().equals(Constants.WF_operateMode_LOOP)||activity.getOperateMode().equals(Constants.WF_operateMode_AND))
              {
                 
                   ddWorkItemDoIng=wfssServiceFacade.getWorkItemDoIngNumByActivityInstanceIdWithOutSelf(workItemDoing.getActivityInstanceId(),workItemDoing.getWorkItemId());
                   if(type!=null&&type.equals("button")) {
                   buf.append("<input type='button' name='power_button' value='保存' class='Button3' onclick=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\" >&nbsp;&nbsp;\n");
                   }
                   else {
                	   buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\">保存</td>\n"); 
                   }
                  getSubmitButton(buf,activity,ddWorkItemDoIng,workItemId);
                 // buf.append("<input type='button' name='power_button' value='转他人处理' class='Button4' onclick=\"assignOtherUserProcess('"+orgId+"','"+orgName+"','GS','"+workItemId+"')\" >&nbsp;&nbsp;\n");
              }
              else
              {
            	  if(type!=null&&type.equals("button")) {
            	 buf.append("<input type='button' name='power_button' value='保存' class='Button3' onclick=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\" >&nbsp;&nbsp;\n");
            	  }
            	  else {
            		  buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\">保存</td>\n"); 
            	  }
            	 getSubmitButton(buf,activity,ddWorkItemDoIng,workItemId);
                //buf.append("<input type='button' name='power_button' value='转他人处理' class='Button4' onclick=\"assignOtherUserProcess('"+orgId+"','"+orgName+"','GS','"+workItemId+"')\" >&nbsp;&nbsp;\n");
                //buf.append("<input type='button' name='power_button' value='跳转' class='Button4' onclick=\"jumpToOtherActivity('"+processId+"','"+activityId+"','"+workItemId+"')\" >&nbsp;&nbsp;\n");
              }
         }
         else if(openAction.equals(Constants.WF_DD))
         {

         }
          else if(openAction.equals(Constants.WF_DDQR))
          {
               if(activity.getOperateMode().equals(Constants.WF_operateMode_OR))
               {
            	   if(type!=null&&type.equals("button")) {
            	   buf.append("<input type='button' name='power_button' value='确定处理' class='Button3' onclick=\"affirmDoThisWorkItem('"+this.formId+"','"+activityId+"')\" >&nbsp;&nbsp;\n");   
            	   }
            	   else {
            		   buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"affirmDoThisWorkItem('"+this.formId+"','"+activityId+"')\">确定处理</td>\n"); 
            	   }
            	}
          }
        else if(openAction.equals(Constants.WF_YB))
        {
            // buf.append("<input type='button' name='power_button' value='重处理' class='Button4' onclick=\"redoWorkItem('"+workItemId+"')\" >&nbsp;&nbsp;\n");    
        }
        else if(openAction.equals(Constants.WF_CG))
        {
        	if(type!=null&&type.equals("button")) {
        	buf.append("<input type='button' name='power_button' value='保存' class='Button3' onclick=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\" >&nbsp;&nbsp;\n");
        	}
        	else {
        		buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"saveFormWithFlow('"+this.formId+"','"+this.moduleName+"')\">保存</td>\n"); 
        	}
        	getSubmitButton(buf,activity,ddWorkItemDoIng,workItemId);
            //buf.append("<input type='button' name='power_button' value='转他人处理' class='Button4' onclick=\"assignOtherUserProcess('"+orgId+"','"+orgName+"','GS','"+workItemId+"')\" >&nbsp;&nbsp;\n");
            
        }
        getOperationButton(buf,type,openAction,activity,workItemId,session);  
          String attachPrivilege = activity.getAttachPrivilege();
          if (attachPrivilege == null) attachPrivilege="";
          if((attachPrivilege.equalsIgnoreCase("EDIT_ALL") || attachPrivilege.equalsIgnoreCase("EDIT_OWN"))&& !openAction.equals(Constants.WF_YB)) {
        	  if(type!=null&&type.equals("button")) {
        	  buf.append("<input type='button' name='power_button' value='上传附件' class='Button3' onclick=\"processAttachUpload('"+this.formId+"','"+workItemId+"')\" >&nbsp;&nbsp;\n");
        	  }
        	  else {
        		  buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"processAttachUpload('"+this.formId+"','"+workItemId+"')\">上传附件</td>\n"); 
        	  }
         }
          
          try {
        	  if (type!=null && type.equals("td")) {
                 
                  buf.append(" </tr>\n");
                  buf.append(" </table>\n");
                  buf.append("</td>\n");
                  buf.append("</tr>\n");
                  buf.append("</table>\n");
        	  }
             out.println(buf.toString());
     } catch (IOException e) {
             e.printStackTrace();
     }

     
          return EVAL_PAGE;    
      }
     
      private void getOperationButton(StringBuffer buf,String type,String openAction,Activity activity,String workItemId,HttpSession session) 
      {
          if(openAction==null || openAction.equals("")) return;
          String operation = activity.getOperation();
          if(operation ==null || operation.equals("")) return;
          IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
          String [] operationArr = StringHelper.split(operation, ",");
          for(int i=0;i<operationArr.length;i++) {
              Button button = wfCacheEngine.getButtonByCode(operationArr[i]);
              boolean isAdd = false;
              String position = button.getButtonPosition() == null ? "" : button.getButtonPosition();
              String [] positionArr = StringHelper.split(position, ",");
              for(int n=0;n<positionArr.length;n++) {
                  if(openAction.equals(positionArr[n])) {
                      isAdd = true;
                      break;
                  }
              }
              if(isAdd) {
                 
                  String orgId = WebHelper.getTopOrgId(session, "GS");
                  String orgName = WebHelper.getTopOrgName(session, "GS");
                  String onclick = "";
                  if ("JTRQL".equals(operationArr[i])) {
                       onclick="\""+button.getJsMethod()+"('"+orgId+"','"+orgName+"','GS','"+workItemId+"')\"";
                  }
                  else {
                       onclick="\""+button.getJsMethod()+"('"+activity.getProcessId()+"','"+activity.getActivityId()+"','"+workItemId+"')\"";
                  }
                  if(type!=null&&type.equals("button")) {
                  buf.append("<input type='button' name='power_button' value='"+button.getButtonName()+"' class='Button3' onclick="+onclick+" >&nbsp;&nbsp;\n");
                  }
                  else {
                	  buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction="+onclick+">"+button.getButtonName()+"</td>\n"); 
                  }
               }
              
          }
          
          
      }
      
      private void getSubmitButton(StringBuffer buf,Activity activity,int ddWorkItemDoIng,String workItemId) {
          IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
          String processButtonMode = activity.getProcessButtonMode()==null?"":activity.getProcessButtonMode();
          String activityId = activity.getActivityId();
          List routeList=wfCacheEngine.listRouteByActivityId(activityId);
         
          
          if (processButtonMode.equals("ONLY_SUBMIT")) {
              if (ddWorkItemDoIng>0) {
            	  if(type!=null&&type.equals("button")) {
            	  buf.append("<input type='button' name='power_button' value='提交' class='Button3' onclick=\"submitFlowWithOutRouter('"+this.formId+"','"+this.moduleName+"','"+activityId+"')\" >&nbsp;&nbsp;\n");
            	  }
            	  else {
            		  buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"submitFlowWithOutRouter('"+this.formId+"','"+this.moduleName+"','"+activityId+"')\">提交</td>\n"); 
            	  }
            	  return;
              }
            	  if(type!=null&&type.equals("button")) {
            	  buf.append("<input type='button' name='power_button' value='提交' class='Button3' onclick=\"openRouteWindow('"+this.formId+"','"+this.moduleName+"','"+activityId+"','"+workItemId+"')\" >&nbsp;&nbsp;\n");
            	  }
            	  else {
            		  buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"openRouteWindow('"+this.formId+"','"+this.moduleName+"','"+activityId+"','"+workItemId+"')\">提交</td>\n"); 
            	  }
          }
          else if (processButtonMode.equals("ALL_ROUTE")) {
             if(routeList!=null&&routeList.size()>0)
                {
                    for(int i=0;i<routeList.size();i++)
                    {
                        Route route=(Route)routeList.get(i);
                        if(type!=null&&type.equals("button")) {
                        buf.append("<input type='button' name='power_button' value='"+route.getRouteName()+"' class='Button3' onclick=\"openButtonSubmitRouteWindow('"+this.formId+"','"+this.moduleName+"','"+route.getRouteId()+"','"+workItemId+"')\" >&nbsp;&nbsp;\n");
                        }
                        else {
                        	buf.append(" <td class='coolButton' name='POWER_BUTTON'  onaction=\"openButtonSubmitRouteWindow('"+this.formId+"','"+this.moduleName+"','"+route.getRouteId()+"','"+workItemId+"')\">"+route.getRouteName()+"</td>\n"); 
                        }
                    }
                }
          }
          else if (processButtonMode.equals("BY_ROUTE")) {
              
          }
      }
    
}
