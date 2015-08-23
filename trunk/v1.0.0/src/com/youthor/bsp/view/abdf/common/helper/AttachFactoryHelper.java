/**
 * 
 */
package com.youthor.bsp.view.abdf.common.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts.upload.FormFile;

import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Attachment;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;







public class AttachFactoryHelper {

    
    


    
    
    /**
     * �����ϴ�
     * @param Attachment
     * @param formFile
     * 跑流程时使用
     */
    public static void updateFile(Attachment attachment,FormFile formFile,HttpServletRequest request){
        try {
            String createSavePath = createSavePath();
            Org sysOrg =WebHelper.getOrg(request.getSession());
            String basePath = ConfigInfoHelper.getProperty("ATTACH_PATH") + "/" + createSavePath+"/";
            
            String activityid=StringHelper.doWithNull(request.getParameter("activityid"));
            String activityName=StringHelper.doWithNull(request.getParameter("activityName"));
             
            String appid=StringHelper.doWithNull(request.getParameter("appid"));
            attachment.setActivityId(activityid);
            attachment.setActivityName(activityName);
            attachment.setAppId(appid);
            String uid=getUid();
            String absolutePath = basePath+uid+formFile.getFileName();
            attachment.setFileSize(formFile.getFileSize()/1000);
            attachment.setCreateTime(new Date());
            attachment.setRealFileName(uid+formFile.getFileName());
            attachment.setOriFileName(formFile.getFileName());
            String attachName = formFile.getFileName();
            if(attachName.indexOf(".")>=0){
                attachName = attachName.substring(0, attachName.indexOf("."));
            }
            
            attachment.setFilePath(createSavePath);
            attachment.setCreateId(sysOrg.getOrgId());
            attachment.setCreateName(sysOrg.getOrgName());
            saveFileToDisk(formFile,basePath,absolutePath);
            //CreateThumbnail(basePath,uid+formFile.getFileName());
            IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade) SpringHelper.getBean("abdfServiceFacade");
            abdfServiceFacade.addAttachInfo(attachment);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        

    }
    
    
    
    /**
     * �����ϴ�
     * @param Attachment
     * @param formFile
     * 不跑流程时使用
     */
    public static void updateFile(FormFile formFile,String appid,String functionName,Org sysOrg,WorkItemDoing workItemDoing,String flowAttachType){
        try {
            Attachment attachment=new Attachment();
            attachment.setFunctionName(functionName);
            String createSavePath = createSavePath();
            
            String basePath = ConfigInfoHelper.getProperty("ATTACH_PATH") + "/" + createSavePath+"/";
            attachment.setAppId(appid);
            String uid=getUid();
            String absolutePath = basePath+uid+formFile.getFileName();
            if(formFile.getFileSize()==0) return;
            attachment.setFileSize(formFile.getFileSize()/1000);
            attachment.setCreateTime(new Date());
            attachment.setRealFileName(uid+formFile.getFileName());
            attachment.setOriFileName(formFile.getFileName());
            String attachName = formFile.getFileName();
            if(attachName.indexOf(".")>=0){
                attachName = attachName.substring(0, attachName.indexOf("."));
            }
            if (workItemDoing!=null) {
                attachment.setAppId(workItemDoing.getAppId());
                attachment.setActivityId(workItemDoing.getActivityId());
                attachment.setActivityName(workItemDoing.getActivityName());
                attachment.setProcessId(workItemDoing.getProcessId());
                attachment.setProcessName(workItemDoing.getProcessName());
                attachment.setProcessInstanceId(workItemDoing.getProcessInstanceId());
            }
            if (flowAttachType!=null&&!flowAttachType.equals("")){
                attachment.setDictId(flowAttachType);
            }
            attachment.setFilePath(createSavePath);
            attachment.setCreateId(sysOrg.getOrgId());
            attachment.setCreateName(sysOrg.getOrgName());
            saveFileToDisk(formFile,basePath,absolutePath);
            //CreateThumbnail(basePath,uid+formFile.getFileName());
            IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade) SpringHelper.getBean("abdfServiceFacade");
            abdfServiceFacade.addAttachInfo(attachment);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        

    }



    /**
     * �����ļ�
     * @throws Exception 
     */
    public static void downloadFile(Attachment attachment,HttpServletResponse response) throws Exception {
        
            if(attachment == null)
            {
                return;
            }
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename="
                    + new String(attachment.getOriFileName().getBytes("gb2312"),"iso8859-1"));
            OutputStream outStream = response.getOutputStream();
            String realPath = attachment.getFilePath()+""+attachment.getRealFileName();
            downloadToStream(realPath, outStream);
            outStream.close();
    }

    /**
     * �޸��ϴ��ļ�
     */
    public static void editFile() {

    }
    
    public static void downloadToStream(String path,OutputStream os) throws Exception
    {
        String absoluteRealPath = getAbsolutePathByRealPath(path);
        FileInputStream is = new FileInputStream(absoluteRealPath);
        IOUtils.copy(is, os);
        is.close();
    }

    public static boolean saveFileToDisk(FormFile file,String absolutePath,String absoluteFileName)
            throws Exception {
        try{
        File f = new File(absolutePath);
        if (!f.exists()) {
            f.mkdirs();
        }
        InputStream is = file.getInputStream();
        FileOutputStream os = new FileOutputStream(absoluteFileName);
        IOUtils.copy(is, os);
        is.close();
        os.close();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    private static String createSavePath(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String savePath = sdf.format(new java.util.Date());
        return "/"+savePath+"/";
    }



    public String getAttachBaseFileName(String uid) {
        return uid + ".attach";
    }

    private static String getAbsolutePathByRealPath(String realPath) throws Exception {
        return ConfigInfoHelper.getProperty("ATTACH_PATH") +"/"+ realPath;
    }

    /**
     * //��ȡ�����ļ����ļ���׺����
     * 
     * @param formFile
     *            FormFile
     * @return String
     */
    public static String getFileType(String fileName) {
        String type = "";
        try {
            String originalName = fileName;
            int k = originalName.lastIndexOf(".");
            type = originalName.substring(k);
        } catch (Exception ex) {
        }
        return type;
    }

    public static String getUid() {
        return System.currentTimeMillis() + "" + new Random().nextInt();
    }

    public static void deleteAttach(Attachment attachment)  throws Exception{
        String realPath=getAbsolutePathByRealPath(attachment.getFilePath());
        String  realFilePath=realPath+"/"+attachment.getRealFileName();
        File file=new File(realFilePath);
        if(file.exists())
            file.delete();
        
    }

    


}
