function Param() {
	this.dataType = null;
	this.value = null;
	this.page = null;
	this.index = null;
	this.id = null;
	this.form = null;
	
	this.getForm = function() { return this.form; }
    this.setForm = function(p0) { this.form = p0; }
    
	this.getId = function() { return this.id; }
    this.setId = function(p0) { this.id = p0; }

	this.getDataType = function() { return this.dataType; }
	this.setDataType = function(p0) { this.dataType = p0; }

	this.getValue = function() { return this.value; }
	this.setValue = function(p0) { this.value = p0; }
	
	
	this.getPage = function() { return this.page; }
	this.setPage = function(p0) { this.page = p0; }
	
	this.getIndex = function() { return this.index; }
	this.setIndex = function(p0) { this.index = p0; }
	
		
}