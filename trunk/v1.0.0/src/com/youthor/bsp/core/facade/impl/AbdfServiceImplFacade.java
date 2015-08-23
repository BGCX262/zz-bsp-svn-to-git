package com.youthor.bsp.core.facade.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.Tree;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.IAttachmentDao;
import com.youthor.bsp.core.abdf.dao.ICommonDao;
import com.youthor.bsp.core.abdf.dao.IDataBaseDao;
import com.youthor.bsp.core.abdf.dao.IDictDao;
import com.youthor.bsp.core.abdf.dao.IDictTreeDao;
import com.youthor.bsp.core.abdf.dao.IDictTreeTypeDao;
import com.youthor.bsp.core.abdf.dao.IDictTypeDao;
import com.youthor.bsp.core.abdf.dao.IFavoriteDao;
import com.youthor.bsp.core.abdf.dao.IFormLayoutDao;
import com.youthor.bsp.core.abdf.dao.IInformationDao;
import com.youthor.bsp.core.abdf.dao.IMessageAcceptDao;
import com.youthor.bsp.core.abdf.dao.IMessageFolderDao;
import com.youthor.bsp.core.abdf.dao.IMessageSendDao;
import com.youthor.bsp.core.abdf.dao.IOnLineHelperDao;
import com.youthor.bsp.core.abdf.dao.IReportFileDao;
import com.youthor.bsp.core.abdf.dao.IReportQueryParaDao;
import com.youthor.bsp.core.abdf.dao.ISubassemblyDao;
import com.youthor.bsp.core.abdf.dao.ISystemConfDao;
import com.youthor.bsp.core.abdf.dao.ITreeComponentDao;
import com.youthor.bsp.core.abdf.dao.IUrlLogDao;
import com.youthor.bsp.core.abdf.model.Attachment;
import com.youthor.bsp.core.abdf.model.Dict;
import com.youthor.bsp.core.abdf.model.DictTree;
import com.youthor.bsp.core.abdf.model.DictTreeType;
import com.youthor.bsp.core.abdf.model.DictType;
import com.youthor.bsp.core.abdf.model.Favorite;
import com.youthor.bsp.core.abdf.model.FavoriteItem;
import com.youthor.bsp.core.abdf.model.FormLayout;
import com.youthor.bsp.core.abdf.model.Information;
import com.youthor.bsp.core.abdf.model.MessageAccept;
import com.youthor.bsp.core.abdf.model.MessageFolder;
import com.youthor.bsp.core.abdf.model.MessageSend;
import com.youthor.bsp.core.abdf.model.OnLineHelper;
import com.youthor.bsp.core.abdf.model.ReportFile;
import com.youthor.bsp.core.abdf.model.ReportQueryPara;
import com.youthor.bsp.core.abdf.model.Subassembly;
import com.youthor.bsp.core.abdf.model.SystemConf;
import com.youthor.bsp.core.abdf.model.UrlLog;
import com.youthor.bsp.core.abdf.model.wrapper.MessageSendAndAccept;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.urss.dao.IOrgDao;
import com.youthor.bsp.core.urss.model.Org;

public class AbdfServiceImplFacade implements IAbdfServiceFacade {

    private IDictTypeDao dictTypeDao;
    private IDictDao dictDao;
    private IDictTreeDao dictTreeDao;
    private IDataBaseDao dataBaseDao;
    private ISubassemblyDao subassemblyDao;
    private IDictTreeTypeDao dictTreeTypeDao;
    private IFormLayoutDao formLayoutDao;
    private ITreeComponentDao treeComponentDao;
    private IOnLineHelperDao onLineHelperDao;
    private IAttachmentDao attachmentDao;
    private ISystemConfDao systemConfDao;
    private IInformationDao informationDao;
    private IFavoriteDao favoriteDao;
    
    private IMessageSendDao messageSendDao;
    private IMessageAcceptDao messageAcceptDao;
    private IMessageFolderDao messageFolderDao;
    private IOrgDao orgDao;
    private IUrlLogDao urlLogDao;
    private ICommonDao commonDao;
    
    private IReportQueryParaDao reportQueryParaDao;
    private IReportFileDao reportFileDao;
    
    public void setCommonDao(ICommonDao commonDao) {
        this.commonDao = commonDao;
    }

    public void setMessageSendDao(IMessageSendDao messageSendDao) {
        this.messageSendDao = messageSendDao;
    }
    
    public void setMessageAcceptDao(IMessageAcceptDao messageAcceptDao) {
        this.messageAcceptDao = messageAcceptDao;
    }
    
    public void setMessageFolderDao(IMessageFolderDao messageFolderDao) {
        this.messageFolderDao = messageFolderDao;
    }
    
    public void setOrgDao(IOrgDao orgDao) {
        this.orgDao = orgDao;
    }
    
    
    public void setInformationDao(IInformationDao informationDao){
        this.informationDao = informationDao;
    }
    public void setSystemConfDao(ISystemConfDao systemConfDao) {
        this.systemConfDao = systemConfDao;
    }

    public void setDictTypeDao(IDictTypeDao dictTypeDao) {
        this.dictTypeDao = dictTypeDao;
    }

    public void setDictDao(IDictDao dictDao) {
        this.dictDao = dictDao;
    }

    public DictType getDictTypeById(String dictTypeId) {
        // TODO Auto-generated method stub
        return dictTypeDao.getDictTypeById(dictTypeId);
    }

    public List getAllDictType() {
        // TODO Auto-generated method stub
        return dictTypeDao.getAllDictType();
    }

    public boolean addDictType(DictType dictType) {
        // TODO Auto-generated method stub
        return dictTypeDao.addDictType(dictType);
    }

    public boolean updateDictType(DictType dictType) {
        // TODO Auto-generated method stub
        return dictTypeDao.updateDictType(dictType);
    }

    public boolean deleteDictTypeById(String dictTypeId) {
        // TODO Auto-generated method stub
        return dictTypeDao.deleteDictTypeById(dictTypeId);
    }

    public List getPageDictType() {
        // TODO Auto-generated method stub
        return dictTypeDao.getPageDictType();
    }

    public List getDictTypeByModuleName(String moduleName) {
        // TODO Auto-generated method stub
        return dictTypeDao.getDictTypeByModuleName(moduleName);
    }

    public boolean deleteDictTypeByIds(String[] ids) {
        return dictTypeDao.deleteDictTypeByIds(ids);

    }

    public List getDataTable() {
        // TODO Auto-generated method stub
        return dataBaseDao.getDataTable();
    }

    public List getDataTableField(String tableName) {
        // TODO Auto-generated method stub
        return dataBaseDao.getDataTableField(tableName);
    }

    public List getAllSubassembly() {
        // TODO Auto-generated method stub
        return subassemblyDao.getAllSubassembly();
    }

    public Subassembly getSubassemblyById(String subassemblyId) {
        // TODO Auto-generated method stub
        return subassemblyDao.getSubassemblyById(subassemblyId);
    }

    public String addSubassembly(Subassembly subassembly) {
        return subassemblyDao.addSubassembly(subassembly);

    }

    public void updateSubassembly(Subassembly subassembly) {
        // TODO Auto-generated method stub
        subassemblyDao.updateSubassembly(subassembly);
    }

    public ISubassemblyDao getSubassemblyDao() {
        return subassemblyDao;
    }

    public void setSubassemblyDao(ISubassemblyDao subassemblyDao) {
        this.subassemblyDao = subassemblyDao;
    }

    public void setDictTreeDao(IDictTreeDao dictTreeDao) {
        this.dictTreeDao = dictTreeDao;
    }

    public DictTree getDictTreeById(String treeId) {
        // TODO Auto-generated method stub
        return dictTreeDao.getDictTreeById(treeId);
    }

    public boolean deleteDictTreeByIds(String[] dictTreeIds) {
        // TODO Auto-generated method stub
        return dictTreeDao.deleteDictTreeByIds(dictTreeIds);
    }

    public List getSubDictTreeByParentId(String parentId) {
        // TODO Auto-generated method stub
        return dictTreeDao.getSubDictTreeByParentId(parentId);
    }

    public void updateMoveDictTree(DictTree source) {
        dictTreeDao.updateDictTree(source);
        List listSub = dictTreeDao.getAllSubDictTreeByParentId(source
                .getTreeId());
        if (listSub != null && listSub.size() > 0) {
            for (int i = 0; i < listSub.size(); i++) {
                DictTree dictTree = (DictTree) listSub.get(i);
                String subAllParentIds = dictTree.getAllParentId();
                String subAllParentNames = dictTree.getAllParentName();
                String[] subAllParentIdsArr = StringHelper.split(
                        subAllParentIds, ":");
                String[] subAllParentNamesArr = StringHelper.split(
                        subAllParentNames, ":");
                int j = 0;
                for (int n = 0; n < subAllParentIdsArr.length; n++) {
                    if (source.getTreeId().equals(subAllParentIdsArr[n])) {
                        j = n;
                        break;
                    }
                }
                StringBuffer sbId = new StringBuffer();
                StringBuffer sbName = new StringBuffer();
                for (int n = j; n < subAllParentIdsArr.length; n++) {
                    sbId.append(subAllParentIdsArr[n] + ":");
                    sbName.append(subAllParentNamesArr[n] + ":");
                }
                String sbIdStr = sbId.toString().substring(0,
                        sbId.toString().length() - 1);
                String sbNameStr = sbName.toString().substring(0,
                        sbName.toString().length() - 1);
                if (!StringHelper.doWithNull(source.getAllParentId())
                        .equals("")) {
                    dictTree.setAllParentId(source.getAllParentId() + ":"
                            + sbIdStr);
                } else {
                    dictTree.setAllParentId(sbIdStr);
                }

                if (!StringHelper.doWithNull(source.getAllParentName()).equals(
                        "")) {
                    dictTree.setAllParentName(source.getAllParentName() + ":"
                            + sbNameStr);
                } else {
                    dictTree.setAllParentName(sbNameStr);
                }
                dictTreeDao.updateDictTree(dictTree);
            }
        }

    }

    public String addDictTree(DictTree dictTree) {
        return dictTreeDao.addDictTree(dictTree);
    }

    public void updateDictTree(DictTree dictTree) {
        dictTreeDao.updateDictTree(dictTree);

    }

    public List getTopDictTreeByType(String treeType) {
        // TODO Auto-generated method stub
        return dictTreeDao.getTopDictTreeByType(treeType);
    }

    public DictTree getDictTreeRoot(String treeType) {
        // TODO Auto-generated method stub
        return dictTreeDao.getDictTreeRoot(treeType);
    }

    public List getAllDictTreeByType(String treeType) {
        // TODO Auto-generated method stub
        return dictTreeDao.getAllDictTreeByType(treeType);
    }

    public List getAllSubDictTreeByParentId(String parentId) {
        // TODO Auto-generated method stub
        return dictTreeDao.getAllSubDictTreeByParentId(parentId);
    }

    public void setDataBaseDao(IDataBaseDao dataBaseDao) {
        this.dataBaseDao = dataBaseDao;
    }

    public List getAlltDictTypeTree() {
        // TODO Auto-generated method stub
        return dictTreeTypeDao.getAlltDictTypeTree();
    }

    public void setDictTreeTypeDao(IDictTreeTypeDao dictTreeTypeDao) {
        this.dictTreeTypeDao = dictTreeTypeDao;
    }

    public String addDictTreeType(DictTreeType dictTreeType) {
        // TODO Auto-generated method stub
        dictTreeTypeDao.addDictTreeType(dictTreeType);
        List sub = dictTreeType.getSubPropertyList();
        if (sub != null && sub.size() > 0) {
            for (int i = 0; i < sub.size(); i++) {
                FormLayout formLayout = (FormLayout) sub.get(i);
                formLayout.setParentId(dictTreeType.getTreeTypeId());
                formLayoutDao.addFormLayout(formLayout);
            }
        }
        return dictTreeType.getTreeTypeId();
    }

    public String updateDictTreeType(DictTreeType dictTreeType) {
        dictTreeTypeDao.updateDictTreeType(dictTreeType);
        List sub = dictTreeType.getSubPropertyList();
        String deleteIds = dictTreeType.getDeleteIds();
        if (!StringHelper.doWithNull(deleteIds).equals("")) {
            String[] deleteArr = StringHelper.split(deleteIds, ",");
            for (int i = 0; i < deleteArr.length; i++) {
                FormLayout formLayout = formLayoutDao
                        .getFormLayoutById(deleteArr[i]);
                formLayoutDao.deleteFormLayout(formLayout);
            }

        }
        if (sub != null && sub.size() > 0) {
            for (int i = 0; i < sub.size(); i++) {
                FormLayout formLayout = (FormLayout) sub.get(i);
                formLayout.setParentId(dictTreeType.getTreeTypeId());
                if (StringHelper.doWithNull(formLayout.getFormLayoutId())
                        .equals("")) {
                    formLayoutDao.addFormLayout(formLayout);
                } else {
                    formLayoutDao.updateFormLayout(formLayout);
                }
            }
        }
        return dictTreeType.getTreeTypeId();
    }

    public DictTreeType getDictTreeTypeById(String treeTypeId) {
        // TODO Auto-generated method stub
        return dictTreeTypeDao.getDictTreeTypeById(treeTypeId);
    }

    public void setFormLayoutDao(IFormLayoutDao formLayoutDao) {
        this.formLayoutDao = formLayoutDao;
    }

    public List getFormLayoutListByParentId(String parentId) {
        // TODO Auto-generated method stub
        return formLayoutDao.getFormLayoutListByParentId(parentId);
    }

    public DictTreeType getDictTreeTypeByCode(String treeType) {
        // TODO Auto-generated method stub
        return dictTreeTypeDao.getDictTreeTypeByCode(treeType);
    }

    public void setTreeComponentDao(ITreeComponentDao treeComponentDao) {
        this.treeComponentDao = treeComponentDao;
    }

    public List listTopNodeObjectByType(Page page, DictTreeType dictTreeType) {
        // TODO Auto-generated method stub
        return treeComponentDao.listTopNodeObjectByType(page, dictTreeType);
    }

    public List getAllNodeDataByDictTreeType(DictTreeType dictTreeType) {
        // TODO Auto-generated method stub
        return treeComponentDao.getAllNodeDataByDictTreeType(dictTreeType);
    }

    public DictType getDictTyeByComIdCode(String gsId, String dictTypeCode) {
        // TODO Auto-generated method stub
        return dictTypeDao.getDictTyeByComIdCode(gsId, dictTypeCode);
    }

    public List listDictByDictTypeId(Page page, String dictTypeId) {
        // TODO Auto-generated method stub
        return dictDao.listDictByDictTypeId(page, dictTypeId);
    }

    public String addDict(Dict dict) {
        // TODO Auto-generated method stub
        return dictDao.addDict(dict);
    }

    public String updateDict(Dict dict) {
        // TODO Auto-generated method stub
        return dictDao.updateDict(dict);
    }

    public Dict getDictById(String dictId) {
        // TODO Auto-generated method stub
        return dictDao.getDictById(dictId);
    }

    public List getDictByDictTypeId(String dictTypeId) {
        // TODO Auto-generated method stub
        return dictDao.getDictByDictTypeId(dictTypeId);
    }

    public void setAttachmentDao(IAttachmentDao attachmentDao) {
        this.attachmentDao = attachmentDao;
    }

    public void setOnLineHelperDao(IOnLineHelperDao onLineHelperDao) {
        this.onLineHelperDao = onLineHelperDao;
    }

    public String addAttachInfo(Attachment attachment) {
        // TODO Auto-generated method stub
        return attachmentDao.addAttachInfo(attachment);
    }

    public List getTopOnLineHelper() {
        // TODO Auto-generated method stub
        return onLineHelperDao.getTopOnLineHelper();
    }

    public OnLineHelper getOnLineHelperById(String id) {
        // TODO Auto-generated method stub
        return onLineHelperDao.getOnLineHelperById(id);
    }

    public boolean deleteOnLineHelperByIds(String[] onLineHelperIds) {
        if (onLineHelperIds == null || onLineHelperIds.length == 0)
            return true;
        for (int i = 0; i < onLineHelperIds.length; i++) {
            List allSub = onLineHelperDao
                    .getAllSubOnLineHelperByParentId(onLineHelperIds[i]);
            if (allSub == null)
                allSub = new ArrayList();
            for (int j = 0; j < allSub.size(); j++) {
                OnLineHelper onLineHelper = (OnLineHelper) allSub.get(j);
                List allAtt = attachmentDao
                        .getAttachInfoListByAppId(onLineHelper
                                .getOnLineHelperId());
                if (allAtt == null)
                    allAtt = new ArrayList();
                for (int a = 0; a < allAtt.size(); a++) {
                    Attachment attachment = (Attachment) allAtt.get(a);
                    attachmentDao.deleteAttachInfo(attachment);
                }
                onLineHelperDao.deleteOnLineHelper(onLineHelper);
            }
            OnLineHelper onLineHelper = onLineHelperDao
                    .getOnLineHelperById(onLineHelperIds[i]);
            List allAtt = attachmentDao.getAttachInfoListByAppId(onLineHelper
                    .getOnLineHelperId());
            if (allAtt == null)
                allAtt = new ArrayList();
            for (int a = 0; a < allAtt.size(); a++) {
                Attachment attachment = (Attachment) allAtt.get(a);
                attachmentDao.deleteAttachInfo(attachment);
            }
            onLineHelperDao.deleteOnLineHelper(onLineHelper);
        }

        return true;
    }

    public List getSubOnLineHelperByParentId(String onLineHelperId) {
        // TODO Auto-generated method stub
        return onLineHelperDao.getSubOnLineHelperByParentId(onLineHelperId);
    }

    public List getAttachInfoListByAppId(String onLineHelperId) {
        // TODO Auto-generated method stub
        return attachmentDao.getAttachInfoListByAppId(onLineHelperId);
    }

    public Attachment getAttachInfoById(String id) {
        // TODO Auto-generated method stub
        return attachmentDao.getAttachmentById(id);
    }

    public boolean deleteAttachInfo(Attachment attachment) {
        // TODO Auto-generated method stub
        return attachmentDao.deleteAttachInfo(attachment);
    }

    public List getAllSubOnLineHelperByParentId(String onLineHelperId) {
        // TODO Auto-generated method stub
        return onLineHelperDao.getAllSubOnLineHelperByParentId(onLineHelperId);
    }

    public void updateMoveOnLineHelper(OnLineHelper source) {
        onLineHelperDao.updateOnLineHelper(source);
        List listSub = onLineHelperDao.getAllSubOnLineHelperByParentId(source
                .getOnLineHelperId());
        if (listSub != null && listSub.size() > 0) {
            for (int i = 0; i < listSub.size(); i++) {
                OnLineHelper onLineHelper = (OnLineHelper) listSub.get(i);
                String subAllParentIds = onLineHelper.getAllParentId();
                String subAllParentNames = onLineHelper.getAllParentName();
                String[] subAllParentIdsArr = StringHelper.split(
                        subAllParentIds, ":");
                String[] subAllParentNamesArr = StringHelper.split(
                        subAllParentNames, ":");
                int j = 0;
                for (int n = 0; n < subAllParentIdsArr.length; n++) {
                    if (source.getOnLineHelperId()
                            .equals(subAllParentIdsArr[n])) {
                        j = n;
                        break;
                    }
                }
                StringBuffer sbId = new StringBuffer();
                StringBuffer sbName = new StringBuffer();
                for (int n = j; n < subAllParentIdsArr.length; n++) {
                    sbId.append(subAllParentIdsArr[n] + ":");
                    sbName.append(subAllParentNamesArr[n] + ":");
                }
                String sbIdStr = sbId.toString().substring(0,
                        sbId.toString().length() - 1);
                String sbNameStr = sbName.toString().substring(0,
                        sbName.toString().length() - 1);
                if (!StringHelper.doWithNull(source.getAllParentId())
                        .equals("")) {
                    onLineHelper.setAllParentId(source.getAllParentId() + ":"
                            + sbIdStr);
                } else {
                    onLineHelper.setAllParentId(sbIdStr);
                }

                if (!StringHelper.doWithNull(source.getAllParentName()).equals(
                        "")) {
                    onLineHelper.setAllParentName(source.getAllParentName()
                            + ":" + sbNameStr);
                } else {
                    onLineHelper.setAllParentName(sbNameStr);
                }
                onLineHelperDao.updateOnLineHelper(onLineHelper);
            }
        }
    }

    public String addOnLineHelper(OnLineHelper onLineHelper) {
        return onLineHelperDao.addOnLineHelper(onLineHelper);
    }

    public String updateOnLineHelper(OnLineHelper onLineHelper) {
        return onLineHelperDao.updateOnLineHelper(onLineHelper);
    }

    public List getAllOnLineHelper() {
        return onLineHelperDao.getAllOnLineHelper();
    }

    public String addTreeObject(Object modelObject) {
        return treeComponentDao.addTreeObject(modelObject);
    }

    public String updateTreeObject(Object modelObject) {
        return treeComponentDao.updateTreeObject(modelObject);
    }

    public Object getTreeNodeById(String modelClass, String id) {
        return treeComponentDao.treeDaogetTreeNodeById(modelClass, id);
    }

    public List getSubTreeNodesByParentId(String modelClass, String id) {
        return treeComponentDao.getSubTreeNodesByParentId(modelClass, id);
    }

    public void updateMoveTreeNodeObject(String modelClass, Object source) {
        treeComponentDao.updateTreeObject(source);
        Tree tree = (Tree) source;
        List listSub = treeComponentDao.getAllSubTreeNodesByParentId(
                modelClass, tree.getId());
        if (listSub != null && listSub.size() > 0) {
            for (int i = 0; i < listSub.size(); i++) {
                Object object = listSub.get(i);
                Tree treeSub = (Tree) object;
                String subAllParentIds = treeSub.getAllParentId();
                String subAllParentNames = treeSub.getAllParentName();
                String[] subAllParentIdsArr = StringHelper.split(
                        subAllParentIds, ":");
                String[] subAllParentNamesArr = StringHelper.split(
                        subAllParentNames, ":");
                int j = 0;
                for (int n = 0; n < subAllParentIdsArr.length; n++) {
                    if (tree.getId().equals(subAllParentIdsArr[n])) {
                        j = n;
                        break;
                    }
                }
                StringBuffer sbId = new StringBuffer();
                StringBuffer sbName = new StringBuffer();
                for (int n = j; n < subAllParentIdsArr.length; n++) {
                    sbId.append(subAllParentIdsArr[n] + ":");
                    sbName.append(subAllParentNamesArr[n] + ":");
                }
                String sbIdStr = sbId.toString().substring(0,
                        sbId.toString().length() - 1);
                String sbNameStr = sbName.toString().substring(0,
                        sbName.toString().length() - 1);
                try {
                    if (!StringHelper.doWithNull(tree.getAllParentId()).equals(
                            "")) {

                        BeanUtils.setProperty(object, "allParentId", tree
                                .getAllParentId()
                                + ":" + sbIdStr);

                    } else {

                        BeanUtils.setProperty(object, "allParentId", sbIdStr);

                    }

                    if (!StringHelper.doWithNull(tree.getAllParentName())
                            .equals("")) {
                        BeanUtils.setProperty(object, "allParentName", tree
                                .getAllParentName()
                                + ":" + sbNameStr);

                    } else {
                        BeanUtils.setProperty(object, "allParentName",
                                sbNameStr);

                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
                treeComponentDao.updateTreeObject(object);
            }
        }

    }

    public void deleteTreeNodeObject(DictTreeType dictTreeType, String id) {
        treeComponentDao.deleteTreeNodeObject(dictTreeType, id);

    }

    
    public List getAttachInfoListByProcessInstanceId(String processInstanceId) {
        return attachmentDao.getAttachInfoListByProcessInstanceId(processInstanceId);
    }

    
    public List getAllSystemConf(){
        return systemConfDao.getAllSystemConf();
    }

    
    public String updateSystemConf(SystemConf model){
        return systemConfDao.updateSystemConf(model);
    }
    
    
    public SystemConf getSystemConfById(String id){
        return systemConfDao.getSystemConfById(id);
    }

    
    public OnLineHelper getOnLineHelperByCode(String onLineHelperCode) {
        
        return onLineHelperDao.getOnLineHelperByCode(onLineHelperCode);
    }
    
    public String addInformation(Information information){
        return informationDao.addInformation(information);
    }
    public String updateInformation(Information information){
        return informationDao.updateInformation(information);
    }
    public List getValidateInformations(Date date){
        return informationDao.getValidateInformations(date);
    }
    public List getValidateInformationsByType(String type,Date date){
        return informationDao.getValidateInformationsByType(type, date);
    }
    public Information getInformationById(String informationId){
        return informationDao.getInformationById(informationId);
    }
    public void deleteInformation(Information information){
        informationDao.deleteInformation(information);
    }
    public List getAllInformations(Page page,Information model){
        return informationDao.getAllInformations(page,model);
    }
    public boolean deleteInformationByIds(String[] inforIds){
        if (inforIds == null || inforIds.length == 0){
            return true;
        }
        for (int i = 0; i < inforIds.length; i++) {
            List allAtt = attachmentDao.getAttachInfoListByAppId(inforIds[i]);
            for (int a = 0; a < allAtt.size(); a++) {
                Attachment attachment = (Attachment) allAtt.get(a);
                attachmentDao.deleteAttachInfo(attachment);
            }
            Information model = informationDao.getInformationById(inforIds[i]);
            informationDao.deleteInformation(model);    
        }
        return true;
    }
    
    public List getFavoriteByOrgId(String orgId) {
        // TODO Auto-generated method stub
        return favoriteDao.getFavoriteByOrgId(orgId);
    }
    public void setFavoriteDao(IFavoriteDao favoriteDao) {
        this.favoriteDao = favoriteDao;
    }

    public String addFavorite(Favorite favorite) {
        // TODO Auto-generated method stub
        return favoriteDao.addFavorite(favorite);
    }

    public String addFavoriteItem(FavoriteItem favoriteItem) {
        // TODO Auto-generated method stub
        return favoriteDao.addFavoriteItem(favoriteItem);
    }
    
    public List getFavoriteItemByOrgId(String orgId) {
        // TODO Auto-generated method stub
        return favoriteDao.getFavoriteItemByOrgId(orgId);
    }
    
    //消息处理
    public void initUserMessageFolder(String userId,String userName){
        if(!StringHelper.isHasContent(userId)){
            return;
        }
        
        List folderList = messageFolderDao.getUserAllMessageFolder(userId);
        if(folderList == null || folderList.size() == 0){
            //List distList = dictDao.getDictByDictTypeId(Constants.GLOBAL_MESSAGE_BOX_DEFINE);
            
            MessageFolder mf1 = new MessageFolder();
            mf1.setAllowSubFolder(Constants.GLOBAL_YES);
            mf1.setFolderName("收件箱");
            mf1.setFolderType(Constants.MESSAGE_FOLDER_TYPE_ACCEPT);
            mf1.setOwnerId(userId);
            mf1.setOwnerName(userName);
            mf1.setParentId("");
            mf1.setParentIds("");
            mf1.setParentNames("");
            mf1.setPutOrgIds("");
            mf1.setPutOrgNames("");
            mf1.setSystemIn(Constants.GLOBAL_YES);
            messageFolderDao.addUserMessageFolder(mf1);
    
            MessageFolder mf2 = new MessageFolder();
            mf2.setAllowSubFolder(Constants.GLOBAL_YES);
            mf2.setFolderName("草稿箱");
            mf2.setFolderType(Constants.MESSAGE_FOLDER_TYPE_DRAFT);
            mf2.setOwnerId(userId);
            mf2.setOwnerName(userName);
            mf2.setParentId("");
            mf2.setParentIds("");
            mf2.setParentNames("");
            mf2.setPutOrgIds("");
            mf2.setPutOrgNames("");
            mf2.setSystemIn(Constants.GLOBAL_YES);
            messageFolderDao.addUserMessageFolder(mf2);
            
            MessageFolder mf3 = new MessageFolder();
            mf3.setAllowSubFolder(Constants.GLOBAL_NO);
            mf3.setFolderName("已发送");
            mf3.setFolderType(Constants.MESSAGE_FOLDER_TYPE_SEND);
            mf3.setOwnerId(userId);
            mf3.setOwnerName(userName);
            mf3.setParentId("");
            mf3.setParentIds("");
            mf3.setParentNames("");
            mf3.setPutOrgIds("");
            mf3.setPutOrgNames("");
            mf3.setSystemIn(Constants.GLOBAL_YES);
            messageFolderDao.addUserMessageFolder(mf3);
            
            MessageFolder mf4 = new MessageFolder();
            mf4.setAllowSubFolder(Constants.GLOBAL_NO);
            mf4.setFolderName("回收站");
            mf4.setFolderType(Constants.MESSAGE_FOLDER_TYPE_TRASH);
            mf4.setOwnerId(userId);
            mf4.setOwnerName(userName);
            mf4.setParentId("");
            mf4.setParentIds("");
            mf4.setParentNames("");
            mf4.setPutOrgIds("");
            mf4.setPutOrgNames("");
            mf4.setSystemIn(Constants.GLOBAL_YES);
            messageFolderDao.addUserMessageFolder(mf3);
        }
    }
    @Override
    public String addUserMessageFolder(MessageFolder folder){
        //有父类，没有父类的文件夹无效
        if(StringHelper.isHasContent(folder.getParentId())){
            MessageFolder mf = messageFolderDao.getMessageFolderById(folder.getParentId());
            if(Constants.GLOBAL_YES.equals(mf.getAllowSubFolder())){
                folder.setAllowSubFolder(Constants.GLOBAL_YES);
                folder.setFolderType(mf.getFolderType());
                
                String parentIds = mf.getParentIds();
                String parentNames = mf.getParentNames();
                if(parentIds == null){
                    parentIds = "";
                }
                if(parentNames == null){
                    parentNames ="";
                }
                if(!"".equals(parentIds)){
                    parentIds = parentIds +",";
                    parentNames = parentNames + ",";
                }
                parentIds = parentIds + mf.getFolderId();
                parentNames = parentNames + mf.getFolderName();

                folder.setParentIds(parentIds);
                folder.setParentNames(parentNames);
                folder.setSystemIn(Constants.GLOBAL_NO);
                
                return messageFolderDao.addUserMessageFolder(folder);
            }
        }
        return null;
    }
    @Override
    public String updateMessageFolder(MessageFolder folder){
        return messageFolderDao.updateMessageFolder(folder);
    }
    @SuppressWarnings("unchecked")
    @Override
    public void deleteUserMessageFolder(String folderId){
        MessageFolder userFolder = messageFolderDao.getMessageFolderById(folderId);
        if(userFolder != null){
            if(Constants.GLOBAL_YES.equals(userFolder.getSystemIn())){
                return;
            }
            //删除子目录
            List subFolderList = messageFolderDao.getDirectSubMessageFolder(userFolder.getFolderId());
            if(subFolderList != null && subFolderList.size() >0){
                int len = subFolderList.size();
                for(int i=0;i<len;i++){
                    MessageFolder mf = (MessageFolder)subFolderList.get(i);
                    deleteUserMessageFolder(mf.getFolderId());                    
                }
            }
            else{
                //删除的消息
                List acceptList = messageAcceptDao.getAllMessageAcceptByFolderId(folderId);
                if(acceptList != null && acceptList.size()>0){
                    int len = acceptList.size();
                    for(int i=0;i<len;i++){
                        MessageAccept ma = (MessageAccept)subFolderList.get(i);
                        messageAcceptDao.deleteMessageAccept(ma.getId(), folderId);                
                    }
                }
                List sendList = messageSendDao.getAllMessageSendByFolderId(folderId);
                if(sendList != null && sendList.size()>0){
                    int len = acceptList.size();
                    for(int i=0;i<len;i++){
                        MessageSend ms = (MessageSend)subFolderList.get(i);
                        messageSendDao.deleteLogicMessageSend(ms.getId());            
                    }
                }
                messageFolderDao.deleteMessageFolder(folderId);
            }
        }
    }
    @SuppressWarnings("unchecked")
    @Override
    public List getUserAllMessageFolder(String userId){
        return messageFolderDao.getUserAllMessageFolder(userId);
    }
    @Override
    public MessageFolder getUserMessageFolderById(String folderId){
        return messageFolderDao.getMessageFolderById(folderId);
    }
    @Override
    public String addMessageSend(MessageSend messageSend){
        MessageFolder mf = messageFolderDao.getMessageFolderById(messageSend.getFolderId());
        messageSend.setFolderType(mf.getFolderType());
        messageSend.setCreateTime(new Date());
        
        return messageSendDao.addMessageSend(messageSend);
    }
    @Override
    public String udpateMessageSend(MessageSend messageSend){
        return messageSendDao.updateMessageSend(messageSend);
    }
    @Override
    public void deleteMessageSend(String id){
        MessageSend ms = messageSendDao.getMessageSendById(id);
        MessageFolder mf = messageFolderDao.getMessageFolderById(ms.getFolderId());
        //如果是在已发送箱里，则放到回收站里否则删除
        if(Constants.MESSAGE_FOLDER_TYPE_SEND.equals(mf.getFolderType())){
            List list = messageFolderDao.getMessageFolderByUserId(mf.getOwnerId(),Constants.MESSAGE_FOLDER_TYPE_TRASH,null);
            if(list != null && list.size()>0){
                MessageFolder userMF = (MessageFolder)list.get(0);
                ms.setFolderId(userMF.getFolderId());
                ms.setFolderType(Constants.MESSAGE_FOLDER_TYPE_TRASH);
            }
            else{
                messageSendDao.deleteLogicMessageSend(id);
            }
        }
        else{
            messageSendDao.deleteLogicMessageSend(id);
        }
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List getMessageSendByFolderId(Page page,String folderId){
        return messageSendDao.getAllMessageSendByFolderId(page, folderId);
    }
    /**
     * 发送消息了
     */
    @Override
    public void addSendMessageSend(String messageId){
        MessageSend messageSend = messageSendDao.getMessageSendById(messageId);
        String acceptOrgIds = messageSend.getAcceptOrgIds();
        String isSend = messageSend.getIsSend();
        
        //发送给相应的人员
        if(acceptOrgIds != null){
            String [] orgIds = acceptOrgIds.split(",");
            int orgIdsLen = orgIds.length;
            for(int i=0;i<orgIdsLen;i++){
                String orgId = orgIds[i];
                
                //初始化没有创建文件夹的用户
                Org oneUser = orgDao.getOrgById(orgId);
                initUserMessageFolder(orgId,oneUser.getOrgName());
                MessageFolder mf = getUserAcceptMessageFolder(orgId,messageSend.getSendOrgId());
                if(mf == null){
                    continue;
                }
                
                MessageAccept ma = new MessageAccept();
                ma.setAcceptTime(new Date());
                ma.setFolderIds(mf.getFolderId());
                ma.setFolderType(mf.getFolderType());
                ma.setOwnerId(orgId);
                ma.setOwnerName(orgDao.getOrgById(orgId).getOrgName());
                ma.setReadFlag(Constants.GLOBAL_NO);
                ma.setSendId(messageSend.getId());
                messageAcceptDao.addMessageAccept(ma);
                
                //下发
                if(Constants.GLOBAL_YES.equals(isSend)){
                    List orgList = orgDao.getOrgListByParent(orgId);
                    if(orgList != null && orgList.size() >0){
                        int orgLen = orgList.size();
                        for(int ii =0;ii<orgLen;ii++){
                            Org org = (Org)orgList.get(ii);
                            //初始化没有创建文件夹的用户
                            initUserMessageFolder(org.getOrgId(),org.getOrgName());
                            MessageFolder mf2 = getUserAcceptMessageFolder(org.getOrgId(),messageSend.getSendOrgId());
                            if(mf2 == null){
                                continue;
                            }
                            MessageAccept subOrgMA = new MessageAccept();
                            subOrgMA.setAcceptTime(new Date());
                            subOrgMA.setFolderIds(mf2.getFolderId());
                            subOrgMA.setFolderType(mf2.getFolderType());
                            subOrgMA.setOwnerId(org.getOrgId());
                            subOrgMA.setOwnerName(org.getOrgName());
                            subOrgMA.setReadFlag(Constants.GLOBAL_NO);
                            subOrgMA.setSendId(messageSend.getId());
                            messageAcceptDao.addMessageAccept(subOrgMA);
                        }
                    }
                }
            }
        }
        
        //把消息放到已发送的信箱
        List forlderList = messageFolderDao.getMessageFolderByUserId(messageSend.getSendOrgId(),Constants.MESSAGE_FOLDER_TYPE_SEND,null);
        if(forlderList == null || forlderList.size() == 0){
            messageSendDao.deleteLogicMessageSend(messageSend.getId());
        }
        else{
            MessageFolder mf = (MessageFolder)forlderList.get(0);    
            messageSend.setFolderId(mf.getFolderId());
            messageSend.setFolderType(Constants.MESSAGE_FOLDER_TYPE_SEND);
            messageSendDao.updateMessageSend(messageSend);
        }
    }
    
    public MessageFolder getUserAcceptMessageFolder(String orgId,String sendUserId){
        MessageFolder mf = null;
        List forlderList = messageFolderDao.getMessageFolderByUserId(orgId, Constants.MESSAGE_FOLDER_TYPE_ACCEPT,sendUserId);
        if(forlderList != null && forlderList.size() > 0){
            mf = (MessageFolder)forlderList.get(0);    
        }
        else{
            forlderList = messageFolderDao.getMessageFolderByUserId(orgId, Constants.MESSAGE_FOLDER_TYPE_ACCEPT,null);
            if(forlderList != null && forlderList.size() > 0){
                mf = (MessageFolder)forlderList.get(0);    
            }
        }
        return mf;
    }
    @Override
    public MessageSendAndAccept viewMessageAccept(String id){
        MessageAccept ma = messageAcceptDao.getMessageAcceptById(id); 
        MessageSend ms = messageSendDao.getMessageSendById(ma.getSendId());
        //修改阅读标志
        if(!Constants.GLOBAL_YES.equals(ma.getReadFlag())){
            ma.setReadFlag(Constants.GLOBAL_YES);
            ma.setReadTime(new Date());
            messageAcceptDao.updateMessageAccept(ma);
        }
        return new MessageSendAndAccept(ms,ma);
    }
    @Override
    public void deleteMessageAccept(String acceptId,String folderId){
        messageAcceptDao.deleteMessageAccept(acceptId,folderId);
    }
    @Override
    public void updateMoveMessageAccept(String id,String folderId){
        MessageAccept ma = messageAcceptDao.getMessageAcceptById(id);
        ma.setFolderIds(folderId);
        MessageFolder mf = messageFolderDao.getMessageFolderById(folderId);
        ma.setFolderType(ma.getFolderType());
        
        messageAcceptDao.updateMessageAccept(ma);
    }
    @SuppressWarnings("unchecked")
    public List getAllMessageAccept(Page page,String folderId){
        List list = messageAcceptDao.getAllMessageAcceptByFolderId(page, folderId);
        List retList = new ArrayList();
        if(list!= null && list.size()>0){
            int len = list.size();
            for(int i=0;i<len;i++){
                MessageAccept ma = (MessageAccept)list.get(i);
                MessageSend ms = messageSendDao.getMessageSendById(ma.getSendId());
                
                retList.add(new MessageSendAndAccept(ms,ma));
            }
        }
        return retList;
    }
    @Override
    public List getAllMessageAcceptByUserId(Page page, String userId) {
        List list = messageAcceptDao.getAllMessageAcceptByUserId(page, userId);
        List retList = new ArrayList();
        if(list!= null && list.size()>0){
            int len = list.size();
            for(int i=0;i<len;i++){
                MessageAccept ma = (MessageAccept)list.get(i);
                MessageSend ms = messageSendDao.getMessageSendById(ma.getSendId());
                
                retList.add(new MessageSendAndAccept(ms,ma));
            }
        }
        return retList;
    }
    
    
    public MessageSend getMessageAcceptById(String id){
        return messageSendDao.getMessageSendById(id);
    }
    
    
    public MessageFolder getSysMessageFolder(String userId,String folderType){
        return messageFolderDao.getSysMessageFolder(userId, folderType);
    }

    
    public String addUrlLog(UrlLog urlLog) {
        // TODO Auto-generated method stub
        return urlLogDao.addUrlLog(urlLog);
    }

    public void setUrlLogDao(IUrlLogDao urlLogDao) {
        this.urlLogDao = urlLogDao;
    }

    
    public Object getObjectByClassAndIdValue(Class clazz, String idValue) {
        // TODO Auto-generated method stub
        return commonDao.getObjectByClassAndIdValue(clazz,idValue);
    }

    @Override
    public int getExistRecordNum(String className, String idProperty,
            String idPropertyValue, Map map) {
        // TODO Auto-generated method stub
        return commonDao.getExistRecordNum(className,idProperty,idPropertyValue,map);
    }

    @Override
    public int getExistForeignData(String className, Map map) {
        // TODO Auto-generated method stub
        return commonDao.getExistRecordNum(className,map);
    }

    public void setReportQueryParaDao(IReportQueryParaDao reportQueryParaDao) {
        this.reportQueryParaDao = reportQueryParaDao;
    }

	@Override
	public List getQueryParasByFunId(String funModuleId) {
		// TODO Auto-generated method stub
		return reportQueryParaDao.getQueryParasByFunId(funModuleId);
	}

	@Override
	public ReportQueryPara getReportQueryParaId(String reportQueryParaId) {
		// TODO Auto-generated method stub
		return reportQueryParaDao.getReportQueryParaId(reportQueryParaId);
	}

	@Override
	public String addReportQueryPara(ReportQueryPara reportQueryPara) {
		// TODO Auto-generated method stub
		return reportQueryParaDao.addReportQueryPara(reportQueryPara);
	}

	@Override
	public void deleteReportQueryParaByIds(String[] ids) {
		if (ids!=null && ids.length>0) {
			for(int i=0;i<ids.length;i++){
				reportQueryParaDao.deleteReportQueryParaById(ids[i]);
			}
		}
		
		
	}

	@Override
	public void updateReportQueryPara(ReportQueryPara reportQueryPara) {
		reportQueryParaDao.updateReportQueryPara(reportQueryPara);
		
	}

	public void setReportFileDao(IReportFileDao reportFileDao) {
		this.reportFileDao = reportFileDao;
	}

	@Override
	public String addReportFile(ReportFile reportFile) {
		// TODO Auto-generated method stub
		return reportFileDao.addReportFile(reportFile);
	}

	@Override
	public boolean deleteReportFileById(String id) {
		// TODO Auto-generated method stub
		return reportFileDao.deleteReportFileById(id);
	}

	@Override
	public List getQueryFilesByFunId(String funId) {
		// TODO Auto-generated method stub
		return reportFileDao.getQueryFilesByFunId(funId);
	}

	@Override
	public ReportFile getReportFileById(String id) {
		// TODO Auto-generated method stub
		return reportFileDao.getReportFileById(id);
	}

	@Override
	public void updateReportFile(ReportFile reportFile) {
		reportFileDao.updateReportFile(reportFile);
		
	}

    

    
}
