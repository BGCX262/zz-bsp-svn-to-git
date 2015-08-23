package com.youthor.bsp.core.abdf.common.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.Number;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 
 * @author jason
 *
 * 格式，column的属性请参见ExcelColumnModel类。
 * <beanToExcel>
 *     <sheet id="test1" name="测试1">
 *         <column title="title1" valueRef="person.name" .../>
 *     </sheet>
 *  <sheet id="test2" name="测试2">
 *         <column title="title1" valueRef="person.name" .../>
 *     </sheet>
 * </beanToExcel>
 */
public class BeanToExcelHelper {

    private static BeanToExcelHelper instance;
    private static Map domMap = new Hashtable();
    
    private BeanToExcelHelper(){
        
    }
    
    public static synchronized BeanToExcelHelper getInstance(){
        if(instance == null){
            instance = new BeanToExcelHelper();
        }
        return instance;
    }
    
    
    public void createExcelFile(String configId,String excelFilePath,Object param) throws Exception{
        
        if(!StringHelper.isHasContent(configId)){
            throw new Exception("the config id can not be empty");
        }
        
        ExcelConfigModel model = null;
        if(domMap.get(configId) != null){
            model  = (ExcelConfigModel)domMap.get(configId);
        }
        else{
            //从XML文件里初始化model
            model = parseXmlForConfig(configId,"c:/temp/excel.xml");
            if(model == null){
                throw new Exception("can not get config info");
            }
            domMap.put(configId, model);            
        }
        
        beginCreateExcelFile(model,excelFilePath,param);
    }
    
    protected ExcelConfigModel parseXmlForConfig(String configId,String xmlFilePath){
        try{
            ExcelConfigModel model = null;
            File file = new File(xmlFilePath);
            SAXReader reader = new SAXReader(false);
            Document doc = reader.read(file);
            
            Element root = doc.getRootElement();
            Iterator i = root.elementIterator("sheet");
            while(i.hasNext()){
                Element sheet = (Element)i.next();
                
                String sheetId = sheet.attributeValue(ExcelSheetModel.EXCELSHEETMODEL_ID);
                if(configId.equalsIgnoreCase(sheetId)){
                    model = new ExcelConfigModel(configId);
                    
                    ExcelSheetModel sheetModel = new ExcelSheetModel();
                    sheetModel.setId(sheetId);
                    sheetModel.setName(sheet.attributeValue(ExcelSheetModel.EXCELSHEETMODEL_NAME));
                    model.setSheetModel(sheetModel);
                    
                    //处理子节点
                    Iterator ii = sheet.elementIterator("column");
                    while(ii.hasNext()){
                        Element column = (Element)ii.next();
                        
                        ExcelColumnModel columnModel = new ExcelColumnModel();
                        columnModel.setDefaultValue(column.attributeValue(ExcelColumnModel.EXCELCOLUMNMODEL_DEFAULTVALUE));
                        int sortOrder = -1;
                        try{
                            sortOrder = Integer.parseInt(column.attributeValue(ExcelColumnModel.EXCELCOLUMNMODEL_SORTORDER));
                        }
                        catch(Exception e){
                            sortOrder = -1;
                        }
                        columnModel.setSortOrder(sortOrder);
                        columnModel.setTitle(column.attributeValue(ExcelColumnModel.EXCELCOLUMNMODEL_TITLE));
                        columnModel.setValueRef(column.attributeValue(ExcelColumnModel.EXCELCOLUMNMODEL_VALUEREF));
                        boolean isNumberFlag = false;
                        try{
                            isNumberFlag = Boolean.parseBoolean(column.attributeValue(ExcelColumnModel.EXCELCOLUMNMODEL_ISNUMBER));
                        }
                        catch(Exception e){
                            isNumberFlag = false;
                        }
                        columnModel.setNumberFlag(isNumberFlag);
                        
                        model.addAColumn(columnModel,sortOrder);
                    }
                    break;
                }
            }
            return model;
        }
        catch(Exception e){
            e.printStackTrace();
            
            return null;
        }
    }
    
    
    protected void beginCreateExcelFile(ExcelConfigModel model,String excelFilePath,Object param) throws Exception{
        if(model == null || (!StringHelper.isHasContent(excelFilePath))){
            throw new Exception("the excel file path can not be empty");
        }
        
        OutputStream os = null;
        WritableWorkbook wwb = null;
        WritableSheet ws = null;
        
        try{
            os = new FileOutputStream(excelFilePath);
            wwb = Workbook.createWorkbook(os);
            
            ws = wwb.createSheet(model.getSheetModel().getName(), 0);
            List columnList = model.getColumnList();
            int size = columnList.size();
            for(int i = 0; i < size; i++){
                ExcelColumnModel columnModel = (ExcelColumnModel)columnList.get(i);
                Label label = new Label(i,0,columnModel.getTitle());
                ws.addCell(label);
            }
            
            if(param != null){
                if(param instanceof List){
                    List tempParam = (List)param;
                    int size2 = tempParam.size();
                    for(int ii = 0; ii < size2;ii++){
                        Object object = tempParam.get(ii);
                        wrapExcelColumn(columnList,object,ii + 1,ws);
                    }
                }
                else{
                    wrapExcelColumn(columnList,param,1,ws);
                }
            }
            wwb.write();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            try{
                if(wwb != null){
                    wwb.close();
                }
                if(os != null){
                    os.close();
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    
    private void wrapExcelColumn(List columnList,Object param,int row,WritableSheet ws) throws RowsExceededException, WriteException{
        int size = columnList.size();
        for(int i = 0; i<size;i++){
            ExcelColumnModel columnModel = (ExcelColumnModel)columnList.get(i);
            Object value = null;
            try{
                value = ObjectHelper.getMethodValueForRecursion(columnModel.getValueRef(), param);
            }
            catch(Exception e){
                value = columnModel.getDefaultValue();
            }
            if(columnModel.isNumberFlag()){
                double dValue =0.0;
                try{
                    if(value != null){
                        dValue = Double.parseDouble(String.valueOf(value));
                    }                                        
                }
                catch(Exception e){
                    dValue =0.0;
                }
                ws.addCell(new Number(i,row,dValue));
            }
            else{
                if(value == null){
                    value = "";
                }
                ws.addCell(new Label(i,row,String.valueOf(value)));
            }
        }
    }
    
    private class ExcelConfigModel{
        private String sheetId;
        private ExcelSheetModel sheetModel;
        private List columnList;
        
        public ExcelConfigModel(String sheetId){
            this.sheetId = sheetId;
            columnList = new LinkedList();
        }
        
        public void addAColumn(ExcelColumnModel column,int index){
            if(index < 0){
                columnList.add(column);
            }
            else{
                columnList.add(index, column);
            }
        }

        public String getSheetId() {
            return sheetId;
        }

        public ExcelSheetModel getSheetModel() {
            return sheetModel;
        }

        public void setSheetModel(ExcelSheetModel sheetModel) {
            this.sheetModel = sheetModel;
        }

        public List getColumnList() {
            return columnList;
        }    
    }
    
    private class ExcelSheetModel{
        public static final String EXCELSHEETMODEL_ID    ="id";
        public static final String EXCELSHEETMODEL_NAME    ="name";
        private String id;
        private String name;
        
        public String getId() {
            return id;
        }
        
        public void setId(String id) {
            this.id = id;
        }
        
        public String getName() {
            return name;
        }
        
        public void setName(String name) {
            this.name = name;
        }
    }
    
    private class ExcelColumnModel{
        public static final String EXCELCOLUMNMODEL_TITLE            ="title";
        public static final String EXCELCOLUMNMODEL_VALUEREF        ="valueRef";
        public static final String EXCELCOLUMNMODEL_DEFAULTVALUE    ="defaultValue";
        public static final String EXCELCOLUMNMODEL_SORTORDER        ="sortOrder";
        public static final String EXCELCOLUMNMODEL_ISNUMBER        ="numberFlag";
        
        private String title;
        private String valueRef;
        private String defaultValue;
        private int sortOrder;
        private boolean numberFlag;
        
        public String getTitle() {
            return title;
        }
        
        public void setTitle(String title) {
            this.title = title;
        }
        
        public String getValueRef() {
            return valueRef;
        }
        
        public void setValueRef(String valueRef) {
            this.valueRef = valueRef;
        }
        
        public String getDefaultValue() {
            return defaultValue;
        }

        public void setDefaultValue(String defaultValue) {
            this.defaultValue = defaultValue;
        }

        public int getSortOrder() {
            return sortOrder;
        }
        
        public void setSortOrder(int sortOrder) {
            this.sortOrder = sortOrder;
        }

        public boolean isNumberFlag() {
            return numberFlag;
        }

        public void setNumberFlag(boolean numberFlag) {
            this.numberFlag = numberFlag;
        }
    }
}
