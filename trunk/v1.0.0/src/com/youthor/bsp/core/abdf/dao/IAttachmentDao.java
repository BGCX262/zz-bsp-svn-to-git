package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.Attachment;

public interface IAttachmentDao {

    String addAttachInfo(Attachment attachment);

    List getAttachInfoListByAppId(String appid);

    Attachment getAttachmentById(String attachId);

    void deleteAttach(Attachment attachment);

    boolean deleteAttachInfo(Attachment attachment);

    List getAttachInfoListByProcessInstanceId(String processInstanceId);

}
