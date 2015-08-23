function Validation() {
    this.name = null;
    this.params = null;
    this.displayError = null;
    this.atClient=true;
    this.fire=null;
    this.fireValue=null;
     this.form = null;
    
    this.getFireValue = function() { return this.fireValue; }
    this.setFireValue = function(p0) { this.fireValue = p0; }
    
    this.getFire = function() { return this.fire; }
    this.setFire = function(p0) { this.fire = p0; }
    
    this.getAtClient = function() { return this.atClient; }
    this.setAtClient = function(p0) { this.atClient = p0; }

    this.getName = function() { return this.name; }
    this.setName = function(p0) { this.name = p0; }

    this.getParams = function() { return this.params; }
    this.setParams = function(p0) { this.params = p0; }

    this.getDisplayError = function() { return this.displayError; }
    this.setDisplayError = function(p0) { this.displayError = p0; }
    
     this.getForm = function() { return this.form; }
    this.setForm = function(p0) { this.form = p0; }
}