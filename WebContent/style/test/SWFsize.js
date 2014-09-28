function scrollMenu(obj_style) {
var flag = 0;	
	var obj = document.getElementById("gnb_flash");
	obj.style.width = "980px";

	if (Number(obj_style)==0) {		
			obj.style.height = "115px";
	} else { obj.style.height = "490px"; }
}
function sizeTo(lnbheight)
{
	if( lnbheight === "NAN" )
		return;

	var lnb_div = document.getElementById("lnb_flash");
	if( !lnb_div) return;
	lnb_div.style.height = lnbheight + "px";
	
	var swf_obj = document.getElementById("lnbSrc_1");
	if( !swf_obj)
		return;
	if( navigator.userAgent.indexOf('Opera') > -1 ) { // only opera~
		setTimeout(function() {	
			swf_obj.style.height = lnbheight + "px";
		}, 500);
	}else {
		swf_obj.style.height = lnbheight + "px";
	}
}