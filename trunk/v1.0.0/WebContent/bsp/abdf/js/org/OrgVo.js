/*----------------------------------------------------------------------------\
|                                组织结构JS
|-----------------------------------------------------------------------------
|                             作者:刘正仁
\----------------------------------------------------------------------------*/
function OrgVo()
{
   this.orgId="";  //要选择的顶层组织id
   this.orgName="";//要选择的顶层组织名称
   this.orgType="";//要选择的顶层组织类型
   this.orgParentId="";
   this.includeChild="true"
   this.orgParentName="";
   this.orgParentType="";
   this.selectOrgType=""; //要选择的组织架构类型 多个可以用,号分开如:GS,BM,YG
   this.subOrgVos=new Array(); //以选择的组织，数组中包含的是OrgVo对象
    this.size=1; //设置系统可以选择的个数 .0表示任一个;
}

OrgVo.prototype.setIncludeChild=function (includeChild)
{
  this.includeChild=includeChild;
}

OrgVo.prototype.getIncludeChild=function ()
{
   return this.includeChild;
}

OrgVo.prototype.setSize=function (size)
{
  this.size=size;
}

OrgVo.prototype.getSize=function ()
{
   return this.size;
}


OrgVo.prototype.clearSubOrgVos=function ()
{
  try
   {
	   var objCount=this.subOrgVos.length;
	   this.subOrgVos.splice(0,objCount);
   }catch(ex)
  {
  }

}

OrgVo.prototype.setSelectOrgType=function (selectOrgType)
{
  this.selectOrgType=selectOrgType;
}

OrgVo.prototype.getSelectOrgType=function ()
{
   return this.selectOrgType;
}


OrgVo.prototype.setOrgParentType=function (orgParentType)
{
  this.orgParentType=orgParentType;
}

OrgVo.prototype.getOrgParentType=function ()
{
   return this.orgParentType;
}



OrgVo.prototype.setOrgParentId=function (orgParentId)
{
  this.orgParentId=orgParentId;
}

OrgVo.prototype.getOrgParentId=function ()
{
   return this.orgParentId;
}

OrgVo.prototype.setOrgParentName=function (orgParentName)
{
  this.orgParentName=orgParentName;
}
OrgVo.prototype.getOrgParentName=function ()
{
   return this.orgParentName;
}

OrgVo.prototype.setSubOrgVos=function (subOrgVos)
{
  this.subOrgVos=subOrgVos;
}
OrgVo.prototype.getSubOrgVos=function ()
{
   return this.subOrgVos;
}

OrgVo.prototype.setOrgId=function (orgId)
{
  this.orgId=orgId;
}
OrgVo.prototype.getOrgId=function ()
{
   return this.orgId;
}

OrgVo.prototype.setOrgName=function (orgName)
{
  this.orgName=orgName;
}
OrgVo.prototype.getOrgName=function ()
{
   return this.orgName;
}

OrgVo.prototype.setOrgType=function (orgType)
{
  this.orgType=orgType;
}
OrgVo.prototype.getOrgType=function ()
{
   return this.orgType;
}