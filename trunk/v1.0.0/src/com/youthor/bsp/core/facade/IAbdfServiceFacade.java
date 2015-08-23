package com.youthor.bsp.core.facade;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.Attachment;
import com.youthor.bsp.core.abdf.model.Dict;
import com.youthor.bsp.core.abdf.model.DictTree;
import com.youthor.bsp.core.abdf.model.DictTreeType;
import com.youthor.bsp.core.abdf.model.DictType;
import com.youthor.bsp.core.abdf.model.Favorite;
import com.youthor.bsp.core.abdf.model.FavoriteItem;
import com.youthor.bsp.core.abdf.model.Information;
import com.youthor.bsp.core.abdf.model.MessageFolder;
import com.youthor.bsp.core.abdf.model.MessageSend;
import com.youthor.bsp.core.abdf.model.OnLineHelper;
import com.youthor.bsp.core.abdf.model.ReportFile;
import com.youthor.bsp.core.abdf.model.ReportQueryPara;
import com.youthor.bsp.core.abdf.model.Subassembly;
import com.youthor.bsp.core.abdf.model.SystemConf;
import com.youthor.bsp.core.abdf.model.UrlLog;
import com.youthor.bsp.core.abdf.model.wrapper.MessageSendAndAccept;

public interface IAbdfServiceFacade {
    /**
     * 根据字典类型id,得到字典类型对象
     * 
     * @param dictTypeId
     * @return
     */
    DictType getDictTypeById(String dictTypeId);

    /**
     * 得到所有的字典类型对象
     * 
     * @return
     */
    List getAllDictType();

    /**
     * 新增字典对象
     * 
     * @param dictType
     * @return
     */
    boolean addDictType(DictType dictType);

    /**
     * 修改字典对象
     * 
     * @param dictType
     * @return
     */
    boolean updateDictType(DictType dictType);

    /**
     * 根据类型的id删改字典类型对象
     * 
     * @param dictTypeId
     * @return
     */
    boolean deleteDictTypeById(String dictTypeId);

    /**
     * 得到本页的页面条数
     * 
     * @return
     */
    List getPageDictType();

    /**
     * 根据模块名得到模块下所有的字典类型
     */

    List getDictTypeByModuleName(String moduleName);

    boolean deleteDictTypeByIds(String[] ids);

    /**
     * 根据公司id和数据字典编号得到分页的字典对象
     * 
     * @param page
     * @param gsId
     * @param dictTypeCode
     * @return
     */
    DictType getDictTyeByComIdCode(String gsId, String dictTypeCode);

    /**
     * 根据字典类型id和到字典分页对象
     * 
     * @param dictTypeId
     * @return
     */
    List listDictByDictTypeId(Page page, String dictTypeId);

    /**
     * 得到数据库中的所有表
     * 
     * @return
     */
    public List getDataTable();

    List getDataTableField(String tableName);

    List getAllSubassembly();

    Subassembly getSubassemblyById(String subassemblyId);

    String addSubassembly(Subassembly subassembly);

    void updateSubassembly(Subassembly subassembly);

    /**
     * 
     * @param treeType
     * @return
     */
    DictTree getDictTreeRoot(String treeType);

    List getTopDictTreeByType(String treeType);

    DictTree getDictTreeById(String parentId);

    List getAllDictTreeByType(String type);

    boolean deleteDictTreeByIds(String[] dictTreeIds);

    List getSubDictTreeByParentId(String treeId);

    List getAllSubDictTreeByParentId(String treeId);

    void updateMoveDictTree(DictTree source);

    String addDictTree(DictTree dictTree);

    void updateDictTree(DictTree dictTree);

    /**
     * 得到所有的树型字典列表
     */
    List getAlltDictTypeTree();

    /**
     * 增加树型数据字典类型
     * 
     * @param dictTreeType
     * @return
     */
    String addDictTreeType(DictTreeType dictTreeType);

    /**
     * 新增树型数据字典类型
     * 
     * @param dictTreeType
     * @return
     */
    String updateDictTreeType(DictTreeType dictTreeType);

    /**
     * 根据数据库id得到数据字典类型
     * 
     * @param dictTreeType
     * @return
     */
    DictTreeType getDictTreeTypeById(String treeTypeId);

    /**
     * 要据父id得到布局对象
     * 
     * @param treeTypeId
     * @return
     */
    List getFormLayoutListByParentId(String parentId);

    /**
     * 根据树型数据字典编号得到树型数据字典对象
     * 
     * @param treeType
     * @return
     */
    DictTreeType getDictTreeTypeByCode(String treeType);

    /**
     * 根据树型字典得到顶层数据
     * 
     * @param page
     * @param dictTreeType
     * @return
     */
    List listTopNodeObjectByType(Page page, DictTreeType dictTreeType);

    /**
     * 根据树型数据字典得到所有节点
     * 
     * @param dictTreeType
     * @return
     */
    List getAllNodeDataByDictTreeType(DictTreeType dictTreeType);

    /**
     * 新增字典
     * 
     * @param dict
     * @return
     */
    String addDict(Dict dict);

    /**
     * 更新字典
     * 
     * @param dict
     * @return
     */
    String updateDict(Dict dict);

    /**
     * 根据字典id得到字典对象
     * 
     * @param dictId
     * @return
     */
    Dict getDictById(String dictId);

    /**
     * 根据字典类型id得到所有字典对象
     * 
     * @param dictTypeId
     * @return
     */
    List getDictByDictTypeId(String dictTypeId);

    /**
     * 增加附件
     * 
     * @param attachment
     */
    String addAttachInfo(Attachment attachment);

    /**
     * 得到顶层帮助文件
     * 
     * @return
     */
    List getTopOnLineHelper();

    /**
     * 根据id得到帮助对象
     * 
     * @param id
     * @return
     */
    OnLineHelper getOnLineHelperById(String id);

    /**
     * 删除帮助对象
     * 
     * @param onLineHelperIds
     * @return
     */
    boolean deleteOnLineHelperByIds(String[] onLineHelperIds);

    /**
     * 到得下一级帮助对象
     * 
     * @param onLineHelperId
     * @return
     */
    List getSubOnLineHelperByParentId(String onLineHelperId);

    /**
     * 根据应用id得到附件信息
     * 
     * @param onLineHelperId
     * @return
     */
    List getAttachInfoListByAppId(String onLineHelperId);

    /**
     * 
     * @param id
     * @return
     */
    Attachment getAttachInfoById(String id);

    /**
     * 删除附件信息
     * 
     * @param attachInfoById
     * @return
     */
    boolean deleteAttachInfo(Attachment attachment);

    /**
     * 得到帮助下的所有子
     * 
     * @param onLineHelperId
     * @return
     */
    List getAllSubOnLineHelperByParentId(String onLineHelperId);

    /**
     * 移到树
     * 
     * @param source
     */
    void updateMoveOnLineHelper(OnLineHelper source);

    /**
     * 增加帮助对象
     * 
     * @param onLineHelper
     * @return
     */
    String addOnLineHelper(OnLineHelper onLineHelper);

    /**
     * 修改对象
     * 
     * @param onLineHelper
     * @return
     */
    String updateOnLineHelper(OnLineHelper onLineHelper);

    /**
     * 得到所有帮助文件
     * 
     * @return
     */
    List getAllOnLineHelper();

    String addTreeObject(Object modelObject);

    String updateTreeObject(Object modelObject);

    Object getTreeNodeById(String modelClass, String id);

    List getSubTreeNodesByParentId(String modelClass, String id);

    void updateMoveTreeNodeObject(String modelClass, Object source);

    void deleteTreeNodeObject(DictTreeType dictTreeType, String id);

    List getAttachInfoListByProcessInstanceId(String processInstanceId);

    
    public List getAllSystemConf();
    public SystemConf getSystemConfById(String id);
    public String updateSystemConf(SystemConf model);

    OnLineHelper getOnLineHelperByCode(String onLineHelperCode);
    
    public String addInformation(Information information);
    public String updateInformation(Information information);
    public List getValidateInformations(Date date);
    public List getValidateInformationsByType(String type,Date date);
    public Information getInformationById(String informationId);
    public void deleteInformation(Information information);
    public List getAllInformations(Page page,Information model);
    public boolean deleteInformationByIds(String[] inforIds);

    List getFavoriteByOrgId(String orgId);

    String addFavorite(Favorite favorite);

    String addFavoriteItem(FavoriteItem favoriteItem);

    List getFavoriteItemByOrgId(String orgId);
    
    
    //消息处理
    public void initUserMessageFolder(String userId,String userName);
    public String addUserMessageFolder(MessageFolder folder);
    public String updateMessageFolder(MessageFolder folder);
    public void deleteUserMessageFolder(String folderId);
    public List getUserAllMessageFolder(String userId);
    public MessageFolder getUserMessageFolderById(String folderId);
    public MessageFolder getSysMessageFolder(String userId,String folderType);
    
    public String addMessageSend(MessageSend messageSend);
    public String udpateMessageSend(MessageSend messageSend);
    public void deleteMessageSend(String id);
    public List getMessageSendByFolderId(Page page,String folderId);
    public void addSendMessageSend(String messageId);
    public MessageSend getMessageAcceptById(String id);
    
    public MessageSendAndAccept viewMessageAccept(String id);
    public void deleteMessageAccept(String acceptId,String folderId);
    public void updateMoveMessageAccept(String id,String folderId);
    public List getAllMessageAccept(Page page,String folderId);
    public List getAllMessageAcceptByUserId(Page page, String userId);

    String addUrlLog(UrlLog urlLog);

	Object getObjectByClassAndIdValue(Class clazz, String idValue);

	int getExistRecordNum(String className, String idProperty,
			String idPropertyValue, Map map);

	int getExistForeignData(String className, Map map);

	List getQueryParasByFunId(String funModuleId);

	ReportQueryPara getReportQueryParaId(String reportQueryParaId);

	void updateReportQueryPara(ReportQueryPara reportQueryPara);

	String addReportQueryPara(ReportQueryPara reportQueryPara);

	void deleteReportQueryParaByIds(String[] ids);

	List getQueryFilesByFunId(String funId);

	ReportFile getReportFileById(String reportFileId);

	void updateReportFile(ReportFile reportFile);

	String addReportFile(ReportFile reportFile);

	boolean deleteReportFileById(String string);

	

    
}
