function insertAfter(parent, node, referenceNode) {
	parent.insertBefore(node, referenceNode.nextSibling);
}

function ge(ele) {
	if (typeof ele == "object")
	{
		return ele;
	}
	return document.getElementById(ele);
}
function FilterNumericInput(phoneInput) {
	phoneInput.value = RemoveAllNonNumeric(phoneInput.value);
}
function FilterZipInput(zipInput) {
	var newInput = RemoveAllNonNumeric(zipInput.value);
	if (newInput.length>5) {
		newInput = newInput.substr( 0,5) + '-' + newInput.substr( 5, newInput.length);
	}
	zipInput.value = newInput;
}
function RemoveAllNonNumeric(str) {
	var ret = '';
	for (i = 0; i <= str.length; i++) {
		if (!isNaN(str.charAt(i)) && str.charAt(i) !=' ') {
			ret += str.charAt(i);
		}
	}
	return ret;
}
function EnableInput(ele) {
	ele.disabled = false;
}
function AnswerQuestion(attr_id, ele)
{
	return true;
	document.getElementById(attr_id+"pleaseanswer").style.display="none";
	document.getElementById(attr_id+"optionlabel").className="option_text_answered";
	document.getElementById(attr_id+"optionsection").className="option_answered";
	ele.onclick = null;
}

function hasClass(ele,cls) {
	return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
}

function addClass(ele,cls) {
	if (!this.hasClass(ele,cls)) {
		ele.className += " "+cls;
		//alert("added: " + ele.id + " className: " + ele.className);
	}
}

function removeClass(ele,cls) {
	if (hasClass(ele,cls)) {
		var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
		//alert("before: id: " + ele.id + " className: " + ele.className);
		ele.className=ele.className.replace(reg,' ');
		//alert("after: id: " + ele.id + " className: " + ele.className);
	}
}
// from - http://www.dustindiaz.com/getelementsbyclass/
function getElementsByClass(searchClass,node,tag) {
	var classElements = new Array();
	if ( node == null )
		node = document;
	if ( tag == null )
		tag = '*';
	var els = node.getElementsByTagName(tag);
	var elsLen = els.length;
	var pattern = new RegExp("(^|\\s)"+searchClass+"(\\s|$)");
	for (i = 0, j = 0; i < elsLen; i++) {
		if ( pattern.test(els[i].className) ) {
			classElements[j] = els[i];
			j++;
		}
	}
	return classElements;
}