
function Validation() {
	this.name = null;
	this.params = [];

	this.getName = function() { return this.name; }
	this.setName = function(p0) { this.name = p0; }

	this.getParams = function() { return this.params; }
	this.setParams = function(p0) { this.params = p0; }

	this.addParam = function(p0) {
		this.params[this.params.length] = p0;
	}
}