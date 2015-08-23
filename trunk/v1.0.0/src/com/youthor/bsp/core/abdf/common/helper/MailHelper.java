package com.youthor.bsp.core.abdf.common.helper;

import java.io.File;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.youthor.bsp.core.abdf.common.Constants;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

/**
 * 邮件发送帮助类，采用单列模式
 * @author Jason
 *
 */
public class MailHelper {

    private static JavaMailSenderImpl mailSender;
    private static MailHelper mailHelp;
    
    private MailHelper(){
        //initial sender info
        mailSender = new JavaMailSenderImpl();
        
        Properties p=System.getProperties();
        //p.put("mail.smtp.starrls.enable", ConfigInfoHelper.getProperty(Constants.MAIL_SERVER_STMP_SSL)); 
        p.put("mail.smtp.auth", ConfigInfoHelper.getProperty(Constants.MAIL_SERVER_STMP_AUTH));
        mailSender.setJavaMailProperties(p);
        
        mailSender.setHost(ConfigInfoHelper.getProperty(Constants.MAIL_SERVER_HOST));
        mailSender.setPort(Integer.parseInt(ConfigInfoHelper.getProperty(Constants.MAIL_SERVER_PORT)));

        mailSender.setUsername(ConfigInfoHelper.getProperty(Constants.MAIL_SERVER_STMP_USERNAME));
        mailSender.setPassword(ConfigInfoHelper.getProperty(Constants.MAIL_SERVER_STMP_PASSWORD));
    }
    
    public synchronized static MailHelper getMailHelperInstance(){
        if(mailHelp == null){
            mailHelp = new MailHelper();
        }
        return mailHelp;
    }
    
    public void sendSimpleMessage(String[] recipients, String sender, String subject, String bodyText)throws MessagingException {
        sendMessage(recipients,sender,false,subject,bodyText,null,null);
    }
    
    /**
     * 通过模板文件名获取邮件内容
     * @param ftlName
     * @param mailContext
     * @return
     */
    public String getMailContentFromFlt(String ftlName,Map mailContext){
        try{
            Configuration fmc = new Configuration();
            fmc.setDefaultEncoding("UTF-8");
            fmc.setDirectoryForTemplateLoading(new File(ConfigInfoHelper.getProperty(Constants.MAIL_TEMPLATE_FILE_PATH)));
            fmc.setObjectWrapper(new DefaultObjectWrapper());
            
            Template template = fmc.getTemplate(ftlName);
            return FreeMarkerTemplateUtils.processTemplateIntoString(template, mailContext);
        }
        catch(Exception e){
            e.printStackTrace();
            return "";
        }
    }
    
    /**
     * 发送带附件的邮件
     * @param recipients
     * @param sender
     * @param resource
     * @param subject
     * @param bodyText
     * @param attachmentName
     * @param attatchmentSource
     * @throws MessagingException
     */
    public void sendMessage(String[] recipients, String sender, boolean htmlFlag, String subject,
            String bodyText, String[] attachmentName,String[] attatchmentSource)throws MessagingException {
        
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true,"UTF-8");
        helper.setTo(recipients);
        helper.setFrom(sender);

        helper.setText(bodyText,htmlFlag);
        helper.setSubject(subject);
        
        if(attatchmentSource != null && attatchmentSource.length >0){
            for(int i = 0;i < attatchmentSource.length;i++){
                if(attachmentName == null || (attachmentName.length < (i+1))){
                    helper.addAttachment(getFileNameByFileSource(attatchmentSource[i]), new File(attatchmentSource[i]));
                }
                else{
                    helper.addAttachment(attachmentName[i], new File(attatchmentSource[i]));
                }
            }
        }
        mailSender.send(message);
    }
    
    private String getFileNameByFileSource(String fileSource){
        if(StringHelper.isHasContent(fileSource)){
            String newFileSource = fileSource.replaceAll("\\\\", "/");
            String fileName = newFileSource.substring(newFileSource.lastIndexOf("/") + 1);
            return fileName;
        }
        else{
            return "";
        }
    }
}
