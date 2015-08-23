
function SubForm(){
    this.name=null;
    //this.displayContent=null;
    this.flagField=null;
    this.fields = []; 
    this.form = null;
    
    this.getName = function() { return this.name; }
    this.setName = function(p0) { this.name = p0; }
    
    //this.getDisplayContent = function() { return this.displayContent; }
    //this.setDisplayContent = function(p0) { this.displayContent = p0; }
    
    
    this.getFlagField = function() { return this.flagField; }
    this.setFlagField = function(p0) { this.flagField = p0; }
    
    this.getFields=function(){return this.fields}
    this.setFields = function(p0) { this.fields = p0; }
    
    this.getForm = function() { return this.form; }
    this.setForm = function(p0) { this.form = p0; }
    
    
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
    
    
}