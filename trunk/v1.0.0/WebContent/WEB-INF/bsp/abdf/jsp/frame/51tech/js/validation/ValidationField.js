
   function ValidationField() {
    this.name = null;     //域的名字
    this.displayError = null;//当验证失败时要显示的信息
    this.validations = [];//要进行多少个数据验证
    this.form = null;//所属表单
    this.fire=null;//此验证由那个控件激活
    this.value=null;//激活的值
    this.fevf=null;
    this.isSubForm=false; //是否子表的域
    
    this.noRepeat=null;    //子表单专用，是否要重复
    this.noRepeatValue=null;//如果不能重复，不能重复的值是什么。
    this.isArray=null;//是否数据，这与子表单控件有关
    
    this.getIsSubForm = function() { return this.isSubForm; }
    this.setIsSubForm = function(p0) { this.isSubForm = p0; }
    
    
    this.getNoRepeat = function() { return this.noRepeat; }
    this.setNoRepeat = function(p0) { this.noRepeat = p0; }
    
    this.getNoRepeat = function() { return this.noRepeat; }
    this.setNoRepeat = function(p0) { this.noRepeat = p0; }
    
    this.getNoRepeatValue = function() { return this.noRepeatValue; }
    this.setNoRepeatValue = function(p0) { this.noRepeatValue = p0; }
    
    this.getIsArray = function() { return this.isArray; }
    this.setIsArray = function(p0) { this.isArray = p0; }
    
    
    this.getName = function() { return this.name; }
    this.setName = function(p0) { this.name = p0; }

    this.getDisplayError = function() { return this.displayError; }
    this.setDisplayError = function(p0) { this.displayError = p0; }
    
    this.getValue = function() { return this.value; }
    this.setValue = function(p0) { this.value = p0; }
    
    this.getFevf = function() { return this.fevf; }
    this.setFevf = function(p0) { this.fevf = p0; }




    this.getValidations = function() { return this.validations; }
    this.setValidations = function(p0) { this.validations = p0; }

    this.getFire = function() { return this.fire; }
    this.setFire = function(p0) { this.fire = p0; }
    
    this.getForm = function() { return this.form; }
    this.setForm = function(p0) { this.form = p0; }

    this.addValidation = function(p0) {
        this.validations[this.validations.length] = p0;
    }
    this.findValidation = function(p0) {
        for (var i = 0; i < this.validations.length; i++) {
            if (this.validations[i].getName() == p0) {
                return this.validations[i];
            }
        }
        return null;
    }
}
