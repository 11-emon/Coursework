
var fantomengine = new Object();

fantomengine.DeviceName=function(){
	return "";
};

fantomengine.Hardware=function(){
	return "";
};

fantomengine.Product=function(){
	return "";
};

fantomengine.Serial=function(){
	return "";
};

fantomengine.User=function(){
	return "";
};



fantomengine.GetBrowserName=function(){
//Based on code from here: h t t p://stackoverflow.com/questions/2400935/browser-detection-in-javascript
	var ret = "";
	if (navigator.userAgent.search("MSIE") >= 0){
	    ret = "MS Internet Explorer";
	}
	else if (navigator.userAgent.search("Chrome") >= 0){
	    ret = "Google Chrome";
	}
	else if (navigator.userAgent.search("Firefox") >= 0){
		ret = "Mozilla Firefox";
	}
	else if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0){
	    ret = "Apple Safari";
	}
	else if (navigator.userAgent.search("Opera") >= 0){
	    ret = "Opera";
	}
	else{
	    ret = "Other";
	}


	return ret;
};

fantomengine.GetBrowserVersion=function(){
	var ret = "";
	if (navigator.userAgent.search("MSIE") >= 0){
	    var position = navigator.userAgent.search("MSIE") + 5;
	    var end = navigator.userAgent.search("; Windows");
	    var version = navigator.userAgent.substring(position,end);
	    ret = version;
	}
	else if (navigator.userAgent.search("Chrome") >= 0){
	    var position = navigator.userAgent.search("Chrome") + 7;
	    var end = navigator.userAgent.search(" Safari");
	    var version = navigator.userAgent.substring(position,end);
	    ret = version;
	}
	else if (navigator.userAgent.search("Firefox") >= 0){
	    var position = navigator.userAgent.search("Firefox") + 8;
	    var version = navigator.userAgent.substring(position);
	    ret = version;
	}
	else if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0){//<< Here
	    var position = navigator.userAgent.search("Version") + 8;
	    var end = navigator.userAgent.search(" Safari");
	    var version = navigator.userAgent.substring(position,end);
	    ret = version;
	}
	else if (navigator.userAgent.search("Opera") >= 0){
	    var position = navigator.userAgent.search("Version") + 8;
	    var version = navigator.userAgent.substring(position);
	    ret = version;
	}
	else{
	    ret = "";
	}
	return ret;
};

fantomengine.GetBrowserPlatform=function(){
	return navigator.platform;
};
