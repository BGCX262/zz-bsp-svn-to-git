<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <SCRIPT>
    var orgVo=null;
     function selectPostOrg()
    {
       orgVo=new OrgVo();
       orgVo.setOrgId("<bean:write name="org" property="orgId"/>"); //根节点id设置 
       orgVo.setOrgName("<bean:write name="org" property="orgName"/>");//根节点名称设置 
       orgVo.setOrgType("<bean:write name="org" property="orgTypeCode"/>");//根节组织架构类型 
       orgVo.setIncludeChild("false");
       
       orgVo.setSelectOrgType("YG");//设置可以选择的组织架构类型 
       orgVo.setSize(0);
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_urss.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
       if(returnValue==null) return ;
      
    }
    </SCRIPT>
   
    </head>
    <html>
    <body>
    <table <%=tableStyle%> width="100%">
    <form action="<%=baseURL%>/savePostAssign_urss.do" method="post" id="postAssign">
            <tr class="ListTableHeader">
                <td colspan="4">
                    <div align="center">
                            <strong>
                            为岗位<bean:write name="postAssign" property="postName"/>在<bean:write name="org" property="orgName"/>下分配人员
                            
                            
                            </strong>
                    </div>
                </td>
            </tr>
            <tr class=ListTableRow>
                <td colspan="4">
                    <input type='button' name='power_button'  value='新增人员'   class='Button3'  onclick="selectPostOrg()" id='OrgEdit_SAVE'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='删除人员'   class='Button3'  onclick="deletePost()" id='OrgEdit_SAVE'>&nbsp;&nbsp;  
                </td>
            </tr>
    </table>
    <table width="100%" <%=tableStyle%>>
        <tr>
            <th align="center" class="ListTableHeader" width="15%">操作</th>
            <th width="85%" align="center" class="ListTableHeader" nowrap="nowrap"><b>人员姓名</b></th>
            
        </tr>
        
    </table>
    </form>
    </body>
    
</html>


