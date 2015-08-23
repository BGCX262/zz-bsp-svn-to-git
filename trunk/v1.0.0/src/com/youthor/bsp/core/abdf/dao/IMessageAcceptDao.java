package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.MessageAccept;

public interface IMessageAcceptDao {

    public String addMessageAccept(MessageAccept model);
    public void updateMessageAccept(MessageAccept model);
    public void deleteMessageAccept(String acceptId,String folderId);
    public List getAllMessageAcceptByFolderId(String folderId);
    public List getAllMessageAcceptByUserId(Page page,String userId);
    public List getAllMessageAcceptByFolderId(Page page,String folderId);
    public MessageAccept getMessageAcceptById(String id);
}
