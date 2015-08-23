
function ValidationForm() {
    this.fields = []; 
    this.name = null;
    this.extJs="";
    this.atClient=true;
    this.displayType="div"
    this.displayContent="true";
    this.subForms=[];
    

    this.getFields=function(){return this.fields}
    this.setFields = function(p0) { this.fields = p0; }
    
    this.getExtJs=function(){return this.extJs}
    this.setExtJs = function(p0) { this.extJs = p0; }
    
    this.getName = function() { return this.name; }
    this.setName = function(p0) { this.name = p0; }
    
    this.getAtClient = function() { return this.atClient; }
    this.setAtClient = function(p0) { this.atClient = p0; }
    
    this.getDisplayType = function() { return this.displayType; }
    this.setDisplayType = function(p0) { this.displayType = p0; }
    
    this.getDisplayContent = function() { return this.displayContent; }
    this.setDisplayContent = function(p0) { this.displayContent = p0; }
    
    this.getSubForms=function(){return this.subForms}
    this.setSubForms = function(p0) { this.subForms = p0; }
    
    
    this.findField = function(p0) {
        for (var i = 0; i < this.fields.length; i++) {
            if (this.fields[i].getName() == p0) {
                return this.fields[i];
            }
        }
        return null;
    }
    
    this.addField = function(p0) {
        this.fields[this.fields.length] = p0;
        p0.setForm(this);
    }
    
    
    this.findSubForm = function(p0) {
        for (var i = 0; i < this.subForms.length; i++) {
            if (this.subForms[i].getName() == p0) {
                return this.subForms[i];
            }
        }
        return null;
    }
    
    this.addSubForm = function(p0) {
        this.subForms[this.subForms.length] = p0;
        p0.setForm(this);
    }
  }