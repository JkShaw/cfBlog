component {
	this.name = "leancfinaweek";
	this.datasource = "learncfinaweek";
	this.applicationTimeout = createtimespan(10,0,0,0);
	this.sessionManagement = true;
	this.sessionTimeout = createTimespan(10,0,30,0);
	this.ormEnabled = true;
	this.ormSettings = {	logsql=true,
							dbcreate="update",
							cfclocation="com/entity" };
	this.invokeimplicitaccessor = true;
	
	function onApplicationStart() {
		application.myName = 'Jyotish';
		application.myPosition = 'A Good Developer';
		application.utilities = CreateObject('cfc.utilities');
		return true;
	}
	
	function onRequestStart(string targrtPage) {
		if(structKeyExists(url,'reload')) {
			onApplicationStart();
			ormReload();
		}
	}
}