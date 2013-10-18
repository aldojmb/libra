var badSessionFn = null;
var sessionOkFn = null;
var loginServer = null;

function logoutOK(){
	location = top.appLoguinURL + "?errorMsg=" + encodeURIComponent("Su sesi&oacute;n ha terminado correctamente");
}

function logoutOKNoSession(){
	location = top.appLoguinURL + "?errorMsg=" + encodeURIComponent("Su sesi&oacute;n ha caducado");
}

function logoutFa(){
	if(winOwner)
		winOwner.location = top.appLoguinURL;
	else
		location = top.appLoguinURL;
}

function invalidSesion(response){
	top.mainFrame.location = top.appLoguinURL + "?errorMsg=" + encodeURIComponent("Su sesi&oacute;n ha expirado");
}

function logout(sessionClosed)
{
	showLoading();
	if(!loginServer)
		loginServer = new EquipaTAjaxServices.SessionValidator();
	if(sessionClosed)
		loginServer.logout(logoutOKNoSession, logoutFa);
	else
		loginServer.logout(logoutOK, logoutFa);
}

function sesionValidation(response){
	if(response == "99")
	{
		if(badSessionFn)
			setTimeout(badSessionFn, 10);
		else
			setTimeout(invalidSesion, 10)
	}else if(sessionOkFn)
	{
		setTimeout(sessionOkFn, 10);
	}
}

function validateSesion( onValidSession, onInvalidSession){
	if(!loginServer)
		loginServer = new EquipaTAjaxServices.SessionValidator();
	badSessionFn = onInvalidSession;
	sessionOkFn = onValidSession;
	loginServer.validateSession(sesionValidation, invalidSesion);
}