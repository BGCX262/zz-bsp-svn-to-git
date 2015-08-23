package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.IMessageSendDao;
import com.youthor.bsp.core.abdf.model.MessageSend;

public class MessageSendDaoImpl extends BaseDAOHibernate implements IMessageSendDao {

    @Override
    protected Class getModelClass() {
        return MessageSend.class;
    }

    @Override
    public String addMessageSend(MessageSend model) {
        super.doCreateObject(model);
        return model.getId();
    }

    @Override
    public void deleteLogicMessageSend(String messageId) {
        MessageSend ms = (MessageSend)super.doFindObjectById(messageId);
        ms.setIsDelete(Constants.GLOBAL_YES);
        super.doUpdateObject(ms);
    }

    @Override
    public void deletePhyMessageSend(String messageId) {
        MessageSend ms = (MessageSend)super.doFindObjectById(messageId);
        super.doDeleteObject(ms);
    }

    @Override
    public List getAllMessageSendByFolderId(Page page,String folderId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.folderId = '" + folderId + "' ");
        sb.append(" and a.isDelete ='" + Constants.GLOBAL_NO + "'");
        sb.append(" order by a.createTime desc");
        return PageHelper.executeQuery(page, getSession(), sb.toString()).list();
    }
    
    @Override
    public List getAllMessageSendByFolderId(String folderId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.folderId = '" + folderId + "' ");
        sb.append(" and a.isDelete ='" + Constants.GLOBAL_NO + "'");
        sb.append(" order by a.createTime desc");
        return super.doFind(sb.toString());
    }
    
    @Override
    public MessageSend getMessageSendById(String messageId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.id = '" + messageId + "' ");
        List list = super.doFind(sb.toString());
        if(list != null && list.size() > 0){
            return  (MessageSend)list.get(0);
        }
        else{
            return null;
        }
    }

    @Override
    public List getUserAllMessageSend(Page page,String userId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.sendOrgId = '" + userId + "' and ");
        sb.append(" and a.isDelete ='" + Constants.GLOBAL_NO + "'");
        sb.append(" order by a.createTime desc");
        
        return PageHelper.executeQuery(page, getSession(), sb.toString()).list();
    }

    @Override
    public String updateMessageSend(MessageSend model) {
        super.doUpdateObject(model);
        return model.getId();
    }
}