package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.MessageFolder;

public interface IMessageFolderDao {
    public String addUserMessageFolder(MessageFolder model);
    public String updateMessageFolder(MessageFolder model);
    public void deleteMessageFolder(String foldId);
    public List getUserAllMessageFolder(String userId);
    public List getDirectSubMessageFolder(String foldId);
    public List getAllSubMessageFolder(String foldId);
    public MessageFolder getMessageFolderById(String folderId);
    public List getMessageFolderByUserId(String userId,String folderType,String senderId);
    public MessageFolder getSysMessageFolder(String userId,String folderType);
}
