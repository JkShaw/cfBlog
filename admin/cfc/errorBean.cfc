component {
	public errorBean function init() {
		variables.errors = [];
		return this;
	}
	
	public void function addError(string message, string field) {
		arrayAppend(variables.errors,{message=arguments.message, field=arguments.field});
	}
	
	public array function getErrors() {
		return variables.errors;
	}
	
	public boolean function hasErrors() {
		if(arrayLen(variables.errors)) {
			return true;
		}
	}
	
	public void function clearErrors() {
		variables.errors = [];
	}
}