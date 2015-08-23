<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IAbdfServiceFacade"%>
<%@page import="com.youthor.bsp.core.abdf.model.DictType"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>
<%!
  private void buildDictTypeTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
         IAbdfServiceFacade abdfServiceFacade =(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
         List allDictType=abdfServiceFacade.getAllDictType();
         //根据模块名来行分类
         out.println("var t0 = new WebFXTree('字典类型','javascript:doNothing()')");
         if(allDictType==null||allDictType.size()==0) return;
         Map map=new HashMap();
         for(int i=0;i<allDictType.size();i++)
         {
           DictType dictType=(DictType)allDictType.get(i);
           if(i==0)
           {
             List dictTypeClass=new ArrayList();
             dictTypeClass.add(dictType);
             map.put(dictType.getModuleName().trim(),dictTypeClass);
           }
           else
           {
              List dictTypeClass=(List)map.get(dictType.getModuleName().trim());
              if(dictTypeClass==null)
              {
                 dictTypeClass=new ArrayList();
                 dictTypeClass.add(dictType);
                 map.put(dictType.getModuleName().trim(),dictTypeClass);
              }
              else
              {
                  dictTypeClass.add(dictType);
                  map.remove(dictType.getModuleName().trim());
                  map.put(dictType.getModuleName().trim(),dictTypeClass);
              }
           }
            
         }
         Iterator iterator=map.keySet().iterator();
         int index=0;
         while(iterator.hasNext())
         {
            index++;
            String modelName=(String)iterator.next();
            out.println("var t"+index+" = new WebFXTreeItem('"+modelName+"','javascript:doChangeMain(\\'modelName\\',\\'"+modelName+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
            List dictTypeClass=(List)map.get(modelName);
            for(int i=0;i<dictTypeClass.size();i++)
            {
                DictType dictType=(DictType)dictTypeClass.get(i);
                 out.println("var t"+(index+1+i)+" = new WebFXTreeItem('"+dictType.getDictTypeName()+"("+dictType.getDictTypeCode()+")','javascript:doChangeMain(\\'dictType\\',\\'"+dictType.getDictTypeId()+"\\')',t"+index+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
            
            }
	    	
         }
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }
 
%>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<script type="text/javascript">
var webFXTreeConfig = {
	rootIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	openRootIcon    : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	folderIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png',
	openFolderIcon  : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	fileIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	iIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/I.png',
	lIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/L.png',
	lMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lminus.png',
	lPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lplus.png',
	tIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/T.png',
	tMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tminus.png',
	tPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tplus.png',
	blankIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/blank.png',
	defaultText     : 'Tree Item',
	defaultAction   : 'javascript:void(0);',
	defaultBehavior : 'classic',
	usePersistence	: false
};

function doChangeMain(flag,value){
      if("modelName"==flag)
      {
         //parent.main.location.href="<%=baseURL%>/getDictTypeBymoduleName_abdf.do?moduleName="+value;
      }
      else
      {
         parent.main.location.href="<%=baseURL%>/showDictType_abdf.do?dictTypeId="+value;
      }
        
  }
  
function doNothing()
{
   parent.main.location.href="<%=baseURL%>/getAllDictType_abdf.do"; 
}

</script>
</head>
<body class="clsTreeBody" >
<hr>
<script>
<%   buildDictTypeTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll();
        
  </script></body>
</html>
