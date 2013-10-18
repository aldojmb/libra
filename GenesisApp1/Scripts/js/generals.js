var isIE = true;

function trim(str) {
    var firstChar = -1, lastChar = 0;

    for (var i = 0; i < str.length; i++) {
        if (str.charAt(i) != " ") {
            if (firstChar == -1)
                firstChar = i;
            lastChar = i + 1;
        }
    }

    return firstChar >= 0 && lastChar > firstChar ? str.substring(firstChar, lastChar) : "";
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function isMonth(month) {
    if (month.value > 12) {
        showPopup("El campo  Mes <br/>debe tener un valor menor a 12", 1, onHideErrorMsg, null, month);
        month.value = "";
    }
    else {
        return true;
    }
}

function isValidEntryFull(evt) {
    Values = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz .-()@#$%,./*-+:ÁÉÍÓÚáéíóú";
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (Values.indexOf(String.fromCharCode(charCode).toUpperCase()) < 0 && charCode != 13) {
        return false;
    }
    return true;
}

function isAlphaKey(evt) {
    Values = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚáéíóú ";
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (Values.indexOf(String.fromCharCode(charCode).toUpperCase()) < 0 && charCode != 13) {
        return false;
    }
    return true;
}

function isAlphaNumeric(evt) {
    Values = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789";
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (Values.indexOf(String.fromCharCode(charCode).toUpperCase()) < 0 && charCode != 13) {
        return false;
    }
    return true;
}

function isValidEntry(evt) {
    Values = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz .-()@#$%,./-+:_";
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (Values.indexOf(String.fromCharCode(charCode).toUpperCase()) < 0 && charCode != 13) {
        return false;
    }
    return true;
}

function isValidReferenceEntry(evt) {
    Values = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz-_";
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (Values.indexOf(String.fromCharCode(charCode).toUpperCase()) < 0 && charCode != 13) {
        return false;
    }
    return true;
}

function onHideErrorMsg(control) {
    control.focus();
}

function validateRequiredInput(control, fieldName) {
    var success = true;

    if (control.value == "") {
        showPopup("El campo " + fieldName + "<br/>debe tener un valor", 1, onHideErrorMsg, null, control);
        success = false;
    }

    return success;
}

function isDecimalKey(evt, inputBox) {
    var charCode = (evt.which) ? evt.which : event.keyCode

    if (inputBox.dots == 1 && inputBox.value.indexOf(".") == -1)
        inputBox.dots = 0;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        if (charCode == 46 && (inputBox.dots == null || inputBox.dots == 0))
        inputBox.dots = 1;
    else
        return false;

    return true;
}

function key_pressed(e) {
    var evt = typeof window.event != 'undefined' ? window.event : e;
    var val = evt.keyCode == 86;

    if (evt.ctrlKey && val) {
        if (evt.stopPropagation) {
            evt.preventDefault();
            evt.stopPropagation();
        } else {
            evt.cancleBubble = true;
            evt.returnValue = false;
        }
    }
}

function noContextualMenu(e) {
    if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)) {
        return false;
    }

    else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2)) {
        return false;
    }
}

function validaDIGVerificador(cuenta) {
    lon = cuenta.length;
    var ult = lon - 1;
    var digito = cuenta.substring(lon - 1, lon);
    var va1 = 0;
    var va2 = 0;
    var mul = 0;
    var j = ult - 1;
    var valor = 0;
    for (i = 0; i < ult; i++) {
        if (valor == 1)
            va1 = va1 + parseInt(cuenta.substring(j, j + 1), 10);
        if (valor == 0) {
            mul = parseInt(cuenta.substring(j, j + 1), 10) * 2;
            if (mul > 9)
                mul = mul - 9;

            va2 = va2 + mul;
        }
        j--; // = j - 2 ;
        if (valor == 0)
            valor = 1;
        else
            valor = 0;
    }
    var mult = 10;
    var sum = va1 + va2;
    for (i = 1; i < 10; i++) {
        if (mult < sum)
            mult = mult + 10;
        else
            break;
    }
    var digitoC = mult - (va1 + va2);
    var digitoO = parseInt(digito, 10);
    if (digitoC == 10)
        digitoC = 0;
    if (digitoO != digitoC)  // digito verificador incorrecto
        return (5)
    else {
        return (0);
    }
}



function FormatAmtControl(ctl) {
    var vMask;
    var vDecimalAfterPeriod;
    var ctlVal;
    var iPeriodPos;
    var sTemp;
    var iMaxLen
    var ctlVal;
    var tempVal;
    ctlVal = ctl.value;
    vDecimalAfterPeriod = 2
    iMaxLen = ctl.maxLength;

    if (isNaN(ctlVal)) {
        ctl.value = ""
    } else {
        ctlVal = ctl.value;
        iPeriodPos = ctlVal.indexOf(".");
        if (iPeriodPos < 0) {
            //if (ctl.value.length > (iMaxLen-3)){
            /*sTemp = ctl.value
            tempVal = sTemp.substr(0,(iMaxLen-3)) + ".00";*/
            tempVal = ctl.value + ".00";
            /*}else
            sTemp = ctl.value
            if (sTemp.length<=2){
            if (sTemp.length==0){
            sTemp = sTemp+"000";
            }else if (sTemp.length==1){
            sTemp = sTemp+"00";
            }else if (sTemp.length==2){
            sTemp = sTemp+"00";
            }
            }
            ctlVal = sTemp.substr(0,(sTemp.length-2)) + "."+sTemp.substr(sTemp.length-2,sTemp.length);*/
            //tempVal = ctlVal + ".00"
            ctlVal = tempVal;
        }
        iPeriodPos = ctlVal.indexOf(".");
        if (iPeriodPos >= 0) {
            if (iPeriodPos == 0) {
                if (ctlVal.length < 3) {
                    tempVal = "0" + ctlVal + "0"
                } else {
                    tempVal = "0" + ctlVal;
                }
            } else if ((ctlVal.length - iPeriodPos - 1) == 0)
                tempVal = ctlVal + "00"
            else if ((ctlVal.length - iPeriodPos - 1) == 1)
                tempVal = ctlVal + "0"
            else if ((ctlVal.length - iPeriodPos - 1) == 2)
                tempVal = ctlVal;
            else if ((ctlVal.length - iPeriodPos - 1) > 2) {
                tempVal = ctlVal.substring(0, iPeriodPos + 3);
            }
        }
        ctl.value = tempVal;
    }
}


function HandleAmountFiltering(ctl) {

    try {
        var iKeyCode, objInput;
        var iMaxLen
        var reValidChars = /[0-9.]/;
        var strKey;
        var sValue;
        var evnt = window.event || this.event || arguments.callee.caller.arguments[0];
        iMaxLen = ctl.maxLength;
        sValue = ctl.value;

        if (isIE) {
            iKeyCode = evnt.keyCode;
            objInput = evnt.srcElement;
        } else {
            iKeyCode = evnt.which;
            objInput = evnt.target;
        }

        strKey = String.fromCharCode(iKeyCode);
        if (reValidChars.test(strKey)) {
            if (iKeyCode == 46) {
                if (objInput.value.indexOf('.') != -1 && !testControlSelected) {
                    if (isIE) {
                        evnt.keyCode = 0;
                    } else {
                        if (evnt.which != 0 && evnt.which != 8)
                            return false;
                    }
                }
            } else {
                if (objInput.value.indexOf('.') == -1) {
                    if (objInput.value.length >= (iMaxLen - 3)) {
                        if (isIE) {
                            evnt.keyCode = 0;
                        } else {
                            if (evnt.which != 0 && evnt.which != 8)
                                return false;
                        }
                    }
                }
                if ((objInput.value.length == (iMaxLen - 3)) && (objInput.value.indexOf('.') == -1)) {
                    objInput.value = objInput.value + '.';
                }
            }
        } else {
            if (iKeyCode != 13) {
                if (isIE) {
                    evnt.keyCode = 0;
                } else {
                    if (evnt.which != 0 && evnt.which != 8)
                        return false;
                }
            }
        }

        testControlSelected = false;
    } catch (e) {
        return true;
    }
}

function wasSelected() {
    testControlSelected = true;
}

function checkEmail(emailValue) {
    var s = emailValue;
    var filter = /^[A-Za-z][A-Za-z0-9_.]*@[A-Za-z0-9_]+\.[A-Za-z0-9_.]+[A-za-z]$/;
    if (s.length == 0)
        return true;
    if (filter.test(s))
        return true;

    return false;
}


String.prototype.trim = function() { return this.replace(/^\s+|\s+$/, ''); }

