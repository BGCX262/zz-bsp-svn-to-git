package com.youthor.bsp.core.abdf.dao.impl;

import java.io.File;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.dao.IAttachmentDao;
import com.youthor.bsp.core.abdf.model.Attachment;

public class AttachmentDaoImpl extends BaseDAOHibernate implements IAttachmentDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return Attachment.class;
    }
    public String addAttachInfo(Attachment attachment) {
        super.doCreateObject(attachment);
        return attachment.getAttachId();
    }

    public List getAttachInfoListByAppId(String appid) {
        String hql="from "+this.getModelClass().getName()+" as a where a.appId='"+appid+"' order by a.createTime desc";
        return super.doFind(hql);
    }

    public Attachment getAttachmentById(String attachId) {
        // TODO Auto-generated method stub
        return (Attachment)super.doFindObjectById(attachId);
    }

    public void deleteAttach(Attachment attachment) {
         super.doDeleteObjectReal(attachment);
        
    }
    public boolean deleteAttachInfo(Attachment attachment) {
        this.doDeleteObjectReal(attachment);
        String realPath=attachment.getFilePath()+""+attachment.getRealFileName();
        realPath=ConfigInfoHelper.getProperty("ATTACH_PATH") +"/"+ realPath;
        File file=new File(realPath);
        if(file.exists())
            file.delete();
        return true;
    }

    public List getAttachInfoListByProcessInstanceId(String processInstanceId) {
        String hql="from "+this.getModelClass().getName()+" as a where a.processInstanceId='"+processInstanceId+"' order by a.createTime desc";
        return super.doFind(hql);
    }
}
