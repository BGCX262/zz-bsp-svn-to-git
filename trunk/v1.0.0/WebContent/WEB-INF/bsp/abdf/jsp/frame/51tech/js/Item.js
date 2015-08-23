/*----------------------------------------------------------------------------\
|                                值和key JS
|-----------------------------------------------------------------------------
|                             作者:刘正仁
\----------------------------------------------------------------------------*/
function Item()
{
   this.key=""; 
   this.value="";

}

Item.prototype.setKey=function (key)
{
  this.key=key;
}

Item.prototype.getKey=function ()
{
   return this.key;
}

Item.prototype.setValue=function (value)
{
  this.value=value;
}

Item.prototype.getValue=function ()
{
   return this.value;
}

