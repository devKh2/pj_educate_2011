
/////////////////////////////LOGIN///////////////////
function loginChange(obj){
	if(obj.value == "mega"){
		BASE.$("JsMegaUser").style.display = "block";
		BASE.$("JsFreeUser").style.display = "none";
	}else{
		BASE.$("JsMegaUser").style.display = "none";
		BASE.$("JsFreeUser").style.display = "block";
	}
}
function joinType(id){
	var obj = BASE.$(id);
	if(obj.style.display=="none"){
		obj.style.display = "block";
	}else{
		obj.style.display = "none";
	}
}
function f_logout_dc(){
	if(getCookie("logout_today") == ""){
		var today = new Date();
		today.setDate(today.getDate() + 1);
		setCookie("logout_today", "1", today);
		//layerView('logout_div_dc');
	}else{
		document.location.href = "http://zone.olleh.com/common/logoutAuth.zone";
	}
}	
function getCookie(Name) {
	var search = Name + "="
  	if (document.cookie.length > 0) { // ��Ű�� �����Ǿ� �ִٸ�
    	offset = document.cookie.indexOf(search)
    	if (offset != -1) { // ��Ű�� �����ϸ�
      		offset += search.length
		    // set index of beginning of value
      		end = document.cookie.indexOf(";", offset)
      		// ��Ű ���� ������ ��ġ �ε��� ��ȣ ����
      		if (end == -1)
        		end = document.cookie.length
      		return unescape(document.cookie.substring(offset, end))
    	}
  	}
  	return "";
}

function setCookie (name, value, expires) {
  document.cookie = name + "=" + escape (value) + "; path=/; domain=zone.olleh.com; expires=" + expires.toGMTString(); //cookieDomainModify by jini 2009.12.11
}

function setCookieToday(name, value)
{	
	var today = new Date();
	today.setDate(today.getDate() + 1);
	today.setHours(0);
	today.setMinutes(0);
	today.setSeconds(0);	
	document.cookie = name + "=" + escape(value) + "; expires="+ today.toGMTString() + "; path=/; domain=" + "zone.olleh.com" + ";"; //cookieDomainModify by jini 2009.12.11
}

function setCookieHour(name, value)
{	
	var today = new Date();
	today.setHours(today.getHours() + 1);
	document.cookie = name + "=" + escape(value) + "; expires="+ today.toGMTString() + "; path=/; domain=" + "zone.olleh.com" + ";"; //cookieDomainModify by jini 2009.12.11
}


function saveid(form) {
  var expdate = new Date();
  // �⺻������ 30�ϵ��� ����ϰ� ��. �ϼ��� �����Ϸ��� * 30���� ���ڸ� �����ϸ� ��
  if (form.checksaveid.checked){
    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30��
    //alert('cookie create!');
  } else {
    expdate.setTime(expdate.getTime() - 1); // ��Ű ��������
    //alert('cookie delete!');
  }
  
  setCookie("saveid", document.frmLoginAuth.ktloginid.value, expdate);
}

function saveEmailid(form) {
  var expdate = new Date();
  // �⺻������ 30�ϵ��� ����ϰ� ��. �ϼ��� �����Ϸ��� * 30���� ���ڸ� �����ϸ� ��
  if (form.checksaveEmailid.checked)
    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30��
  else
    expdate.setTime(expdate.getTime() - 1); // ��Ű ��������
  setCookie("saveEmailid", document.frmLoginAuth.freeloginid.value, expdate);
}

function goLogin_kt(){
	var objForm = document.frmLoginAuth;
	
	//alert('new');
	if( objForm!=null  ){
				
		if(objForm.ktloginid.value == ""){
			alert("QOOK ID�� �Է��ϼ���!");
			objForm.ktloginid.focus();
			return;
		}
		
		if(!validString(objForm.ktloginid.value, 'ID')){
			alert("���̵�� �����ڸ� �Է� ���� �մϴ�.");
			objForm.ktloginid.focus();
			return;
		}
		
		objForm.loginid.value = objForm.ktloginid.value;
					
	
		if(objForm.ktpassword.value == ""){
			alert("��й�ȣ�� �Է��ϼ���!");
			objForm.ktpassword.focus();
			return;
		}
		alert("kt�α��οϷ�");
		
		// if( objForm.checksaveid.checked ) saveid(objForm);
		
		//var wbSurl = document.location.href;
		//var kturl = "http://zone.olleh.com/common/login_auth.html?wbSurl="+wbSurl+"&method=mzLogin&wbResult=Y&wbCoop=megazone&okurl=";
		//var ktfailurl = "http://zone.olleh.com/common/login_form.html?wbSurl="+wbSurl+"&method=mzLogin&wbResult=N&wbCoop=megazone&okurl=";
		//
		//kturl = "http://zone.olleh.com/common/login_bridge.html?bridgeURL="+Url.encode(kturl);
		//ktfailurl = "http://zone.olleh.com/common/login_bridge.html?bridgeURL="+Url.encode(ktfailurl);
		
		//objForm.kturl.value = kturl;
		//objForm.ktfailurl.value = ktfailurl;
		//objForm.submit();
	}else{
		alert('�α��� Form�� ���ų� 1�� �̻��Դϴ�.');
	}	
}	

function goLogin_free(){
	var objForm = document.frmLoginAuth;
	
	//alert('new');
	if( objForm!=null  ){
				
		if(objForm.freeloginid.value == ""){
			alert("�̸��� ID�� �Է��ϼ���!");
			objForm.freeloginid.focus();
			return;
		}
		
		if(!validString(objForm.freeloginid.value, 'ID')){
			alert("���̵�� �����ڸ� �Է� ���� �մϴ�.");
			objForm.freeloginid.focus();
			return;
		}
		
		objForm.loginEmailid.value = objForm.freeloginid.value;
					
	
		if(objForm.freepassword.value == ""){
			alert("��й�ȣ�� �Է��ϼ���!");
			objForm.freepassword.focus();
			return;
		}
		alert("free�α��οϷ�");
		
		// if( objForm.checksaveEmailid.checked ) saveEmailid(objForm);
		
		//var wbSurl = document.location.href;
		//var kturl = "http://zone.olleh.com/common/login_auth.html?wbSurl="+wbSurl+"&method=mzLogin&wbResult=Y&wbCoop=megazone&okurl=";
		//var ktfailurl = "http://zone.olleh.com/common/login_form.html?wbSurl="+wbSurl+"&method=mzLogin&wbResult=N&wbCoop=megazone&okurl=";
		//
		//kturl = "http://zone.olleh.com/common/login_bridge.html?bridgeURL="+Url.encode(kturl);
		//ktfailurl = "http://zone.olleh.com/common/login_bridge.html?bridgeURL="+Url.encode(ktfailurl);
		
		//objForm.kturl.value = kturl;
		//objForm.ktfailurl.value = ktfailurl;
		//objForm.submit();
	}else{
		alert('�α��� Form�� ���ų� 1�� �̻��Դϴ�.');
	}	
}	


function validString(String, type) {

   	var RetValue = true;
   	var Count;
   
   	var IDPermitChar = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-';
   	var PWPermitChar = '01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()[]?/+-{}.<>';
	var PermitChar;
   
	if(type == 'ID'){
   
		PermitChar = IDPermitChar;
	}else{
		PermitChar = PWPermitChar;
	}
	

   if (IsEmpty(String)){
		return false;
   }

   for (var i = 0; i < String.length; i++) {
      Count = 0;
      for (var j = 0; j < PermitChar.length; j++) {
         if(String.charAt(i) == PermitChar.charAt(j)) {
            Count++;
            break;
         }
      }

      if (Count == 0) {
         RetValue = false;
         break;
      }
   }
   return RetValue;
}

function IsEmpty(String) {

   return !CheckValid(String, false);
}

function CheckValid(String, SpaceCheck) {

   var retvalue = false;

   for (var i=0; i<String.length; i++) {

      if (SpaceCheck == true) {
         if (String.charAt(i) == ' ') {
            retvalue = true;
            break;
         }
      } else {
         if (String.charAt(i) != ' ') {
            retvalue = true;
            break;
         }
      }
   }

   return retvalue;
}


	function getSecToTimeFormat(sec){
		var retStr = "";
		sec = parseInt(sec);
		if(sec > (60*60)){
			retStr = retStr + Math.floor(sec / (60*60)) + "�ð� ";
			sec = sec % (60*60);
		}
		if(sec > (60)){
			retStr = retStr + Math.floor(sec / 60) + "�� ";
			sec = sec % 60;
		}
		retStr = retStr + sec + "��";
		return retStr;
	}
///////////////////////////////////////////////////////////////////////////////////////////////////
function getBrowserType(){
	var browserType = navigator.userAgent;
	
	if ( browserType.indexOf( 'MSIE' ) >= 0 ) {
		return "MS";
	}
	else if (browserType.indexOf( 'Firefox' )>= 0 ) {
		return "FOX";
	}
	else if (browserType.indexOf( 'Safari' )>= 0 ) {
		return "SF";
	}
	else {
		return "UD";
	}
}

function isRightVer(type){
	retType= getBrowserType();
	if( type == retType ){
		return true;
	}else{
		return false;
	}
}

function moveElementPosition(layerId, leftMovePositionSize, rightMovePositionSize ){
	
	if( isRightVer('MS') ){
		GMessageLayerPosX = mPosiX + document.body.scrollLeft + document.documentElement.scrollLeft;
		GMessageLayerPosY = mPosiY + document.body.scrollTop + document.documentElement.scrollTop;
	}else {
//		GMessageLayerPosX = mPosiX + document.body.scrollLeft;
//		GMessageLayerPosY = mPosiY + document.body.scrollTop;
		GMessageLayerPosX = mPosiX
		GMessageLayerPosY = mPosiY
	}
	
	
	var lvalue = GMessageLayerPosX + leftMovePositionSize < 0 ? 0 :  GMessageLayerPosX + leftMovePositionSize;
	var tvalue = GMessageLayerPosY + rightMovePositionSize < 0 ? 0 : GMessageLayerPosY + rightMovePositionSize;

	document.getElementById(layerId).style.left = lvalue+'px'; 
	document.getElementById(layerId).style.top = tvalue+'px';

	if(document.getElementById(layerId).style.left < 0) document.getElementById(layerId).style.left = 0+'px';
	if(document.getElementById(layerId).style.top < 0) document.getElementById(layerId).style.top = 0+'px';
}


function open_layer(layerId, left, right){
	moveElementPosition(layerId, left, right);
	document.getElementById(layerId).style.display = "block";
}
function close_layer(layerId){
	document.getElementById(layerId).style.left = '10000px'; 
	document.getElementById(layerId).style.top = '10000px';
	document.getElementById(layerId).style.display = "none";
}
function open_layer_fix(layerId){
	document.getElementById(layerId).style.display = "block";
}
function close_layer_fix(layerId){
	document.getElementById(layerId).style.display = "none";
}

// Flicker Bug Fix
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}

function flashWrite(url,w,h,id,bg,vars,win){
	var flashStr=
	"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+id+"' align='middle'>"+
	"<param name='allowScriptAccess' value='sameDomain' />"+
	"<param name='movie' value='"+url+"' />"+
	"<param name='FlashVars' value='"+vars+"' />"+
	"<param name='wmode' value='"+win+"' />"+
	"<param name='menu' value='false' />"+
	"<param name='quality' value='high' />"+
	"<param name='bgcolor' value='"+bg+"' />"+
	"<embed src='"+url+"' FlashVars='"+vars+"' wmode='"+win+"' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' name='"+id+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />"+
	"</object>";
	document.write(flashStr);
}

function flashWriteDummy(url,w,h,id,bg,vars,win){
	url += url.indexOf("?")>-1 ? "&" : "?" ;
	url += "dummytime="+(new Date()).getTime();
	var flashStr=
	"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+id+"' align='middle'>"+
	"<param name='allowScriptAccess' value='sameDomain' />"+
	"<param name='movie' value='"+url+"' />"+
	"<param name='FlashVars' value='"+vars+"' />"+
	"<param name='wmode' value='"+win+"' />"+
	"<param name='menu' value='false' />"+
	"<param name='quality' value='high' />"+
	"<param name='bgcolor' value='"+bg+"' />"+
	"<embed src='"+url+"' FlashVars='"+vars+"' wmode='"+win+"' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' name='"+id+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />"+
	"</object>";
	document.write(flashStr);
}

function loadingSadari(id, path, flag, width, height)
{
	 document.write("<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,124,0\" id=\"" + id + "\" width=\"" + width + "\" height=\"" + height + "\" align=\"middle\">"
	+ " <param name=\"movie\" value=\"" + path + ".swf?flag=" + flag + "\" />"
	+ " <param name=\"bgcolor\" value=\"#FFFFFF\" />"
	+ " <param name=\"wmode\" value=\"transparent\" />"
	+ " <param name=\"loop\" value=\"false\" />"
	+ " <param name=\"menu\" value=\"false\" />"
	+ " <param name=\"quality\" value=\"high\" />"
	+ " <param name=\"scale\" value=\"noscale\" />"
	+ " <param name=\"allowScriptAccess\" value=\"sameDomain\" />"
	+ " <embed width=" + width  + " height=" + height + " src=\"" + path + ".swf?flag=" + flag + "\" bgcolor=\"#FFFFFF\" loop=\"false\" menu=\"false\" quality=\"high\" scale=\"noscale\" allowScriptAccess=\"sameDomain\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" />"
	+ "</object>");
	//document.getElementById("gababoGame").innerHTML = text;
}

//activeX name ���� �� �÷���
function flash_name(url, width, height, name){
	document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+width+'" height="'+height+'" id="PhotoGallery_2005" align="middle">'
	+'<param name="allowScriptAccess" value="sameDomain">'
	+'<param name="movie" value="'+url+'">'
	+'<param name="quality" value="high">'
	+'<param name="bgcolor" value="#ffffff">'
	+'<embed src="'+url+'" quality="high" bgcolor="#ffffff" width="'+width+'" height="'+height+'" name="'+name+'" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">'
	+'</object>');
}

function loadingBluemarble( id, ranking, chip, mul) {

	if (AC_FL_RunContent == 0) {
		alert("�� ���������� AC_RunActiveContent.js�� �ʿ��մϴ�.");
	} 
	
	document.write("\
	<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,124,0' width='640' height='480' id='bluemarble' align='middle'>\
	<param name='allowScriptAccess' value='sameDomain' />\
	<param name='allowFullScreen' value='false' />\
	<param name='movie' value='/flash/game/bluemarble/bluemarble.swf?RANK="+ranking+"&CHIP="+chip+"&MUL="+mul+"' />\
	<param name='quality' value='high' />\
	<param name='bgcolor' value='#ffffff' />\
	<param name='wmode' value='opaque'>\
	<embed src='/flash/game/bluemarble/bluemarble.swf' quality='high' bgcolor='#ffffff' wmode='opaque' width='640' height='480' name='bluemarble' align='middle' allowScriptAccess='sameDomain' allowFullScreen='false' type='application/x-shockwave-flash' swLiveConnect='true' pluginspage='http://www.macromedia.com/go/getflashplayer' />\
	</object>\
	");

}
function loadingBluemarbleNew( id, ranking, chip, mul) {

	if (AC_FL_RunContent == 0) {
		alert("�� ���������� AC_RunActiveContent.js�� �ʿ��մϴ�.");
	} 
	
	document.write("\
	<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,124,0' width='640' height='480' id='bluemarble' align='middle'>\
	<param name='allowScriptAccess' value='sameDomain' />\
	<param name='allowFullScreen' value='false' />\
	<param name='movie' value='/flash/game/bluemarble/bluemarble_qz.swf?RANK="+ranking+"&CHIP="+chip+"&MUL="+mul+"' />\
	<param name='quality' value='high' />\
	<param name='bgcolor' value='#ffffff' />\
	<param name='wmode' value='opaque'>\
	<embed src='/flash/game/bluemarble/bluemarble_qz.swf' quality='high' bgcolor='#ffffff' wmode='opaque' width='640' height='480' name='bluemarble' align='middle' allowScriptAccess='sameDomain' allowFullScreen='false' type='application/x-shockwave-flash' swLiveConnect='true' pluginspage='http://www.macromedia.com/go/getflashplayer' />\
	</object>\
	");

}
function setPng24(obj) {
    obj.width=obj.height=1;
    obj.className=obj.className.replace(/\bcPng24\b/i,'');
    obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src + "',sizingMethod='image');"
    obj.src='';
    return '';
}

function isNull(val){
	if(val.length+1 == val.split(" ").length){		
		return true;
   	}
   	return false;
}

function isNum(val){
	if(val=="") return false;
	var tempstr = "0123456789";
	for(var i=0; i<val.length; i++){
		if(tempstr.indexOf(val.charAt(i))==-1){
			return false;
		}
	}
	return true;
}

function isChar(val){
	tempstr = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	for(i=0; i<val.length; i++){
		if(tempstr.indexOf(val.charAt(i)) == -1) return false;
	}
	return true;
}

function isEmail(val){
	tempstr = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-@.";
	str1cnt = 0;
	str2cnt = 0;
	for(i=0;i<val.length;i++){ 
		if(tempstr.indexOf(val.charAt(i)) == -1) return false;
       	if(val.charAt(i) == '@') str1cnt += 1;
       	if(val.charAt(i) == '.') str2cnt += 1;
	}
	if(str2cnt < 1 || str2cnt > 4) return false;
	return true;
}

function getScriptPagingStrForAjax(START_PAGE, END_PAGE, CURR_PAGE, PAGE_GROUP_SIZE, TOT_PAGE_CNT, HOME_IMG){
	var pagingStr = "";

	pagingStr = pagingStr + '						<div class="cPaging">';
													if(START_PAGE == 1) {

													}else{
	pagingStr = pagingStr + '							<a class="prev" href="javascript:;" onClick="goAjaxPage(\''+ (START_PAGE - PAGE_GROUP_SIZE) +'\');"><img src="'+HOME_IMG+'/common/bt_pprev.gif" alt="����" /></a>';
													}	
	
													for (i = START_PAGE; i <= END_PAGE; i++){
														if(i <= END_PAGE){
															if(i==1){
																if(i == CURR_PAGE){
		pagingStr = pagingStr + '										<strong class="first-child">'+i+'</strong>';															
																}else{
		pagingStr = pagingStr + '										<a href="javascript:;" onClick="goAjaxPage(\''+ i +'\')"  class="first-child">' + i + '</a>';															
																}
																
															}else{
																if(i == CURR_PAGE){
		pagingStr = pagingStr + '										<strong>'+i+'</strong>';															
																}else{
		pagingStr = pagingStr + '										<a href="javascript:;" onClick="goAjaxPage(\''+ i +'\')">' + i + '</a>';															
																}
															}
														}
													}
													
													if(END_PAGE == TOT_PAGE_CNT){
																
													}else{
		pagingStr = pagingStr + '						<a class="next" href="javascript:;" onClick="goAjaxPage(\''+ (START_PAGE + PAGE_GROUP_SIZE) +'\')"><img src="'+ HOME_IMG +'/common/bt_pnext.gif" alt="����" /></a>';
													}

	return pagingStr;

}

function lnbDisplay(type){
	var obj = BASE.$("secondaryBlock");
	if(type){obj.className="lnbOver";}
	else{obj.className="";}
}
function setSwfHeight(h){
	BASE.$("lnb").style.height = h+"px";
	BASE.$("lnb").getElementsByTagName("EMBED")[0].style.height = h+"px";
}
function openMyMenu(){
//	BASE.$("myMenu").style.display = "block";
	mymenumain();
}
function closeMyMenuJs(){
	BASE.$("myMenu").style.display = "none";
	//sendToActionScript(0,"gnb_logo");
}
function sendToActionScript(value, flashId) {
     thisMovie(flashId).closeMyMenu();//openMyMenu
}
function thisMovie(movieName) {
     if (navigator.appName.indexOf("Microsoft") != -1) {
         return window[movieName];
     } else {
         return document[movieName];
     }
}
function getHost(){
	var curr_url = document.location.href;
	var pos = curr_url.indexOf("http://");
	var pos2 = curr_url.indexOf("qook.co.kr")+12;	
	if(pos > -1) pos += 7;
	var ret_url = curr_url.substring(pos, pos2);
}

function popupNOAD(){
	var win = window.open('http://pccarecp.zone.olleh.com/megazone/callnoadc.asp', 'tNOAD', 'width=800,height=600,menubar=yes,toolbars=yes,scrolling=yes');
	if(win) win.focus();
}

function getByteLength( inStr ){
	var len =0;
	var str = inStr.substring(0);
	if( str==null ) return 0;
	for( var i=0; i<str.length;i++){
		var ch = escape( str.charAt(i));
		if( ch.length==1) len++;
		else if( ch.indexOf("%u")!= -1) len +=2;
		else if( ch.indexOf("%") != -1) len +=ch.length/3;
	}
	return len;
}

//���ڿ� �޸��� �����ڸ����� �Ű������� ���� 
function formatnumber(v1,v2){ 
	var str=new Array(); //�޸���Ʈ���� ������ �迭 
	v1=String(v1); //���ڸ� ��Ʈ������ ��ȯ 
	for(var i=1;i<=v1.length;i++){ //������ ���̸�ŭ �ݺ� 
		if(i%v2) 
			str[v1.length-i]=v1.charAt(v1.length-i); //�ڸ����� �ƴϸ� ���ڸ����� 
		else  
			str[v1.length-i]=','+v1.charAt(v1.length-i); //�ڸ��� �̸� �޸����� ���� 
	} 
	return str.join('').replace(/^,/,''); //��Ʈ���� �����Ͽ� ��ȯ 
} 

//�Ҽ���
function formatnumber2(num, comma){
	if(num < 0) num = 0;
	var num = num+"";
	var pos = num.indexOf(".");
	if(pos < 0){
		return formatnumber(num, comma);
	}
	return formatnumber(num.substring(0, num.indexOf(".")), comma)+num.substring(num.indexOf("."));
}

//url ���ڵ� 
var Url = {
    // public method for url encoding
    encode : function (string) {
        return escape(this._utf8_encode(string));
    },
    // public method for url decoding
    decode : function (string) {
        return this._utf8_decode(unescape(string));
    },
    // private method for UTF-8 encoding
    _utf8_encode : function (string) {
        string = string.replace(/\r\n/g,"\n");
        var utftext = "";
        for (var n = 0; n < string.length; n++) {
            var c = string.charCodeAt(n);
            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
        }
        return utftext;
    },
    // private method for UTF-8 decoding
    _utf8_decode : function (utftext) {
        var string = "";
        var i = 0;
        var c = c1 = c2 = 0;
        while ( i < utftext.length ) {
            c = utftext.charCodeAt(i);
            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            }
            else if((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i+1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            }
            else {
                c2 = utftext.charCodeAt(i+1);
                c3 = utftext.charCodeAt(i+2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }
        }
        return string;
    }
}

function go_login_mzone(){
	var ktloginid = document.frmLoginAuth.ktloginid;
	var ktlogindomain = document.frmLoginAuth.ktlogindomain;
	var ktpassword = document.frmLoginAuth.ktpassword;
	//var userType = document.frmLoginAuth.userType;

	if(ktloginid.value == ""){
		alert("���̵� �Է��ϼ���!");
	    ktloginid.focus();
	    return;
    }
    
	if(!validString(ktloginid.value, 'ID')){
		alert("���̵�� �����ڸ� �Է� ���� �մϴ�.");
		ktloginid.focus();
		return;
	}
	/*
	if(userType[1].checked){
		document.frmLoginAuth.loginid.value = ktloginid.value + "@" + ktlogindomain.value;
	}else{
		document.frmLoginAuth.loginid.value = ktloginid.value;
	}*/
	
	document.frmLoginAuth.loginid.value = ktloginid.value;
	
	
	if(ktpassword.value == ""){
    	alert("��й�ȣ�� �Է��ϼ���!");
		ktpassword.focus();
        return;
	}
	document.frmLoginAuth.password.value = ktpassword.value;
	
	var expdate = new Date();
	expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30��
	/*
	if (document.frmLoginAuth.checksaveid.checked){
		setCookie("qzsaveid", document.frmLoginAuth.ktloginid.value, expdate);
	}else{
		setCookie("qzsaveid", "", expdate);
	}
	*/
  
	
	//saveid(document.frmLoginAuth);
	
	var wbSurl = Url.encode(document.location.href);
	
	//kt���� ���� url
	var kturl = "http://zone.olleh.com/auth/login_auth.zone?wbSurl="+wbSurl+"&method=mzLogin&wbResult=Y&wbCoop=megazone&okurl=";
	kturl = "http://zone.olleh.com/auth/loginBridge.zone?bridgeURL="+Url.encode(kturl);
	
	//kt���� ���� url
	//var ktfailurl = "http://zone.olleh.com/auth/login_form.zone?wbSurl="+wbSurl+"&method=mzLogin&wbResult=N&wbCoop=megazone&okurl=";
	//ktfailurl = "http://zone.olleh.com/auth/loginBridge.zone?bridgeURL="+Url.encode(ktfailurl);
	
	//document.frmLoginAuth.kturl.value = kturl;
	//document.frmLoginAuth.ktfailurl.value = ktfailurl;
	
	document.frmLoginAuth.ktrturl.value = kturl;
	//document.frmLoginAuth.ktRTUrl.value = kturl;
	
	document.frmLoginAuth.action = "https://www.qook.co.kr/cs/jsp/login_sub.jsp?qcode=h003a02";
	//document.frmLoginAuth.action = "https://login.qook.co.kr/login/loginauth.php";
	document.frmLoginAuth.submit();
}

function IframeResize(id)
{
	var ifrm = document.getElementById(id);
	var the_height = ifrm.contentWindow.document.body.parentNode.scrollHeight + 4 ;
	ifrm.height = the_height ;
}
function helpPop(aUrl, menuid, code){
	var winX = 891;
	var winY = 682;
	var w = 891;
	var url = "http://zone.olleh.com"+aUrl+".zone?menuid="+menuid+code+"&winX="+winX+"&winY="+winY;
	window.open(url, "new_help_viewer","status=no,resizable=no,channelmode=0,directories=no,location=no,address=no,menubar=no,toolbar=no,scrollbars=yes,width="+w+",height=635,left=0,top=0");
}

function helpPop(aUrl, menuid, code, sub_url){
	var suburl = Url.encode(sub_url);
	var winX = 891;
	var winY = 682;
	var w = 891;
	var url = "http://zone.olleh.com"+aUrl+".zone?menuid="+menuid+code+"&suburl="+suburl+"&winX="+winX+"&winY="+winY;
//	var url = "http://test.zone.olleh.com"+aUrl+".zone?menuid="+menuid+code+"&suburl="+suburl+"&winX="+winX+"&winY="+winY;
	window.open(url, "new_help_viewer","status=no,resizable=no,channelmode=0,directories=no,location=no,address=no,menubar=no,toolbar=no,scrollbars=yes,width="+w+",height=652,left=0,top=0");
}

function initBodyMZ(pagename){
	var strSavedId = getCookie("saveid");
	if(pagename=="TOPMAIN"){
		if (strSavedId != null && strSavedId != "") {
			document.frmLoginAuth.ktloginid.value = strSavedId;
			document.frmLoginAuth.checksaveid.checked = true;        
			//document.frmLoginAuth.ktpassword.focus();
		} else {
			document.frmLoginAuth.checksaveid.checked = false;
			//document.frmLoginAuth.ktloginid.focus();
			return;
		}
	}else{
		if (strSavedId != null && strSavedId != "") {
			document.frmLoginAuth.ktloginid.style.backgroundImage='';
			document.frmLoginAuth.ktloginid.value = strSavedId;
			document.frmLoginAuth.checksaveid.checked = true;        
		} else {
			document.frmLoginAuth.checksaveid.checked = false;
			//document.frmLoginAuth.ktloginid.focus();
			return;
		}
	}
}

function goMenu(domain, url, menuid) {
	window.location = "http://" + domain + ".olleh.com/" + url + '.zone?menuid=' + menuid
}

function isNumKey(){
	return !((curr_key > 57 && curr_key <96) || curr_key > 105);
}

function pageLink(url, type){
	if( type == 'Y' ){
		window.location = url;
	}else{
		window.open(url);
	}
}
function layerView(name){

	document.getElementById(name).style.display = "block";
}

function autonext(vl,smax,nextform) {
	if(vl.value.length == smax) { //�Ű����� this�� �Ѱܹ��� �ڷ� ���̸� ������ ũ��� ��
	nextform.focus();      //������ name ���� �Է� ������� ��Ŀ���� �̵�
	nextform.select();     //��Ŀ���� �ű� �Է� ����� ����
	}
}

function onlyNum(obj) {
	//return !(window.event.keyCode < 48 || window.event.keyCode > 57);
	return !(event.getAttribute("keyCode") < 48 || event.getAttribute("keyCode") > 57 );
}
function authNull() {
	document.location.href='http://zone.olleh.com/auth/login_form.zone?wbSurl='+Url.encode(document.location.href);
}




// Flicker Bug Fix
try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}


function flashWrite(url,w,h,id,bg,vars,win){

	var flashStr=
	"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+id+"' align='middle'>"+
	"<param name='allowScriptAccess' value='sameDomain' />"+
	"<param name='movie' value='"+url+"' />"+
	"<param name='FlashVars' value='"+vars+"' />"+
	"<param name='wmode' value='"+win+"' />"+
	"<param name='menu' value='false' />"+
	"<param name='quality' value='high' />"+
	"<param name='bgcolor' value='"+bg+"' />"+
	"<embed src='"+url+"' FlashVars='"+vars+"' wmode='"+win+"' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' name='"+id+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />"+
	"</object>";

	document.write(flashStr);
}
function lnbDisplay(type){
	var obj = BASE.$("secondaryBlock");
	if(type){obj.className="lnbOver";}
	else{obj.className="";}
}
function setSwfHeight(h){
	BASE.$("lnb").style.height = h+"px";
	BASE.$("lnb").getElementsByTagName("EMBED")[0].style.height = h+"px";
}
function openMyMenu(){
	BASE.$("myMenu").style.display = "block";
}
function closeMyMenuJs(){
	BASE.$("myMenu").style.display = "none";
	sendToActionScript(0,"gnb");
}
function sendToActionScript(value, flashId) {
     thisMovie(flashId).closeMyMenu(value);//openMyMenu
}
 function thisMovie(movieName) {
     if (navigator.appName.indexOf("Microsoft") != -1) {
         return window[movieName];
     } else {
         return document[movieName];
     }
}

//�̹����ѿ���
function rollover (obj_img){
	var re = new RegExp('_off');
	obj_img.src = obj_img.src.replace(re,'_on');
}

function rollout (obj_img){
	var re = new RegExp('_on');
	obj_img.src = obj_img.src.replace(re,'_off');
}

// ž�޴� GNB
function openMenuLayer() {
	
	var swf_obj1 = document.getElementById("flash_gnb");
	var swf_obj2 = document.getElementById("gnbNav1");
	var swf_obj3 = document.getElementById("gnbNav2");
	swf_obj1.style.height = 530 + "px";
	swf_obj2.style.height = 530 + "px";
	swf_obj3.style.height = 530 + "px";
}
function closeMenuLayer() {
	var swf_obj1 = document.getElementById("flash_gnb");
	var swf_obj2 = document.getElementById("gnbNav1");
	var swf_obj3 = document.getElementById("gnbNav2");
	swf_obj1.style.height = 60 + "px";
	swf_obj2.style.height = 60 + "px";
	swf_obj3.style.height = 60 + "px";
}

//����Ʈ�޴� LNB
function sizeTo(lnbheight)
	{
	 if( lnbheight === "NAN" )
	  return;
	
	 var lnb_div = document.getElementById("lnb_flash");
	 if( !lnb_div) return;
	 lnb_div.style.height = lnbheight + "px";
	 
	 var swf_obj = document.getElementById("lnbLeft");
	 var swf_obj2 = document.getElementById("lnbLeft2");

	 if( !swf_obj)
	  return;
	 if( navigator.userAgent.indexOf('Opera') > -1 ) { // only opera~
	  setTimeout(function() { 
	   swf_obj.style.height = lnbheight + "px";
	  }, 500);
	 }else {
	 
	  swf_obj.style.height = lnbheight + "px";
	  try{
		  swf_obj2.style.height = lnbheight + "px";
	  } catch(e){}
	}
	
}

function showLogoutLogin(){
	var showcon = confirm('����, �α��ε� ������� �α׾ƿ� �Ͻðڽ��ϱ�?');
	if(showcon==true){ 
		document.location.href = "http://www.olleh.com/index.asp?code=ZB000&urlcd=http://zone.olleh.com/common/logoutAuth.zone?flag="+Url.encode(document.location.href);
	}
}


