package com.youthor.bsp.view.abdf.common.taglib.wf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.DateHelper;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.model.Attachment;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.view.abdf.common.helper.DictHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class ProcessAttachmentTag extends BodyTagSupport{
    private static final long serialVersionUID = 7466406838572471593L;

    public int doEndTag() throws JspException
     {
       try {
           JspWriter out = pageContext.getOut();
           StringBuffer buf = new StringBuffer();
           HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
           Activity currActivity = (Activity)request.getAttribute("CURR_ACTIVITY"); 
           String attachPrivilege = currActivity.getAttachPrivilege();
           if (attachPrivilege==null) attachPrivilege="";
           String attachType = currActivity.getAttachType();
           if (attachType==null) attachType="";
           String workItemId = (String) request.getAttribute("wfss_workItemId");
           if (workItemId == null) workItemId = "";
           Org sysOrg =WebHelper.getOrg(request.getSession());
           if (!attachPrivilege.equalsIgnoreCase("none")) {
              List attachListData =(List)request.getAttribute("PROCESS_ATTACH_LIST");
              boolean isHaveDict = false;
              if(attachListData!=null&&attachListData.size()>0){
                  for(int i=0;i<attachListData.size();i++){
                      Attachment attachment = (Attachment)attachListData.get(i); 
                      if(attachment.getDictId()!=null && !attachment.getDictId().trim().equals("")) {
                          isHaveDict = true;
                          break;
                      }
                  }
              }
              /////////////////
                  if(attachListData!=null&&attachListData.size()>0){
                      buf.append("<table width='96%'  align='center'>\n");
                      buf.append("<tr>\n");
                      buf.append("<td>\n");
                      buf.append("<fieldset style='width:96%;align:center'><legend>附件</legend>\n");
                      buf.append("<div style='width:96%;align:center'>\n");
                      buf.append("<iframe id='attacheFrame' name='attacheFrame' style='display: none;'></iframe>\n");    
                      buf.append("<TABLE cellspacing='0' cellpadding='3' width='96%' class='tlist' align='center'>\n");
                      buf.append("<thead>\n");
                      buf.append("<tr>\n");
                      if (!attachPrivilege.equalsIgnoreCase("view")) {
                          buf.append("<td align='center'  width='5%'>操作</td>\n");
                     } 
                      buf.append("<td width='25%' align='center'  nowrap='nowrap'><b>文件名</b></td>\n");
                      buf.append("<td width='25%' align='center'  nowrap='nowrap'><b>上传环节</b></td>\n");
                     if (isHaveDict){
                         buf.append("<td width='10%' align='center'  nowrap='nowrap'><b>附件类型</b></td>\n");
                     }
                     buf.append("<td width='10%' align='center'  nowrap='nowrap'><b>上传人</b></td>\n");
                     buf.append("<td width='30%' align='center'  nowrap='nowrap'><b>上传时间</b></td>\n");
                     buf.append("</tr>\n");
                     buf.append("</thead>\n");
                     for(int i=0;i<attachListData.size();i++){
                         Attachment attachment = (Attachment)attachListData.get(i);
                         buf.append("<tr height='25'>\n");
                         if (!attachPrivilege.equalsIgnoreCase("view")) {
                             String disabled = "disabled = 'true'";
                             if (attachPrivilege.equalsIgnoreCase("EDIT_OWN") && attachment.getCreateId().equals(sysOrg.getOrgId())) {
                                     disabled = " ";
                             }
                             if (attachPrivilege.equalsIgnoreCase("EDIT_ALL")) {
                                     disabled = " ";
                             }
                             buf.append("<td><input type='button' "+disabled+" name='power_button' value='删除' class='Button2' onclick=\"deleteProcessAttach('"+attachment.getAttachId()+"')\" ></td>\n");
                             }
                         buf.append("<td><a href="+request.getContextPath()+"/downloadFile_abdf.do?attachId="+attachment.getAttachId()+" target='attacheFrame'>"+attachment.getOriFileName()+"</a></td>\n");
                         buf.append("<td>"+attachment.getActivityName()+"</td>\n");
                        if (isHaveDict){
                               String  activityId = attachment.getActivityId();
                               IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
                              
                               Activity activity=wfCacheEngine.getActivityById(activityId);
                              
                               String dictType = activity.getAttachType()== null ? "" : activity.getAttachType();
                               String dictId = attachment.getDictId() == null ? "" : attachment.getDictId();
                               buf.append("<td>\n");
                               if (!dictType.equals("") && !dictId.equals("")){
                                   buf.append((DictHelper.CodeToName(dictType,dictId,activity.getAttachTypeDynamic(),activity.getAttachTypeValueMode(),request)));
                               }
                               else {
                                   buf.append("未知");
                               }
                               buf.append("</td>\n");
                              }
                              buf.append("<td>"+attachment.getCreateName()+"</td>\n");
                              buf.append("<td>"+DateHelper.converDateToLongStr(attachment.getCreateTime())+"</td>\n");
                              buf.append("</tr>\n");
                             }
                     buf.append("</table>\n");
                     buf.append("</div>\n");
                     buf.append("</fieldset>\n");
                     buf.append("</td>\n");
                     buf.append("</tr>\n");
                     buf.append("</table>\n");
                }
              } 
           out.println(buf.toString());
       }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
       return EVAL_PAGE;
     }
}
