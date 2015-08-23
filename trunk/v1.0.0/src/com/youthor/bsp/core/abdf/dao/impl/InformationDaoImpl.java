package com.youthor.bsp.core.abdf.dao.impl;

import java.util.Date;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.DateHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.IInformationDao;
import com.youthor.bsp.core.abdf.model.Information;

public class InformationDaoImpl extends BaseDAOHibernate implements    IInformationDao {

    @Override
    protected Class getModelClass() {
        return Information.class;
    }

    @Override
    public String addInformation(Information information) {
        super.doCreateObject(information);
        return information.getInfoId();
    }
    
    @Override
    public String updateInformation(Information information){
        super.doUpdateObject(information);
        return information.getInfoId();
    }
    
    @Override
    public void deleteInformation(Information information) {
        super.doDeleteObject(information);

    }

    @Override
    public Information getInformationById(String informationId) {
        return (Information)super.doFindObjectById(informationId);
    }
    
    @Override
    public List getValidateInformations(Date date) {
        Date curDate = date;
        if(date == null){
            curDate = new Date(System.currentTimeMillis());
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where a.infoStatus='Y' ");
        //sb.append("and a.abledDate<= to_date('" + DateHelper.converDateToShortStr(curDate) + "','yyyy-MM-dd') ");
        //sb.append("and a.disabledDate >= to_date('" + DateHelper.converDateToShortStr(curDate) + "','yyyy-MM-dd') ");
        sb.append(" order by a.infoId desc");

        return doFind(sb.toString());
    }

    @Override
    public List getValidateInformationsByType(String type,Date date) {
        Date curDate = date;
        if(date == null){
            curDate = new Date(System.currentTimeMillis());
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where a.infoStatus='Y' ");
        sb.append(" and a.infoType = '" + type + "' ");
        //sb.append("and a.abledDate <= to_date(" + DateHelper.converDateToShortStr(curDate) + ",'yyyy-MM-dd')");
        //sb.append("and a.disabledDate >= to_date(" + DateHelper.converDateToShortStr(curDate) + ",'yyyy-MM-dd')");
        sb.append(" order by a.infoId desc");

        return doFind(sb.toString());
    }
    @Override
    public List getAllInformations(Page page,Information model){
        
        StringBuilder sb = new StringBuilder();
        sb.append("from "+this.getModelClass().getName()+" as a where 1=1 ");
        /**
        if(StringHelper.isHasContent(model.getCreateOrgId())){
            sb.append(" and a.createOrgId ='" + model.getCreateOrgId() + "' ");
        }
        if(model.getAbledDate() != null){
            sb.append("and to_date(a.abledDate,'yyy-MM-dd') >= to_date(" + DateHelper.converDateToShortStr(model.getAbledDate()) + ",'yyyy-MM-dd')");
        }
        if(model.getAbledDate1() != null){
            sb.append("and to_date(a.abledDate,'yyy-MM-dd') <= to_date(" + DateHelper.converDateToShortStr(model.getAbledDate1()) + ",'yyyy-MM-dd')");
        }
        if(StringHelper.isHasContent(model.getCreateOrgName())){
            sb.append(" and a.createOrgName ='" + model.getCreateOrgName() + "' ");
        }
        if(model.getCreateTime() != null){
            sb.append("and to_date(a.createTime,'yyy-MM-dd') >= to_date(" + DateHelper.converDateToShortStr(model.getCreateTime()) + ",'yyyy-MM-dd')");
        }
        if(model.getCreateTime1() != null){
            sb.append("and to_date(a.createTime,'yyy-MM-dd') <= to_date(" + DateHelper.converDateToShortStr(model.getCreateTime1()) + ",'yyyy-MM-dd')");
        }
        if(model.getDisabledDate() != null){
            sb.append("and to_date(a.disabledDate,'yyy-MM-dd') >= to_date(" + DateHelper.converDateToShortStr(model.getDisabledDate()) + ",'yyyy-MM-dd')");
        }
        if(model.getDisabledDate1() != null){
            sb.append("and to_date(a.disabledDate,'yyy-MM-dd') <= to_date(" + DateHelper.converDateToShortStr(model.getDisabledDate1()) + ",'yyyy-MM-dd')");
        }
        if(StringHelper.isHasContent(model.getInfoId())){
            sb.append(" and a.infoId ='" + model.getInfoId() + "' ");
        }
        if(StringHelper.isHasContent(model.getInfoStatus())){
            sb.append(" and a.infoStatus ='" + model.getInfoStatus() + "' ");
        }
        if(StringHelper.isHasContent(model.getInfoTitle())){
            sb.append(" and a.infoTitle  like '%" + model.getInfoTitle() + "%' ");
        }
        if(StringHelper.isHasContent(model.getInfoType())){
            sb.append(" and a.infoType ='" + model.getInfoType() + "' ");
        }
        if(StringHelper.isHasContent(model.getUrl())){
            sb.append(" and a.url  like '%" + model.getUrl() + "%' ");
        }
        sb.append(" order by a.infoId desc");
        **/
        return PageHelper.executeQuery(page, getSession(), sb.toString()).list();        
    }
}