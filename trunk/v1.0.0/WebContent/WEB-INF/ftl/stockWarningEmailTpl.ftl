<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=GB2312">
</HEAD>
<BODY>
<!-- 库存预警邮件模板 -->
<p>尊敬的用户您好：</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;您的如下库存出现了预警，请及时更新您的库存，谢谢！</p><br/>

<#list stockList as slItem>
<p>&nbsp;&nbsp;&nbsp;&nbsp;${slItem.name}，预警库存数为：${slItem.warningMiValue}，当前库存数为：${slItem.inventory}。</p><br/>
谢谢！
</#list>

</BODY>
</HTML>