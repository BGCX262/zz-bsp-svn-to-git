package com.youthor.bsp.core.abdf.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.CodeBuilderHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.dao.IDataBaseDao;
import com.youthor.bsp.core.abdf.model.codebuilder.Field;


public class DataBaseDaoImpl extends BaseDAOHibernate implements  IDataBaseDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return null;
    }

    public List getDataTable() {
        Session session=super.getSession();
        Connection conn=session.connection();
        Statement st=null;
        ResultSet rs=null;
        List returnList=new ArrayList();
        try
        {
            st=conn.createStatement();
            rs=st.executeQuery("select * from user_tables");
            while(rs.next())
            {
                String tableName=rs.getString("table_name");
                returnList.add(tableName);
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(st!=null)
                    st.close();
            }catch(Exception ex)
            {
                ex.printStackTrace();
            }
        }
            
        return returnList;
    }

    public List getDataTableField(String tableName) {
        Session session=super.getSession();
        Connection conn=session.connection();
        Statement st=null;
        ResultSet rs=null;
        List returnList=new ArrayList();
        try
        {
            st=conn.createStatement();
            rs=st.executeQuery("select * from "+tableName);
            ResultSetMetaData rmd= rs.getMetaData();
            int columnNum=rmd.getColumnCount();
            for(int i=1;i<=columnNum;i++)
            {
                String columnName=rmd.getColumnName(i);
                String columnDataType=rmd.getColumnTypeName(i);
                Field field=new Field();
                field.setFiledName(columnName);
                field.setDataType(columnDataType);
                field.setPropertyName(CodeBuilderHelper.formatToModleProperty(columnName));
                field.setPropertyDataType(CodeBuilderHelper.changeDataTypeToJava(columnDataType));
                returnList.add(field);
                
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(st!=null)
                    st.close();
            }catch(Exception ex)
            {
                ex.printStackTrace();
            }
        }
            
        return returnList;
    }
}
