package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.IMessageAcceptDao;
import com.youthor.bsp.core.abdf.model.MessageAccept;

public class MessageAcceptDaoImpl extends BaseDAOHibernate implements IMessageAcceptDao {

    @Override
    protected Class getModelClass() {
        return MessageAccept.class;
    }

    //return PageHelper.executeQuery(page, getSession(), sb.toString()).list();    
    @Override
    public String addMessageAccept(MessageAccept model) {
        super.doCreateObject(model);
        return model.getId();
    }

    @Override
    public void deleteMessageAccept(String acceptId,String folderId) {
        if(StringHelper.isHasContent(acceptId)){
            MessageAccept ma = (MessageAccept)super.doFindObjectById(acceptId);
            String folderIds = ma.getFolderIds();
            if(folderId.equals(folderIds) || folderIds == null || "".equals(folderIds)){
                super.doDeleteObject(ma);
            }
            else{
                String fId[] = folderIds.split(",");
                String newFolderIds = "";
                for(int i =0;i < fId.length;i++){
                    if(!folderId.equals(fId[i])){
                        if(!"".equals(newFolderIds)){
                            newFolderIds = newFolderIds + ",";
                        }
                        newFolderIds = newFolderIds + fId[i];
                    }
                }
                ma.setFolderIds(newFolderIds);
                super.doUpdateObject(ma);
            }
        }
    }
    
    public List getAllMessageAcceptByFolderId(String folderId){
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.folderIds like '%" + folderId + "%' ");
        sb.append(" order by a.acceptTime desc");
        return super.doFind(sb.toString());
    }
    
    @Override
    public List getAllMessageAcceptByFolderId(Page page, String folderId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.folderIds like '%" + folderId + "%' ");
        sb.append(" order by a.acceptTime desc");
        return PageHelper.executeQuery(page, getSession(), sb.toString()).list();
    }

    @Override
    public List getAllMessageAcceptByUserId(Page page, String userId) {
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.ownerId = '" + userId + "' ");
        sb.append(" order by a.acceptTime desc");
        return PageHelper.executeQuery(page, getSession(), sb.toString()).list();
    }

    @Override
    public void updateMessageAccept(MessageAccept model) {
        super.doUpdateObject(model);
    }
    
    @Override
    public MessageAccept getMessageAcceptById(String id){
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        sb.append(" and a.id = '" + id + "' ");
        List list = super.doFind(sb.toString());
        if(list != null || list.size() > 0){
            return  (MessageAccept)list.get(0);
        }
        else{
            return null;
        }
    }
}