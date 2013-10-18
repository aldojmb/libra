function ajaxRequest(url, functionToRespondOK, functionToRespondFailure){

    var respuesta = null;

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Msxml2.XMLHTTP");

        if (!request) {
            request = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    if (request) {
        request.open("GET",url,true);
        request.onreadystatechange = function(){
            if (request.readyState==4) {
                respuesta = request.responseText;
                if(request.status == 200 && functionToRespondOK){
                    functionToRespondOK(respuesta);
                }else if(functionToRespondFailure){
                    respuesta = request.responseText;
                    functionToRespondFailure(respuesta, request.status);
                }
            }
        }
        request.setRequestHeader('Accept','message/x-jl-formresult');
        request.send();
    }

    return respuesta;
}

function ajaxPOST(url, content,functionToRespondOK, functionToRespondFailure){

    var respuesta = null;

    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Msxml2.XMLHTTP");

        if (!request) {
            request = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    if (request) {
        request.open("POST",url,true);
        request.onreadystatechange = function(){
            if (request.readyState==4) {
                respuesta = request.responseText;
                if(request.status == 200 && functionToRespondOK){
                    functionToRespondOK(respuesta);
                }else if(functionToRespondFailure){
                    respuesta = request.responseText;
                    functionToRespondFailure(respuesta, request.status);
                }
            }
        }
        
        request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        request.setRequestHeader('Accept-Charset','iso-10646');
        request.send(content);
    }

    return respuesta;
}
