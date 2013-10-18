
var __pinpadFnPtr__ = null;

function transfer(section){
	parent.showLoading();
	window.location = (section + "/index.aspx");
}

function transferSection(section){
	parent.showLoading();
	window.location = (section);
}

function initialize(){
	try{
		if(LAYOUT_TITLE != null)
			parent.document.getElementById("layoutTitle").innerHTML = LAYOUT_TITLE;
		if(LAYOUT_ICON != null)
			parent.document.getElementById("cellIconLayout").background = LAYOUT_ICON;
	}catch(ex){}
	document.onselectstart = function () {return false;}
	parent.document.getElementById("helpIcon").style.display = "none";
	try{
		initializePage();
		
	}catch(e){}
	try{
		validateSesion();
	}catch(e){alert("Bad session object");}
	
	top.pinpad = new Object();
	top.pinpad.account = "";
	top.pinpad.cardHolderName = "";
	top.pinpad.track1 = "";
	
	
	
	parent.hideLoading();
}

function generalAjaxFailure(response){
	hidePopup();
	hideLoading();
	showPopup(response.get_message(), 1, noActionFn, null);
}

function swipeCardFn(){
	var status = top.sgRewards.SwipeCard();
	hidePopup();
	if(status == 1){
		top.pinpad.account = top.sgRewards.accountNumber;
		top.pinpad.track1 = top.sgRewards.accountNumber;
		top.pinpad.cardHolderName = "";
		document.getElementById("loyaltyAccount").value = top.pinpad.account;
		try{
			__pinpadFnPtr__();
		}catch(e){}
	}
}

function captureCardFromPinpad(onCardCaptured){
	try{
		if(top.usingPinpad){
			__pinpadFnPtr__ = onCardCaptured;
			showPopup("<br/><br/><span style=\"font-size:20px\">DESLIZAR TARJETA<br />DE LEALTAD<span>", 5, null, "swipeCardFn()",onCardCaptured);	
		}
	}catch(e){}
}

function captureCard(onCardCaptured){    
	if(top.user.profile == 6 && top.user.loyaltyAccount != ""){
		document.getElementById("loyaltyAccount").value = top.user.loyaltyAccount;
		try {
		    
		onCardCaptured();
		}catch(e){
		    
		}
	}else{
		//captureCardFromPinpad(onCardCaptured);
	}
}