/*----------------------------------------------------------------------------\
|                                流程域 JS
|-----------------------------------------------------------------------------
|                             作者:刘正仁
\----------------------------------------------------------------------------*/
function WfField()
{
   this.fieldChinaName="";
   this.fieldAlias="";
   this.fieldInputType="";
   this.isArray="";
}

WfField.prototype.setFieldChinaName=function (fieldChinaName)
{
  this.fieldChinaName=fieldChinaName;
}

WfField.prototype.getFieldChinaName=function ()
{
   return this.fieldChinaName;
}

WfField.prototype.setFieldAlias=function (fieldAlias)
{
  this.fieldAlias=fieldAlias;
}

WfField.prototype.getFieldAlias=function ()
{
   return this.fieldAlias;
}

WfField.prototype.setFieldInputType=function (fieldInputType)
{
  this.fieldInputType=fieldInputType;
}

WfField.prototype.getFieldInputType=function ()
{
   return this.fieldInputType;
}

WfField.prototype.setIsArray=function (isArray)
{
  this.isArray=isArray;
}

WfField.prototype.getIsArray=function ()
{
   return this.isArray;
}

