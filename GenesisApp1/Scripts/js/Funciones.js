window.history.forward(1);

if (!document.all){
  	document.captureEvents(Event.MOUSEDOWN);
   	document.onmousedown = function clearEvent(e){
	if (e.which > 1) return false;}
}
document.oncontextmenu = function(){return false;};

/*Utilizado para evitar el copiado, pegado y cortado en inputs de textarea y text*/
function onKeyDown() {
  // current pressed key
  var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();
  var aux = String.fromCharCode(event.insertKey).toLowerCase();
  //alert(event.shiftKey);
  if ((event.ctrlKey && (pressedKey == "c" ||  
                         pressedKey == "v" || 
                         pressedKey == "n" || 
                         pressedKey == "u" ||
                         pressedKey == "p" ||
						 pressedKey == "x")) || 
						 event.shiftKey ){
    // disable key press porcessing
    event.returnValue = false;
  }
} // onKeyDown

function onKeyDown2() {
  // current pressed key
  var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();
  var aux = String.fromCharCode(event.insertKey).toLowerCase();
  //alert(event.shiftKey);
  if ((event.ctrlKey && (pressedKey == "c" ||  
                         //pressedKey == "v" || 
                         pressedKey == "n" || 
                         pressedKey == "u" ||
                         pressedKey == "p" ||
						 pressedKey == "x")) || 
						 event.shiftKey ){
    // disable key press porcessing
    event.returnValue = false;
  }
} // onKeyDown


//	FUNCIONES DEL MENU PRINCIPAL
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

//	OCULTAR LA LIGA EN LA BARRA DE STATUS
function hidestatus(){
window.status=''
return true
}

if (document.layers)
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT)

document.onmouseover=hidestatus
document.onmouseout=hidestatus

//	SCROLL EN LA BARRA DE ESTADO
var osd = " "
osd +=" ";
var timer;
var msg = "";
function scrollMaster () {
	msg = ""
//	clearTimeout(timer)
//	msg += " " + showtime() + " " + osd
	for (var i= 0; i < 100; i++){
		msg = " " + msg;
	}
	scrollMe()
}

function scrollMe(){
	window.status = msg;
	msg = msg.substring(1, msg.length) + msg.substring(0,1);
	timer = setTimeout("scrollMe()", 200);
}
scrollMaster();

function salir(url){
	var x=confirm("¿ Desea salir de la aplicación ?")
	if (x)
		window.location = url+"index.asp?s=1"
}

//VALIDACIONES DE CAMPOS INPUT
function Validkey(tipo) {
//alert(event.keyCode);

/*Utilizado para la captura de los campos de usuario y password*/
	if (tipo=="usuario"){
		if(((event.keyCode<48) || (event.keyCode>57)) && ((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=46 && event.keyCode!=209 && event.keyCode!=241 && event.keycode!=95)
		event.returnValue=false;
	}
/*Utilizado para la captura de los campos de usuario y password*/
	if (tipo=="login"){
		if(((event.keyCode<48) || (event.keyCode>57)) && ((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=36 && event.keyCode!=38 && event.keyCode!=60 && event.keyCode!=62 && event.keyCode!=44 && event.keyCode!=59 && event.keyCode!=45 && event.keyCode!=95 && event.keyCode!=63 && event.keycode!=47)
		event.returnValue=false;
    }	
/*Permite capturar casi todos los signos, así como también acentos*/
	if (tipo=="textarea"){
		if(((event.keyCode<48) || (event.keyCode>57)) && ((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=32 && event.keyCode!=40 && event.keyCode!=41 && event.keyCode!=44 && event.keyCode!=45 && event.keyCode!=46 && event.keyCode!=59 && event.keyCode!=95 && event.keyCode!=193 && event.keyCode!=201 && event.keyCode!=205 && event.keyCode!=209 && event.keyCode!=211 && event.keyCode!=218 && event.keyCode!=225 && event.keyCode!=233 && event.keyCode!=237 && event.keyCode!=241 && event.keyCode!=243 && event.keyCode!=250 && event.keyCode!=64 && event.keyCode!=191 && event.keyCode!=63 && event.keyCode!=61)
		event.returnValue=false;
	}
	if (tipo=="tsangre"){
		if(((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=43 && event.keyCode!=45)
		event.returnValue=false;
	}
/*Utilizado para la captura de los campos de nombre, paterno, materno, ya que no permite capturar acentos*/
	if (tipo=="nombres"){
		if(((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=32 && event.keyCode!=241 && event.keyCode!=209 && event.keyCode!=46)
		event.returnValue=false;
	}
/*Captura todas las letras, incluyendo acentos*/
	if (tipo=="texto"){
		if(((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=32 && event.keyCode!=38 && event.keyCode!=241 && event.keyCode!=209 && event.keyCode!=46 && event.keyCode!=193 && event.keyCode!=201 && event.keyCode!=205 && event.keyCode!=211 && event.keyCode!=218 && event.keyCode!=225 && event.keyCode!=233 && event.keyCode!=38 && event.keyCode!=237 && event.keyCode!=243 && event.keyCode!=250)
		event.returnValue=false;
	}
/*Captura todos los caracteres del domicilio*/
	if (tipo=="domicilio"){
		if(((event.keyCode<48) || (event.keyCode>57)) && ((event.keyCode<65) || (event.keyCode>122)) && event.keyCode!=32 && event.keyCode!=241 && event.keyCode!=209 && event.keyCode!=46)
		event.returnValue=false;
	}
/*Exclusivamente números*/
	if (tipo=="numerico"){
		if((event.keyCode<48) || (event.keyCode>57))
		event.returnValue=false;
	}
/*Exclusivamente números y diagonales "/"*/
	if (tipo=="fecha"){
		if(((event.keyCode<48) || (event.keyCode>57)) && event.keyCode!=45)
		event.returnValue=false;
	}
/*Numeros, letras, arroba y punto*/
	if (tipo=="email"){
		if((event.keyCode<48 || event.keyCode>57) && (event.keyCode<65 || event.keyCode>90) && (event.keyCode<97 || event.keyCode>122) && event.keyCode!=31 && event.keyCode!=45 && event.keyCode!=46 && event.keyCode!=64 && event.keyCode!=95 && event.keyCode!=209 && event.keyCode!=241)
		event.returnValue=false;
	}
/*Numeros, letras, dos puntos, punto y diagonal*/
	if (tipo=="url"){
		if(((event.keyCode<48) || (event.keyCode>57)) && ((event.keyCode<65) || (event.keyCode>90)) && ((event.keyCode<97) || (event.keyCode>122)) && event.keyCode!=45 && event.keyCode!=46 && event.keyCode!=47 && event.keyCode!=58 && event.keyCode!=95)
		event.returnValue=false;
	}
/*Números con espacio*/
	if (tipo=="numericoespacio"){
		if(((event.keyCode<48) || (event.keyCode>57)) && event.keyCode!=32)//46
		event.returnValue=false;
	}
	/*Números y letras SIN espacio*/
	if (tipo == "rfc") {
	    if (((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 65) || (event.keyCode > 90)) && ((event.keyCode < 97) || (event.keyCode > 122)))
	        event.returnValue = false;
	}

	/*Números y letras SIN espacio y guion medio '-'*/
	if (tipo == "placas") {
	    if (((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 65) || (event.keyCode > 90)) && ((event.keyCode < 97) || (event.keyCode > 122)) && event.keyCode != 45)
	        event.returnValue = false;
	}
	
/*Ningún caracter*/
	if (tipo=="blocktext"){
		if((event.keyCode>0) || (event.keyCode<200))
		event.returnValue=false;
	}
	
	if (tipo=="nada"){
	   if (event.keyCode!=9){
	    if (event.keyCode==8 || event.keyCode==13)
        	{
	            var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();
                if (event.ctrlKey && (pressedKey == "c" || 
                        pressedKey == "v" ||
                        pressedKey == "n" ||
                        pressedKey == "u" ||
						pressedKey == "x")) {
                 // disable key press porcessing
                event.returnValue = false;}
	            event.returnValue=false;
	        }
		event.returnValue=false;
		}
	}
	
/*Hexadecimal*/
	if (tipo=="hexadecimal"){
		if(((event.keyCode<48) || (event.keyCode>57)) && ((event.keyCode<65) || (event.keyCode>70)) && ((event.keyCode<97) || (event.keyCode>102)))
		event.returnValue=false;
	}
	
	/*CLORALEX & PINOL*/
    if (tipo=="C_AND_P"){
        if(event.keyCode!=71 && event.keyCode!=76 && event.keyCode!=77 && event.keyCode!=80 && event.keyCode!=86 && event.keyCode!=103 && event.keyCode!=108 && event.keyCode!=109 && event.keyCode!=112 && event.keyCode!=118)
        event.returnValue=false;
    }
    if (tipo=="cantidad"){
		if(((event.keyCode<48) || (event.keyCode>57)) && event.keyCode!=46)
		event.returnValue=false;
	}
    

}

function isDate(d) {	//	DD/MM/AAAA
  if (d == "")
    return false;
  
  e = new RegExp("^[0-9]{1,2}\/[0-9]{1,2}\/([0-9]{2}|[0-9]{4})$");
  
  if (!e.test(d))
    return false;

  j = parseInt(d.split("/")[0], 10);
  m = parseInt(d.split("/")[1], 10);
  a = parseInt(d.split("/")[2], 10);

  if (a < 1000) {
    if (a < 89)  a+=2000;
    else a+=1900;
  }

  if (a%4 == 0 && a%100 !=0 || a%400 == 0) fev = 29;
  else fev = 28;

  nbJours = new Array(31,fev,31,30,31,30,31,31,30,31,30,31);

  return ( m >= 1 && m <=12 && j >= 1 && j <= nbJours[m-1] );
}

function limite(zone,formulario,contador,max)
{	//limite(this,'cuestionario','observacioneslen',200);
	var doc
	doc = eval("document."+formulario+"")
	if(zone.value.length>=max){zone.value=zone.value.substring(0,max);}
	eval("doc."+contador+"").value = zone.value.length
}

//ELIMINA MENÚ CONTEXTUAL
if (!document.all){
  	document.captureEvents(Event.MOUSEDOWN);
   	document.onmousedown = function clearEvent(e){if (e.which > 1) return false;}
}
document.oncontextmenu = function(){
	return false;
}

//Función para Evitar inyección de código
function inyeccion(objtext1) {
	var inText = objtext1.value;
	var ret;

	for (var i = 0; i < inText.length; i++) {
		ret = inText.charCodeAt(i);
		if ((ret > 241) || (ret > 209 && ret < 241) || (ret > 122 && ret < 209) || (ret < 48 && ret != 32) || (ret > 57 && ret < 65) || (ret > 90 && ret < 96) || (ret > 95 && ret < 97)) {
			alert("Ingresaste caracteres invalidos");
			objtext1.value = "";
			objtext1.focus();
			return false;
		}
	}
	return true;
}

//Función para Evitar inyección de código en un campo de Observaciones
function InyeObserva(objtext1) {
	var inText = objtext1.value;
	var ret;

	for (var i = 0; i < inText.length; i++) {
		ret = inText.charCodeAt(i);
		if ((ret > 241) || (ret > 209 && ret < 241) || (ret > 122 && ret < 209) || (ret < 48 && ret != 32 && ret !=40 && ret !=41 && ret !=44 && ret !=46) || (ret > 57 && ret < 65 && ret !=64 && ret !=59) || (ret > 90 && ret < 96 && ret !=95) || (ret > 95 && ret < 97)) {
			alert("Ingresaste caracteres invalidos");
			objtext1.value = "";
			objtext1.focus();
			return false;
		}
	}
	return true;
}


function isEmailAddress(theElement, nombre_del_elemento )
{
var s = theElement.value;
var filter=/^[A-Za-z][A-Za-z0-9_]*@[A-Za-z0-9_]+\.[A-Za-z0-9_.]+[A-za-z]$/;
if (s.length == 0 ) return true;
if (filter.test(s))
return true;
else
alert("Ingrese una dirección de correo válida");
theElement.focus();
return false;
}

var isIE = document.all?true:false;
var isNS = document.layers?true:false;

/* Función para permitir sólo dígitos (con o sin decimales) en un campo */
function onlyDigits(e,decReq) {
	var key = (isIE) ? window.event.keyCode : e.which;
	var obj = (isIE) ? event.srcElement : e.target;
	var isNum = (key > 47 && key < 58) ? true:false;
	var dotOK = (key==46 && decReq=='decOK' && (obj.value.indexOf(".")<0 || obj.value.length==0)) ? true:false;
	window.event.keyCode = (!isNum && !dotOK && isIE) ? 0:key;
	e.which = (!isNum && !dotOK && isNS) ? 0:key;
	return (isNum || dotOK);
}


function NumCheck(e, field) {
  key = e.keyCode ? e.keyCode : e.which

  // backspace
  if (key == 8) return true
  
  // 0-9
  if (key > 47 && key < 58) {
    if (field.value == "") return true
    
    regexp = /,[0-9]{2}$/
    return !(regexp.test(field.value))
  }

  // ,
  if (key == 46
  ) {
  
    if (field.value == "") return false
    
    regexp = /^[0-9]+$/
    return regexp.test(field.value)
  }
  
  // other key
  return false

}


/* Función para validar fecha */
function IsNumeric(valor) 
{ 
var log=valor.length; var sw="S"; 
for (x=0; x<log; x++) 
{ v1=valor.substr(x,1); 
v2 = parseInt(v1); 
//Compruebo si es un valor numérico 
if (isNaN(v2)) { sw= "N";} 
} 
if (sw=="S") {return true;} else {return false; } 
} 

var primerslap=false; 
var segundoslap=false; 
function formateafecha(fecha) 
{ 
var long = fecha.length; 
var dia; 
var mes; 
var ano; 

if ((long>=2) && (primerslap==false)) { dia=fecha.substr(0,2); 
if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00")) { fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); primerslap=true; } 
else { fecha=""; primerslap=false;} 
} 
else 
{ dia=fecha.substr(0,1); 
if (IsNumeric(dia)==false) 
{fecha="";} 
if ((long<=2) && (primerslap=true)) {fecha=fecha.substr(0,1); primerslap=false; } 
} 
if ((long>=5) && (segundoslap==false)) 
{ mes=fecha.substr(3,2); 
if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); segundoslap=true; } 
else { fecha=fecha.substr(0,3);; segundoslap=false;} 
} 
else { if ((long<=5) && (segundoslap=true)) { fecha=fecha.substr(0,4); segundoslap=false; } } 
if (long>=7) 
{ ano=fecha.substr(6,4); 
if (IsNumeric(ano)==false) { fecha=fecha.substr(0,6); } 
else { if (long==10){ if ((ano==0) || (ano<1900) || (ano>2100)) { fecha=fecha.substr(0,6); } } } 
} 

if (long>=10) 
{ 
    fecha=fecha.substr(0,10); 
    dia=fecha.substr(0,2); 
    mes=fecha.substr(3,2); 
    ano=fecha.substr(6,4); 
    // Año no viciesto y es febrero y el dia es mayor a 28 
    if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { fecha=fecha.substr(0,2)+"/"; } 
} 
return (fecha); 
}

/* Función para contar los caracteres escritos en el campo Observaciones */
function CuentaNetObs() 
{
    letras=document.getElementById('ctl00_ContentPlaceHolder1_txtObservaciones').value.length;
    document.getElementById('ctl00_ContentPlaceHolder1_txtTotal').value=1000 - letras;
    if (letras>1000)
    {  
		document.getElementById('ctl00_ContentPlaceHolder1_txtObservaciones').value = document.getElementById('ctl00_ContentPlaceHolder1_txtObservaciones').value.substring(0,1000);
        document.getElementById('ctl00_ContentPlaceHolder1_txtTotal').value=0;
    }
}

function CuentaNetPorQue() 
{
    letras=document.getElementById('ctl00_ContentPlaceHolder1_txtPorque').value.length;
    document.getElementById('ctl00_ContentPlaceHolder1_txtTotalPorque').value=1000 - letras;
    if (letras>1000)
    {  
		document.getElementById('ctl00_ContentPlaceHolder1_txtPorque').value = document.getElementById('ctl00_ContentPlaceHolder1_txtPorque').value.substring(0,1000);
        document.getElementById('ctl00_ContentPlaceHolder1_txtTotalPorque').value=0;
    }
}
//CRONOMETRO
var CronoID = null;
var CronoEjecutandose = false;
var decimas, segundos, minutos;
function DetenerCrono (){
    if(CronoEjecutandose){
        clearTimeout(CronoID);
    }
    CronoEjecutandose = false;
}
function InicializarCrono () {
    //inicializa contadores globales
    decimas = 0;
    segundos = 0;
    minutos = 0;
	
    //pone a cero los marcadores
    //document.crono.display.value = '00:00:0'
    document.getElementById('ctl00_txtCrono').value = '00:00:0';
}
function MostrarCrono () {
    //incrementa el crono
    decimas++;
    if ( decimas > 9 ) {
        decimas = 0;
        segundos++;
        if ( segundos > 59 ) {
	        segundos = 0;
	        minutos++;
	        if ( minutos > 60 ) {
		        alert('El tiempo de llamada se ha excedido');
		        DetenerCrono();
		        return true;
	        }
        }
    }
    //configura la salida
    var ValorCrono = "";
    ValorCrono = (minutos < 10) ? "0" + minutos : minutos;
    ValorCrono += (segundos < 10) ? ":0" + segundos : ":" + segundos;
    ValorCrono += ":" + decimas;
			
    //document.crono.display.value = ValorCrono
    document.getElementById('ctl00_txtCrono').value = ValorCrono;

    CronoID = setTimeout("MostrarCrono()", 100);
    CronoEjecutandose = true;
    return true;
}

function IniciarCrono() {
    DetenerCrono();
    InicializarCrono();
    MostrarCrono();
}

//Función Cerrar Página
function Cerrar(){
    window.top.location="Index.aspx";
    //window.close();
}

//Pagina de Inicio CRM
function PageInicio() {
    window.top.location="MenuCAECSU.aspx";
}

function onMouseOverTable()
{ 
  var eSrc = event.srcElement;
  if (eSrc.tagName != "TD")
    return;
  var table = eSrc.parentElement.parentElement.parentElement; //tr,tbody,table
  var row = table.rows[eSrc.parentElement.rowIndex];
  for (var i = 0; i < row.cells.length; i++)
  {
    var cell = row.cells[i];
    if (cell.style.color != null)
      cell.saveColor = cell.style.backgroundColor;
      cell.style.backgroundColor = "CCCCCC"; //247eb3
  }
}

function onMouseOutTable()
{
  var eSrc = event.srcElement;
  if (eSrc.tagName != "TD")
    return;
  var table = eSrc.parentElement.parentElement.parentElement; //tr,tbody,table
  var row = table.rows[eSrc.parentElement.rowIndex];
  for (var i = 0; i < row.cells.length; i++)
  {
    var cell = row.cells[i];
    if (cell.saveColor != null) {
      cell.style.backgroundColor = cell.saveColor;
    }
    else {
      cell.style.backgroundColor = "CCCCCC";
    }
  }
}

//VALIDACIONES PABLO

/*****TRAE LOS POPUPS****/
var enablepersist="off" //Enable saving state of content structure using session cookies? (on/off)
var collapseprevious="yes" //Collapse previously open content when opening present? (yes/no)
/*
var contractsymbol='<img src="images/minus.gif">' //Path to image to represent contract state.
var expandsymbol='<img src="images/plus.gif">' //Path to image to represent expand state.
*/
var contractsymbol='- ' //HTML for contract symbol. For image, use: <img src="whatever.gif">
var expandsymbol='+ ' //HTML for expand symbol.


if (document.getElementById){
document.write('<style type="text/css">')
document.write('.switchcontent{display:none;}')
document.write('</style>')
}

function getElementbyClass(rootobj, classname){
var temparray=new Array()
var inc=0
var rootlength=rootobj.length
for (i=0; i<rootlength; i++){
if (rootobj[i].className==classname)
temparray[inc++]=rootobj[i]
}
return temparray
}

function sweeptoggle(ec){
var thestate=(ec=="expand")? "block" : "none"
var inc=0
while (ccollect[inc]){
ccollect[inc].style.display=thestate
inc++
}
revivestatus()
}


function contractcontent(omit){
var inc=0
while (ccollect[inc]){
if (ccollect[inc].id!=omit)
ccollect[inc].style.display="none"
inc++
}
}

function expandcontent(curobj, cid){
var spantags=curobj.getElementsByTagName("SPAN")
var showstateobj=getElementbyClass(spantags, "showstate")
if (ccollect.length>0){
if (collapseprevious=="yes")
contractcontent(cid)
document.getElementById(cid).style.display=(document.getElementById(cid).style.display!="block")? "block" : "none"
if (showstateobj.length>0){ //if "showstate" span exists in header
if (collapseprevious=="no")
showstateobj[0].innerHTML=(document.getElementById(cid).style.display=="block")? contractsymbol : expandsymbol
else
revivestatus()
}
}
}

function revivecontent(){
contractcontent("omitnothing")
selectedItem=getselectedItem()
selectedComponents=selectedItem.split("|")
for (i=0; i<selectedComponents.length-1; i++)
document.getElementById(selectedComponents[i]).style.display="block"
}

function revivestatus(){
var inc=0
while (statecollect[inc]){
if (ccollect[inc].style.display=="block")
statecollect[inc].innerHTML=contractsymbol
else
statecollect[inc].innerHTML=expandsymbol
inc++
}
}

function get_cookie(Name) { 
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { 
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function getselectedItem(){
if (get_cookie(window.location.pathname) != ""){
selectedItem=get_cookie(window.location.pathname)
return selectedItem
}
else
return ""
}

function saveswitchstate(){
var inc=0, selectedItem=""
while (ccollect[inc]){
if (ccollect[inc].style.display=="block")
selectedItem+=ccollect[inc].id+"|"
inc++
}

document.cookie=window.location.pathname+"="+selectedItem
}

function do_onload(){
uniqueidn=window.location.pathname+"firsttimeload"
var alltags=document.all? document.all : document.getElementsByTagName("*")
ccollect=getElementbyClass(alltags, "switchcontent")
statecollect=getElementbyClass(alltags, "showstate")
if (enablepersist=="on" && ccollect.length>0){
document.cookie=(get_cookie(uniqueidn)=="")? uniqueidn+"=1" : uniqueidn+"=0" 
firsttimeload=(get_cookie(uniqueidn)==1)? 1 : 0 //check if this is 1st page load
if (!firsttimeload)
revivecontent()
}
if (ccollect.length>0 && statecollect.length>0)
revivestatus()
}

if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload

if (enablepersist=="on" && document.getElementById)
window.onunload=saveswitchstate

//ELIMINA ESPACIOS EN BLANCO
function trim(s) {
  while (s.substring(0,1) == ' ') {
    s = s.substring(1,s.length);
  }
  while (s.substring(s.length-1,s.length) == ' ') {
    s = s.substring(0,s.length-1);
  }
  return s;
}

/*FUNCION PARA TRAER AL FRENTE LOS POP-UP*/
function infos_membre(tipo){
	if (tipo==1){ //responsable front
		popup_membre = window.open('user.asp?user=1','popup','scrollbars=yes,status=yes,width=495,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==2){ //server
		popup_membre = window.open('serv.asp?serv=1','popup','scrollbars=yes,status=yes,width=495,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==3){ //bd
		popup_membre = window.open('datab.asp?serv=1','popup','scrollbars=yes,status=yes,width=495,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==4){ //recupera contraseña
		popup_membre = window.open('obten.asp','popup','scrollbars=yes,status=yes,width=476,height=270');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==5){ //server
		popup_membre = window.open('serv.asp?serv=2','popup','scrollbars=yes,status=yes,width=495,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==6){ //server
		popup_membre = window.open('datab.asp?serv=2','popup','scrollbars=yes,status=yes,width=495,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==7){ //bd
		popup_membre = window.open('user.asp?user=2','popup','scrollbars=yes,status=yes,width=495,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
	if (tipo==8){ //busqueda de usuarios
		popup_membre = window.open('busqueda.asp','popup','scrollbars=yes,status=yes,width=600,height=150');	
		//,'popup',''
		if (popup_membre && popup_membre.focus) popup_membre.focus();
	}
}	
	
/*FUNCION PARA EL CENTRADO DEL POPUP EN LA PANTALLA A CUALQUIER RESOLUCION*/	
function centrar() { 
    iz=(screen.width-document.body.clientWidth) / 2; 
    de=(screen.height-document.body.clientHeight) / 2; 
    moveTo(iz,de); 
}

//FUNCION PARA EVITAR EL DESPLIEGUE EL URL DE LA WEB EN LA BARRA DE ESTATUS
function hidestatus()
{
	window.status = '';
	return true
}

if(document.layers)
	document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT );

document.onmouseover = hidestatus;
document.onmouseout = hidestatus; 

/*LIMITE DE CARACTERES EN TEXTAREAS*/
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit) // if too long...trim it!
field.value = field.value.substring(0, maxlimit);
// otherwise, update 'characters left' counter
else 
countfield.value = maxlimit - field.value.length;
}


/*
-----------------------------------------------------------------------------------------
Deshabilitar select
------------------------------------------------------------------------------------------
*/

function disableselect(e) {
	return false;
}

function reEnable(){
	return true;
}

//if IE4+
//document.onselectstart = new Function ("return false");

//if NS6
if (window.sidebar) {
	document.onmousedown = disableselect;
	document.onclick = reEnable;
}

/*
-----------------------------------------------------------------------------------------
PARA CAMBIAR IMAGEN DE BOTON
------------------------------------------------------------------------------------------
*/

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}


//PAR DE FUNCIONES PARA MOSTRAR EL TOOLTIP
function ShowHelp(div, title, desc)
{
	div.style.display = 'inline';
	div.style.position = 'absolute';
	div.style.width = '160';
	div.style.backgroundColor = 'lightyellow';
	div.style.border = 'dashed 1px black';
	div.style.padding = '10px';
	div.innerHTML = '<b>' + title + '</b><br><img src=sitecenter_images/blank.gif widthth=1 height=5><br><div style="padding-left:10; padding-right:5">' + desc + '</div>';
}

function HideHelp(div)
{
	div.style.display = 'none';
}


function NewWindow(url,hauteur,largeur) {
var winl = (screen.width - largeur) / 2;
var wint = (screen.height - hauteur) / 2;
date_t = new Date;
time = date_t.getTime();
winprops = 'height='+hauteur+',width='+largeur+',top='+wint+' ,left='+winl+',scrollbars=1,resizable=0'
win = window.open(url, time, winprops)
}


/*
-----------------------------------------------------------------------------------------
SEGURIDAD PASSWORD
------------------------------------------------------------------------------------------
*/

var numeros="0123456789";
var letras="abcdefghyjklmnñopqrstuvwxyz";
var letras_mayusculas="ABCDEFGHYJKLMNÑOPQRSTUVWXYZ";

function tiene_numeros(texto){
   for(i=0; i<texto.length; i++){
      if (numeros.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function tiene_letras(texto){
   texto = texto.toLowerCase();
   for(i=0; i<texto.length; i++){
      if (letras.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function tiene_minusculas(texto){
   for(i=0; i<texto.length; i++){
      if (letras.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function tiene_mayusculas(texto){
   for(i=0; i<texto.length; i++){
      if (letras_mayusculas.indexOf(texto.charAt(i),0)!=-1){
         return 1;
      }
   }
   return 0;
} 

function seguridad_clave(clave){
	var seguridad = 0;
	if (clave.length!=0){
		if (tiene_numeros(clave) && tiene_letras(clave)){
			seguridad += 30;
		}
		if (tiene_minusculas(clave) && tiene_mayusculas(clave)){
			seguridad += 30;
		}
		if (clave.length >= 4 && clave.length <= 5){
			seguridad += 10;
		}else{
			if (clave.length >= 6 && clave.length <= 8){
				seguridad += 30;
			}else{
				if (clave.length > 8){
					seguridad += 40;
				}
			}
		}
	}
	return seguridad				
}	

function muestra_seguridad_clave(){
	seguridad=seguridad_clave(document.getElementById('ctl00_ContentPlaceHolder1_txtPasword').value);
    document.getElementById('ctl00_ContentPlaceHolder1_txtSeguridad').value="Seguridad: " + seguridad + "%";
	document.getElementById('ctl00_ContentPlaceHolder1_Pbar').src="images/PBar/" + seguridad + ".png";
}


//POP UP

function ventanaSecundaria (URL){ 
window.open(URL,"ventana1","width=500, height=350, scrollbars=no, menubar=no, location=no, resizable=no") 
} 

//Reloj

function show5(){
if (!document.layers&&!document.all&&!document.getElementById)
return

 var Digital=new Date()
 var hours=Digital.getHours()
 var minutes=Digital.getMinutes()
 var seconds=Digital.getSeconds()

var dn="p.m."
if (hours<12)
dn="a.m."
if (hours>12)
hours=hours-12
if (hours==0)
hours=12

 if (minutes<=9)
 minutes="0"+minutes
 if (seconds<=9)
 seconds="0"+seconds
//change font size here to your desire
myclock="<font size='5' face='Century gothic'><font size='1'>"+hours+":"+minutes+":"+seconds+" "+dn+"</font>"
if (document.layers){
document.layers.liveclock.document.write(myclock)
document.layers.liveclock.document.close()
}
else if (document.all)
liveclock.innerHTML=myclock
else if (document.getElementById)
document.getElementById("liveclock").innerHTML=myclock
setTimeout("show5()",1000)
 }
//window.onload=show5


function Valida_Busqueda(){
    Usr=Trim(document.getElementById('ctl00_ContentPlaceHolder1_txtNombre').value).length;
    Pass=Trim(document.getElementById('ctl00_ContentPlaceHolder1_txtAPaterno').value).length;
    if (Usr == 0){
        alert("Ingrese a menos una letra del Nombre");
        document.getElementById('ctl00_ContentPlaceHolder1_txtNombre').focus();
        return false;
    }
    if (Pass == 0){
        alert("Ingrese a menos una letra del A. Paterno");
        document.getElementById('ctl00_ContentPlaceHolder1_txtAPaterno').focus();
        return false;
    }
}

 function Verificar()
 {
  var tecla=window.event.keyCode;
  if (tecla==116) 
  {
    event.keyCode=0;
    event.returnValue=false;
  }
  if (tecla==80 && event.ctrlKey) 
  {
    event.keyCode=0;
    event.returnValue=false;
  }
}

function ModalPopupExtender1()
{
  window.open('MasivoPvcAux.aspx','','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=800, height=780');
 
}

//SCRIPT DE AUTOCOMPLETAR TEXTBOX

var _values = ["BLACKBERRY", "NOKIA", "LG", "IPHONE", "ZONDA", "SONY ERICSSON", "ALCATEL", "AVVIO", "DELL", "HTC", "HUAWEI", "MOBINNOVA", "PALM", "PANTECH", "SAMSUNG", "SKYZEN", "ZTE", "I-MOBIL", "IPHONE"]
for (i in _values)
var _lastValue='';
function replaceText(_v) {
  var _count = 0; 
  var _index = -1;
  var _str = "";
  var _tempArray = new Array();
  if (document.getElementById('ctl00_ContentPlaceHolder1_txtEquipoSugerido').value) _str = document.getElementById('ctl00_ContentPlaceHolder1_txtEquipoSugerido').value;
  if (_lastValue == _str)  return;
  if (_lastValue.length>_str.length) {_lastValue=_str;return;} 
  for (i in _values) {
    if (_values[i].indexOf(_str) == 0) {
	  _tempArray[_tempArray.length] = _values[i];
	  _count++;
	  _index = i;
	  }
  }
  if (_index >= 0 && _index < _values.length && _count>0) {
    if (_count == 1) {
	  _str = _values[_index];
	} else {
	  _str = _values[_index].substring(0,lenToUse(_tempArray));
	}
    document.getElementById('ctl00_ContentPlaceHolder1_txtEquipoSugerido').value=_str;
    _lastValue = _str;
  }
}


function lenToUse(_list) {
  var mismatchFound = false;
  var _return = 0;
  var _shortestLength = 99;
  for (i=0;i<_list.length;i++) {
	if (_list[i].length < _shortestLength)
	  _shortestLength = _list[i].length;
  }
  for (i=0;i<_shortestLength;i++) {
	_matchStr = _list[0].substring(i,i+1);
	for (j=1;j<_list.length;j++) {
	  if (_list[j].substring(i,i+1) != _matchStr) {
		if (!mismatchFound) 
		  _return = i-1; 
	    mismatchFound = true;
	  }
	}
    if (!mismatchFound) {
      _return = i;
    }
  }
  return (_return+1);
}

function compute(e) {
  document.getElementById('ctl00_ContentPlaceHolder1_txtEquipoSugerido').value = document.getElementById('ctl00_ContentPlaceHolder1_txtEquipoSugerido').value.toUpperCase();
  setTimeout('replaceText()',30);
}



//Con Nuxiba 5


function replaceText2(_v) {
  var _count = 0; 
  var _index = -1;
  var _str = "";
  var _tempArray = new Array();
  if (document.getElementById('txtEquipoSugerido').value) _str = document.getElementById('txtEquipoSugerido').value;
  if (_lastValue == _str)  return;
  if (_lastValue.length>_str.length) {_lastValue=_str;return;} 
  for (i in _values) {
    if (_values[i].indexOf(_str) == 0) {
	  _tempArray[_tempArray.length] = _values[i];
	  _count++;
	  _index = i;
	  }
  }
  if (_index >= 0 && _index < _values.length && _count>0) {
    if (_count == 1) {
	  _str = _values[_index];
	} else {
	  _str = _values[_index].substring(0,lenToUse(_tempArray));
	}
    document.getElementById('txtEquipoSugerido').value=_str;
    _lastValue = _str;
  }
}



function compute2(e) {
  document.getElementById('txtEquipoSugerido').value = document.getElementById('txtEquipoSugerido').value.toUpperCase();
  setTimeout('replaceText2()',30);
}