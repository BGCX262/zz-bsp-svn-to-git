package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import org.hibernate.FlushMode;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.dao.IMessageFolderDao;
import com.youthor.bsp.core.abdf.model.MessageFolder;

public class MessageFolderDaoImpl extends BaseDAOHibernate implements IMessageFolderDao {

    @Override
    protected Class getModelClass() {
        return MessageFolder.class;
    }
    
    @Override
    public String addUserMessageFolder(MessageFolder model) {
        
        FlushMode flushMode =getSession().getFlushMode();
        getSession().setFlushMode(FlushMode.AUTO);
        super.doCreateObject(model);
        getSession().flush();
        getSession().setFlushMode(flushMode);
        
        return model.getFolderId();
    }

    @Override
    public void deleteMessageFolder(String folderId) {
        if(StringHelper.isHasContent(folderId)){
            MessageFolder mf = (MessageFolder)super.doFindObjectById(folderId);
            super.doDeleteObject(mf);
        }
    }

    @Override
    public List getAllSubMessageFolder(String folderId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.parentIds like '%" + folderId + "%' ");
        sb.append(" order by a.folderId desc");
        return super.doFind(sb.toString());
    }

    @Override
    public List getDirectSubMessageFolder(String folderId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.parentId = '" + folderId + "' ");
        sb.append(" order by a.folderId desc");
        return super.doFind(sb.toString());
    }

    @Override
    public MessageFolder getMessageFolderById(String folderId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.folderId = '" + folderId + "' ");
        List list = super.doFind(sb.toString());
        if(list != null || list.size() > 0){
            return  (MessageFolder)list.get(0);
        }
        else{
            return null;
        }
    }
    
    @Override
    public List getMessageFolderByUserId(String userId,String folderType,String senderId){
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.ownerId = '" + userId + "' ");
        sb.append(" and a.folderType = '" + folderType + "' ");
        if(StringHelper.isHasContent(senderId)){
            sb.append(" and a.putOrgIds like '&" + senderId + "%' ");
        }
        sb.append(" order by a.folderId desc");
        return super.doFind(sb.toString());
    }
    
    @Override
    public MessageFolder getSysMessageFolder(String userId,String folderType){
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.ownerId = '" + userId + "' ");
        sb.append(" and a.folderType = '" + folderType + "' ");
        sb.append(" and a.systemIn = '" + Constants.GLOBAL_YES + "' ");
        sb.append(" order by a.folderId desc");
        
        List list = super.doFind(sb.toString());
        if(list == null || list.isEmpty()){
            return null;
        }
        else{
            return (MessageFolder)list.get(0);
        }
    }
    
    @Override
    public List getUserAllMessageFolder(String userId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.ownerId = '" + userId + "' ");
        sb.append(" order by a.folderId desc");
        return super.doFind(sb.toString());
    }

    @Override
    public String updateMessageFolder(MessageFolder model) {
        super.doUpdateObject(model);
        return model.getFolderId();
    }
}