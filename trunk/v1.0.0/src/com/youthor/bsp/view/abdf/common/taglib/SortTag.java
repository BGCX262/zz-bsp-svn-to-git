/**
 * 
 */
package com.youthor.bsp.view.abdf.common.taglib;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.youthor.bsp.core.abdf.common.page.model.Page;





/**
 * @author lzr 排序Taglib
 */
public class SortTag extends TagSupport {
    
    private final static String SORT_SCRIPT_KEY = "sort_script_key";
    
    public final static String UP_STRING  = "ASC";
    
    public final static String DOWN_STRING = "DESC";
    
    /**
     * 列的标题
     */
    private String title;
    
    /**
     * 是排序要用到的Model中的属性（hibernate中的hql）
     */
    private String column;
    
    /**
     * 排序用到的图标
     */
    private String upImg;
    
    /**
     * 排序用到的图标
     */
    private String downImg;
    
    /**
     * 用到的css样式
     */
    private String tdClass;
    
    private String align = "left";
    
    private String width;
    
    private boolean nowrap= true;
    
    /**
     * 是否排序的属性
     */
    private boolean isSort = true;
    
    private String nowrapStr = "";

    /**
     * 
     */
    private static final long serialVersionUID = -5665879731808946745L;

    public int doEndTag() throws JspException {
        try{
            if(nowrap) nowrapStr="nowrap";
            HttpServletRequest request = getRequest();
            Page page = getCurrentPage();
            JspWriter out = pageContext.getOut();
            if(!existJsScript()) {
                out.println(createJsScript());
                request.setAttribute(SORT_SCRIPT_KEY, "success");
            }
            if(this.isSort){
                if(this.column.equals(page.getSortInfo().getColumn())){
                    out.println(createSortColumnHtml());
                }else{
                    out.println(createNotSortColumnHtml());
                }
            }else{
                out.println(createSampleColumnHtml());
            }
        }catch(Exception e){
            e.printStackTrace();
            return EVAL_PAGE;
        }
        return EVAL_PAGE;
    }
    
    private boolean existJsScript(){
        Object obj = getRequest().getAttribute(SORT_SCRIPT_KEY);
        if(obj==null) return false;
        return true;
    }
    
    private Page getCurrentPage(){
        HttpServletRequest request = getRequest();
        Page page = (Page) request.getAttribute(Page.PAGE_INFO);
        return page;
    }
    
    private HttpServletRequest getRequest(){
        return (HttpServletRequest) pageContext.getRequest();
    }
    
    /**
     * 创建jsScript脚本
     * */
    private String createJsScript(){
        StringBuffer jsScriptStr = new StringBuffer();
        jsScriptStr.append("<script>");
        jsScriptStr.append("function sort(columnName){");
        jsScriptStr.append("var form = \"\";");
        jsScriptStr.append("if(document.getElementById('page.formName')!=null){ ");
        jsScriptStr.append("formName = document.getElementById('page.formName').value; ");
        jsScriptStr.append("form = eval('document.'+formName); ");
        jsScriptStr.append("}else{ ");
        jsScriptStr.append("form = document.forms[0] ");
        jsScriptStr.append("}");
        jsScriptStr.append("var element1 = getElement( \"page.sortInfo.column\" ); ");
        jsScriptStr.append("var element2 = getElement( \"page.sortInfo.ascOrDesc\" ); ");
        jsScriptStr.append("if(element2.value==\"\"){");
        jsScriptStr.append("element2.value='ASC'");
        jsScriptStr.append("}else{");
        jsScriptStr.append("if(element2.value==\"DESC\"){");
        jsScriptStr.append("element2.value=\"ASC\";");
        jsScriptStr.append("}else{");
        jsScriptStr.append("element2.value=\"DESC\";");
        jsScriptStr.append("}");
        jsScriptStr.append("}");
        jsScriptStr.append("element1.value = columnName; ");
        jsScriptStr.append("form.submit(); ");
        jsScriptStr.append("}");
        jsScriptStr.append("</script>");
        return jsScriptStr.toString();
    }
    
    private String selectImage(){
        Page page = getCurrentPage();
        HttpServletRequest request = getRequest();
        if(page.getSortInfo().getAscOrDesc().equals(SortTag.DOWN_STRING)){
            return request.getContextPath()+"/"+this.downImg;
        }else{
            return request.getContextPath()+"/"+this.upImg;
        }
    }
    
    /**
     * 取得提示语
     * */
    private String getAlt(){
        Page page = getCurrentPage();
        if(page.getSortInfo().getAscOrDesc().equals(SortTag.DOWN_STRING)){
            return "降序";
        }else{
            return "升序";
        }
    }

    /**
     * 创建排序列
     * */
    private String createSortColumnHtml() {
        StringBuffer columnHtmlStr = new StringBuffer();
        columnHtmlStr.append("<td width=\""+this.width+"\" align=\""+this.align+"\" class=\""+this.tdClass+"\" nowrap=\""+this.nowrapStr+"\">");
        columnHtmlStr.append("<A  HREF=\"#\"  style=\"text-decoration:none;color:#000000\" onClick=\"sort('"+this.column+"');\" >");
        columnHtmlStr.append("");
        columnHtmlStr.append(this.title);
        columnHtmlStr.append("");
        columnHtmlStr.append("<img src=\""+selectImage()+"\" alt=\""+getAlt()+"\"  border=\"0\" align=\"absmiddle\">");
        columnHtmlStr.append("</A>");
        columnHtmlStr.append("</td>");
        return columnHtmlStr.toString();
    }
    
    /**
     * 创建不排序的列
     * */
    private String createNotSortColumnHtml(){
        StringBuffer columnNotSortHtmlStr = new StringBuffer();
        columnNotSortHtmlStr.append("<td width=\""+this.width+"\" align=\""+this.align+"\" class=\""+this.tdClass+"\" nowrap=\""+this.nowrapStr+"\">");
        columnNotSortHtmlStr.append("<A  HREF=\"#\"  style=\"text-decoration:none;color:#000000\" onClick=\"sort('"+this.column+"');\" >");
        columnNotSortHtmlStr.append(this.title);
        columnNotSortHtmlStr.append("</A></td>");
        return columnNotSortHtmlStr.toString();
    }
    
    /**
     * 创建普通的列
     * */
    private String createSampleColumnHtml(){
        StringBuffer columnSampleHtmlStr = new StringBuffer();
        columnSampleHtmlStr.append("<td width=\""+this.width+"\" align=\""+this.align+"\" class=\""+this.tdClass+"\" nowrap=\""+this.nowrapStr+"\">");
        columnSampleHtmlStr.append(this.title);
        columnSampleHtmlStr.append("</td>");
        return columnSampleHtmlStr.toString();
    }
    

    public void release() {
        super.release();
        this.column = null;
        this.downImg = null;
        this.upImg = null;
        this.tdClass = null;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public String getDownImg() {
        return downImg;
    }

    public void setDownImg(String downImg) {
        this.downImg = downImg;
    }

    public boolean isSort() {
        return isSort;
    }
    
    public void setIsSort(boolean isSort){
        this.isSort = isSort;
    }
    
    public boolean getIsSort(){
        return isSort;
    }

    public void setSort(boolean isSort) {
        this.isSort = isSort;
    }

    public String getUpImg() {
        return upImg;
    }

    public void setUpImg(String upImg) {
        this.upImg = upImg;
    }

    public String getTdClass() {
        return tdClass;
    }

    public void setTdClass(String tdClass) {
        this.tdClass = tdClass;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }

    public boolean isNowrap() {
        return nowrap;
    }

    public void setNowrap(boolean nowrap) {
        this.nowrap = nowrap;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }


}
