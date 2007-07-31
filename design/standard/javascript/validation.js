function validate_all(form)
{
	var validationTypes = new Array("required","numeric", "email", "zip", "phone" );
	var classResults = new Array();
	// REQUIRED
	classResults = getElementsByClass("validate_required");
	var isError = false;
	if (classResults.length>0)
	{
		for (var i=0; i<classResults.length; i++)
		{
			if (!validate_required(classResults[i].value))
			{
				isError = true;
				show_error_message(classResults[i]);
			} else {
				hide_error_message(classResults[i]);
			}
		}
	}
	// NUMERIC
	classResults = getElementsByClass("validate_numeric");
	if (classResults.length>0)
	{
		for (var i=0; i<classResults.length; i++)
		{
			if (!validate_numeric(classResults[i].value))
			{
				isError = true;
				show_error_message(classResults[i]);
			} else {
				hide_error_message(classResults[i]);
			}
		}
	}
	// EMAIL
	classResults = getElementsByClass("validate_email");
	if (classResults.length>0)
	{
		for (var i=0; i<classResults.length; i++)
		{
			if (!validate_email(classResults[i].value))
			{
				isError = true;
				show_error_message(classResults[i]);
			} else {
				hide_error_message(classResults[i]);
			}
		}
	}
	// ZIP
	classResults = getElementsByClass("validate_zip");
	if (classResults.length>0)
	{
		for (var i=0; i<classResults.length; i++)
		{
			if (!validate_zip(classResults[i].value))
			{
				isError = true;
				show_error_message(classResults[i]);
			} else {
				hide_error_message(classResults[i]);
			}
		}
	}
	// PHONE
	classResults = getElementsByClass("validate_phone");
	if (classResults.length>0)
	{
		for (var i=0; i<classResults.length; i++)
		{
			if (!validate_phone(classResults[i].value))
			{
				isError = true;
				show_error_message(classResults[i]);
			} else {
				hide_error_message(classResults[i]);
			}
		}
	}
	
	// RADIO REQUIRED //
	var radioQuestionAnswered = false;
	if (typeof(attrOptionList) != "undefined")
	{
		for (var i=0; i<attrOptionList.length; i++)
		{
			eval("var radioEle = form.ContentObjectAttribute_data_option_value_"+attrOptionList[i]);
			if (!validate_radio_required(radioEle))
			{
				isError = true;
				document.getElementById(attrOptionList[i]+"pleaseanswer").style.display="block";
				document.getElementById(attrOptionList[i]+"optionlabel").className="option_text_error";
				document.getElementById(attrOptionList[i]+"optionsection").className="option_error";
			} else {
				var radioQuestionAnswered = true;
				document.getElementById(attrOptionList[i]+"pleaseanswer").style.display="none";
				document.getElementById(attrOptionList[i]+"optionlabel").className="option_text_answered";
				document.getElementById(attrOptionList[i]+"optionsection").className="option_answered";

				// show answered questions message
				// document.getElementById("topValidationMsgAnswered").style.display="block";
			}
		}

	}

	// show top message
	if (isError) {
		if (radioQuestionAnswered) document.getElementById("topValidationMsgAnswered").style.display="block";
		
		document.getElementById("topValidationMsg").style.display="block";
	    
		document.location.href="#top";
	}
	return (isError != true);
}

function AnswerQuestion(attr_id, ele)
{
        return;
        document.getElementById(attr_id+"pleaseanswer").style.display="none";
        document.getElementById(attr_id+"optionlabel").className="option_text_answered";
        document.getElementById(attr_id+"optionsection").className="option_answered";
        ele.onclick = null;
}

function show_error_message(ele)
{
	addClass(ele.parentNode, "option_error");
	document.getElementById(ele.name + "_error").style.display="block";
}

function hide_error_message(ele)
{
	removeClass(ele.parentNode, "option_error");
	document.getElementById(ele.name + "_error").style.display="none";
}
// you must set all base names in an array called requiredRadioNames
function validate_radio_required(radios)
{
	for (var k=0; k<radios.length; k++)
	{
		if (radios[k].checked)
		{
                        // show answered questions message
                        document.getElementById("topValidationMsgAnswered").style.display="block";

			return true;
		}
	}
	return false;
}

function GetRadioSelection(group) 
{ 
  for(var k=0;k<group.length;k++) { 
    if(group[k].checked) {  
       return group[k].value;
	}
  }
}

function validate_required(val)
{
	if (isSet(val) && val.trim() != "") {
		return true;
	}
	return false;
}

function validate_numeric(val) {
	if (isSet(val) && isNaN(val)) {
		return false;
	}
	return true;
}

function validate_min(val, min) {
	if (!isSet(val)) return false;
	return (val <= min);
}

function validate_max(val, max) {
	if (!isSet(val)) return false;
	return (val >= max);
}

// regular expressions from jsVal http://jsval.fantastic-bits.de/
function validate_zip(val) {
	if (!isSet(val)) return false;
	if (5 == val.length) {
		return((/^\d{5}$/).test(val));
	} else if (10 == val.length) {
		return((/^\d{5}(\-\d{4})?$/).test(val));
	}
	return false;
}

// regular expression from jsVal http://jsval.fantastic-bits.de/
function validate_email(val) {
	if (!isSet(val)) return false;
	return((/^[a-zA-ZüöäßÄÖÜ]+([\.-]?[a-zA-ZüöäßÄÖÜ]+)*@[a-zA-ZüöäßÄÖÜ]+([\.-]?[a-zA-ZüöäßÄÖÜ]+)*(\.\w{2,5})+$/).test(val));
}

// regular expression from jsVal http://jsval.fantastic-bits.de/
// use the regex when you are ready to do better validation
function validate_phone(val) {
	if (!isSet(val)) return false;
	return (val.length >= 10);
	//return((/^1?[\-]?\(?\d{3}\)?[\-]?\d{3}[\-]?\d{4}$/).test(val));
}
function isSet(val)
{
	return (typeof(val) != "undefined");
}
// Modified from http://www.evolt.org/article/rating/17/24700/
function validate_credit_card(cardNumber, cardType)
{
  var isValid = false;
  var ccCheckRegExp = /[^\d ]/;
  isValid = !ccCheckRegExp.test(cardNumber);

  if (isValid)
  {
    var cardNumbersOnly = cardNumber.replace(/ /g,"");
    var cardNumberLength = cardNumbersOnly.length;
    var lengthIsValid = false;
    var prefixIsValid = false;
    var prefixRegExp;

    switch(cardType)
    {
      case "mastercard":
        lengthIsValid = (cardNumberLength == 16);
        prefixRegExp = /^5[1-5]/;
        break;

      case "visa":
        lengthIsValid = (cardNumberLength == 16 || cardNumberLength == 13);
        prefixRegExp = /^4/;
        break;

      case "amex":
        lengthIsValid = (cardNumberLength == 15);
        prefixRegExp = /^3(4|7)/;
        break;

      default:
        prefixRegExp = /^$/;
        alert("Card type not found");
    }

    prefixIsValid = prefixRegExp.test(cardNumbersOnly);
    isValid = prefixIsValid && lengthIsValid;
  }

  if (isValid)
  {
    var numberProduct;
    var numberProductDigitIndex;
    var checkSumTotal = 0;

    for (digitCounter = cardNumberLength - 1; 
      digitCounter >= 0; 
      digitCounter--)
    {
      checkSumTotal += parseInt (cardNumbersOnly.charAt(digitCounter));
      digitCounter--;
      numberProduct = String((cardNumbersOnly.charAt(digitCounter) * 2));
      for (var productDigitCounter = 0;
        productDigitCounter < numberProduct.length; 
        productDigitCounter++)
      {
        checkSumTotal += 
          parseInt(numberProduct.charAt(productDigitCounter));
      }
    }

    isValid = (checkSumTotal % 10 == 0);
  }

  return isValid;
}

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}
String.prototype.ltrim = function() {
	return this.replace(/^\s+/,"");
}
String.prototype.rtrim = function() {
	return this.replace(/\s+$/,"");
}
