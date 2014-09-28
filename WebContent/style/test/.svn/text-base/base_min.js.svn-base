if(typeof BASE=="undefined"){var BASE={};}
BASE.$=function(id){var aryObj=[];for(var i=0;i<arguments.length;i++){if(typeof arguments[i]=='string'){aryObj.push(document.getElementById(arguments[i]));}else{aryObj.push(arguments[i]);}}
return aryObj[1]?aryObj:aryObj[0];}
BASE.trim=function(str){return str.replace(/(^\s*)|(\s*$)/g,"");}
BASE.setDisplay=function(id){$(id).style.display=($(id).style.display=='none')?'block':'none';}
BASE.addEvent=function(obj,type,evt){if(obj.addEventListener){if(type=='mousewheel')type='DOMMouseScroll';obj.addEventListener(type,evt,false);}else{obj.attachEvent("on"+type,evt);}}
BASE.delEvent=function(obj,type,evt){if(obj.removeEventListener){if(type=='mousewheel')type='DOMMouseScroll';obj.removeEventListener(type,evt,false);}else{obj.detachEvent('on'+type,evt);}}
BASE.getPositionX=function(obj){var left=0;while(obj)
{left+=obj.offsetLeft||0;obj=obj.offsetParent;}
return parseInt(left);}
BASE.getPositionY=function(obj){var top=0;while(obj)
{top+=obj.offsetTop||0;obj=obj.offsetParent;}
return parseInt(top);}
BASE.getElementsByClassName=function(strClassName,strTagName,oElm){var arrElements=(strTagName=="*"&&document.all)?document.all:oElm.getElementsByTagName(strTagName);var arrReturnElements=new Array();strClassName=strClassName.replace(/\-/g,"\\-");var oRegExp=new RegExp("(^|\\s)"+strClassName+"(\\s|$)");var oElement;for(var i=0;i<arrElements.length;i++){oElement=arrElements[i];if(oRegExp.test(oElement.className)){arrReturnElements.push(oElement);}}
return(arrReturnElements)}
BASE.setCookie=function(cookieName,cookieValue){document.cookie=cookieName+"="+escape(cookieValue)+"; path=/;domain=paran.com;";}
BASE.getCookie=function(cookieName){var search=cookieName+"=";var cookie=document.cookie;if(cookie.length>0){startIndex=cookie.indexOf(cookieName);if(startIndex!=-1){startIndex+=cookieName.length;endIndex=cookie.indexOf(";",startIndex);if(endIndex==-1)endIndex=cookie.length;return unescape(cookie.substring(startIndex+1,endIndex));}else{return false;}}else{return false;}}
BASE.getHttpObj=function(){var obj;if(window.ActiveXObject){obj=new ActiveXObject("Microsoft.XMLHTTP");}else if(window.XMLHttpRequest){obj=new XMLHttpRequest();}else{obj=false;}
return obj;}
BASE.resizeIframe=function(iframe_id){var h=(self.innerHeight)?document.documentElement.offsetHeight:document.body.scrollHeight;try{parent.BASE.$(iframe_id).style.height=h+"px";}catch(e){}}
BASE.popUp=function(url,name,w,h,scroll,resize,center){if(!scroll)scroll=0;if(!resize)resize=0;if(!status)status=1;if(center)
{var x=(screen.width-w)/2;var y=(screen.height-h)/2;center=",top="+y+",left="+x;}
return window.open(url,name,"width="+w+",height="+h+",resizable="+resize+",scrollbars="+scroll+center);}
BASE.getRandom=function(num){return Math.floor(Math.random()*parseInt(num));}