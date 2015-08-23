<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<html>
    <head>
        <script>
function closeWidow()
{
    window.close();
}
function dispalyCreate(obj)
{
  var objTr= document.getElementById("createTo");
  var displayVlue=objTr.style.display;
  if(displayVlue=='none')
  {
      objTr.style.display='';
      obj.value="创建到 <<";
      window.dialogHeight ="300 px"
  }
  else
  {
      objTr.style.display='none';
      obj.value="创建到 >>";
      window.dialogHeight ="110 px"
  }
}
</script>
        <title>整到收藏夹</title>
        
        <script type="text/javascript" src="<%=baseURL%>/js/hint.js"></script>
        <script language="javascript" src="<%=baseURL%>/js/tab/tabpane.js"></script>
        <link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="<%=baseURL%>/css/tab/tab.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    </head>

    <body>

        <table width="100%" border="0" cellSpacing="0" cellpadding="1" bordercolorlight="#E2D7CF" bordercolordark="#FAF8F6">
            <tr>
                <td width="169" rowspan="3">
                    树型列表
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type='button' name='power_button' value='新建文件夹' class='Button4'>
                    <input type='button' name='power_button' value='重命名' class='Button4'>
                    <br>
                    <input type='button' name='power_button' value='移至文件夹' class='Button4'>
                    <input type='button' name='power_button' value='删除' class='Button4'>
                </td>
            </tr>
            <tr>
                <td height="220"  valign="top">
                    <div class="tab-pane" id="tabPane1">
                        <script type="text/javascript">
                        tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
                        </script>

                        <div class="tab-page" id="tabPage1" height="200">
                            <h2 class="tab">
                                工作区
                            </h2>

                            <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
                            <table widht="100%" height="200">
                             <tr><td></td><tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
              <td colspan="4">
                <div align="center">
                  <input type='button' name='power_button' value='关闭' class='Button4'>              
              </div></td>
            </tr>
        </table>
    </body>
</html>


