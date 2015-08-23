package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.MessageSend;

public interface IMessageSendDao {

    public String addMessageSend(MessageSend model);
    public String updateMessageSend(MessageSend model);
    public void deleteLogicMessageSend(String messageId);
    public void deletePhyMessageSend(String messageId);
    public List getAllMessageSendByFolderId(String folderId);
    public List getUserAllMessageSend(Page page,String userId);
    public List getAllMessageSendByFolderId(Page page,String folderId);
    public MessageSend getMessageSendById(String messageId);
}
