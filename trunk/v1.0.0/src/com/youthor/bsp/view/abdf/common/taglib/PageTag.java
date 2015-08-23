/**
 * 
 */
package com.youthor.bsp.view.abdf.common.taglib;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.page.model.Page;




/**
 * @author lzr
 * 分页处理Taglib
 */
public class PageTag extends BodyTagSupport{
    
    /**
     * 
     */
    private static final long serialVersionUID = -5295553650388157443L;
    
    /**
     * 指定分页的Form的ID
     */
    private String formId = null;
    
    /**
     * 如果需要保存参数则为true，默认为false
     */
    private boolean param = false;
    
    /**
     * 文本输入框样式
     * */
    private String inputclass = "editline";
    
    public int doEndTag() throws JspException{
        try{
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        Page page = (Page) request.getAttribute(Page.PAGE_INFO);
        if(page==null) return EVAL_PAGE;
        JspWriter out = pageContext.getOut();
        //out.println(createDefaultStyle());
        out.println(createJsScript());
        out.println(createHiddenPageParam(page));
        out.println(createPageUI(page));
        if(this.param){
            out.println(createParamObj(request));
        }
        out.flush();
        //out.close();
        return EVAL_PAGE;
        }catch(Exception e){
            e.printStackTrace();
            return EVAL_PAGE;
        }
        
    }
    
    public String createJsScript(){
        StringBuffer scriptFunctionStr = new StringBuffer();
        scriptFunctionStr.append("<script>");
        //取得页面元素
        if(formId==null){
            scriptFunctionStr.append("var pageForm = document.forms[0];");
        }else{
            scriptFunctionStr.append("var pageForm = document.getElementById('").append(formId).append("');");
        }
        scriptFunctionStr.append("function getElement( strName )");
        scriptFunctionStr.append("{");
        scriptFunctionStr.append("var element = null;");
        scriptFunctionStr.append("var length=pageForm.elements.length;");
        scriptFunctionStr.append("for (var i=0;i<length;i++)");
        scriptFunctionStr.append("{");
        scriptFunctionStr.append("element = pageForm.elements[i];");
        scriptFunctionStr.append("if ( element.name== strName)");
        scriptFunctionStr.append("{");
        scriptFunctionStr.append("break;");
        scriptFunctionStr.append("}");
        scriptFunctionStr.append("}");
        scriptFunctionStr.append("return element;");
        scriptFunctionStr.append("} ");
        //点击链接的处理
        scriptFunctionStr.append("function show(page) ");
        scriptFunctionStr.append("{ ");
        scriptFunctionStr.append("var form = pageForm; ");
        scriptFunctionStr.append("var element1 = getElement( \"page.currentPage\" ); ");
        scriptFunctionStr.append("element1.value = page; ");
        scriptFunctionStr.append("form.submit(); ");
        scriptFunctionStr.append("} ");
        //检查是否为整型
        scriptFunctionStr.append("function checkInteger(strVal) {");
        scriptFunctionStr.append("strVal = TrimString (strVal);");
        scriptFunctionStr.append("if (strVal.length == \"\")return (false);");
        scriptFunctionStr.append("reVal = /^[\\-\\+]?([1-9]\\d*|0|[1-9]\\d{0,2}(,\\d{3})*)$/;");
        scriptFunctionStr.append("return (reVal.test (strVal));");
        scriptFunctionStr.append("} ");
        
        //去空格处理
        scriptFunctionStr.append("function TrimString(data)");
        scriptFunctionStr.append("{");
        scriptFunctionStr.append("var reg = /^\\s*|\\s*$/g;");
        scriptFunctionStr.append("return data.replace(reg,\"\");");
        scriptFunctionStr.append("}");
        
        //跳转执行处理
        scriptFunctionStr.append("function go() ");
        scriptFunctionStr.append("{");
        scriptFunctionStr.append("var form = pageForm; ");
        scriptFunctionStr.append("var element0 = getElement( \"page.inputpage\" ); ");
        scriptFunctionStr.append("var element2 = getElement( \"page.totalPage\" ); ");
        scriptFunctionStr.append("var element3 = getElement( \"page.currentPage\" ); ");
        scriptFunctionStr.append("if(!checkInteger(element0.value)){");
        scriptFunctionStr.append("alert(\"请输入整数\"); ");
        scriptFunctionStr.append("return; ");
        scriptFunctionStr.append("}");
        scriptFunctionStr.append("if(parseInt(element0.value)>=1&&parseInt(element0.value)<=parseInt(TrimString(element2.value))){");
        scriptFunctionStr.append("element3.value = element0.value; ");
        scriptFunctionStr.append("form.submit();");
        scriptFunctionStr.append("return; ");
        scriptFunctionStr.append("}");
        scriptFunctionStr.append("alert(\"请输入合法的页数范围\");");
        scriptFunctionStr.append("} ");
        
        //确定每页显示记录数
        scriptFunctionStr.append("function go2() ");
        scriptFunctionStr.append("{ ");
        scriptFunctionStr.append("var form = pageForm; ");
        scriptFunctionStr.append("var element1 = getElement( \"page.inputPageSize\" ); ");
        scriptFunctionStr.append("var element2 = getElement( \"page.totalPage\" ); ");
        scriptFunctionStr.append("var element3 = getElement( \"page.currentPage\" ); ");
        scriptFunctionStr.append("if(!checkInteger(element1.value)){");
        scriptFunctionStr.append("alert(\"请输入整数\"); ");
        scriptFunctionStr.append("return; ");
        scriptFunctionStr.append("}");
        scriptFunctionStr.append("getElement( \"page.pageSize\" ).value=element1.value;");
        scriptFunctionStr.append("element3.value= 1;");
        //scriptFunctionStr.append("if(element1.value>=1&&element1.value<=TrimString(element2.value)){");
        //scriptFunctionStr.append("element3.value = element1.value; ");
        scriptFunctionStr.append("form.submit(); ");
        scriptFunctionStr.append("return; ");
        //scriptFunctionStr.append("}");
        //scriptFunctionStr.append("alert(\"请输入合法的页数范围\");");
        scriptFunctionStr.append("} ");
        scriptFunctionStr.append("</script>");
        return scriptFunctionStr.toString();
    }
    
    /**
     * 创建隐藏域属性
     * */
    public String createHiddenPageParam(Page page){
        StringBuffer hiddenParamHtml = new StringBuffer();
        if(this.formId!=null&&!formId.equals("")){
            hiddenParamHtml.append("<input type='hidden' id='page.formName' name='page.formName' value='"+this.formId + "'>");
        }
        hiddenParamHtml.append("<input type='hidden' name='page.pageSize' value='"+page.getPageSize() + "'>");
        hiddenParamHtml.append("<input type='hidden' name='page.currentPage' value='"+page.getCurrentPage() + "'>");
        hiddenParamHtml.append("<input type='hidden' name='page.totalPage' value='"+page.getTotalPage() + "'>");
        hiddenParamHtml.append("<input type='hidden' name='page.totalNumber' value='"+page.getTotalNumber() + "'>");
        hiddenParamHtml.append("<input type='hidden' name='page.sortInfo.column' value='"+page.getSortInfo().getColumn() + "'>");
        hiddenParamHtml.append("<input type='hidden' name='page.sortInfo.ascOrDesc' value='"+page.getSortInfo().getAscOrDesc() + "'>");
        return hiddenParamHtml.toString();
    }
    
    
    
    private String createParamObj(HttpServletRequest request){
        StringBuffer stringBuffer = new StringBuffer();
        Enumeration enumeration = request.getParameterNames();
        while(enumeration.hasMoreElements()){
            String name = (String) enumeration.nextElement();
            String value = request.getParameter(name);
            stringBuffer.append("<input type='hidden' name='"+name+"' value='"+value+"'>");
            }
        return stringBuffer.toString();
    }
    
    /**
     * 创建分页条
     * */
    public String createPageUI(Page page){
        StringBuffer pageStr = new StringBuffer();
        pageStr.append("<p align=\"right\" >共"+page.getTotalNumber()+"条记录,共"+page.getTotalPage()+"页,");
        pageStr.append("当前为第"+page.getCurrentPage()+"页");
        if(!page.isHasPrevious()){
        pageStr.append("   <input type='button'   value='首页'  disabled='true' class='Button3'>");
        pageStr.append("   <input type='button'   value='上页'  disabled='true' class='Button3'>");
        }else{
        pageStr.append("   <input type='button'   value='首页'  onclick='javascript:show(1)' class='Button3'>");
        pageStr.append("   <input type='button'   value='上页'  onclick='javascript:show("+(page.getCurrentPage()-1)+")' class='Button3'>");
        }
        if(!page.isHasNext()){
        pageStr.append(" <input type='button'   value='下页'  disabled='true' class='Button3'>");
        pageStr.append(" <input type='button'   value='尾页'  disabled='true' class='Button3'>");
        }else{
        pageStr.append("   <input type='button'   value='下页'  onclick='javascript:show("+(page.getCurrentPage()+1)+")' class='Button3'>");
        pageStr.append("   <input type='button'   value='尾页'  onclick='javascript:show("+(page.getTotalPage())+")' class='Button3'>");    
        }
        String disabled1="";
        String readOnly1="";
        String readOnly2="";
        String disabled2="";
        if(page.getTotalNumber()<=1)
        {
             disabled1=" disabled='true'";
             readOnly1=" readOnly='true'";
             readOnly2=" readOnly='true'";
             disabled2=" disabled='true'";
        }
        
        if(page.getTotalPage()==1)
        {
             readOnly2=" readOnly='true'";
             disabled2=" disabled='true'";
             
        }
        pageStr.append("  页码：<input type=\"text\" name=\"page.inputpage\" size=\"3\" maxlength=\"5\" class=\""+this.inputclass+"\" value=\"\" "+readOnly2+">");
        pageStr.append("   <input type='button'   value='跳转'  onclick='javascript:go()' class='Button3' "+disabled2+">");
        //pageStr.append("</p>");
        
        pageStr.append("  每页：<input type=\"text\" "+readOnly1+" name=\"page.inputPageSize\" size=\"3\" maxlength=\"5\" class=\""+this.inputclass+"\" value=\""+page.getPageSize()+"\" >条记录");
        pageStr.append("    <input type='button'   value='确定'  onclick='javascript:go2()' class='Button3' "+disabled1+">");
        pageStr.append("&nbsp;&nbsp;</p>");
        return pageStr.toString();
    }
    
    public void release(){
        super.release();
        this.inputclass = null;
    }

    public String getInputclass() {
        return inputclass;
    }

    public void setInputclass(String inputclass) {
        this.inputclass = inputclass;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public boolean isParam() {
        return param;
    }

    public void setParam(boolean param) {
        this.param = param;
    }

}
