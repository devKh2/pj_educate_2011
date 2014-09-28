<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAK4TKV0NF4V4VyWXbcCkw5RRjnEEg1WKiJQ4c--MUyKWypgOizxR_jS6n0hM2n_ShbkYijBX5eyICQw"
	type="text/javascript">
</script>
<script type="text/javascript">
var geocoder=null;
var deslat=null;
var sorlat=null;;
var dism=null;
var size=null;
function init(uaddr,size1){
if(GBrowserIsCompatible()) {
    geocoder = new GClientGeocoder();
  }
  size=size1;
  if(size>1){
	  deslat=new Array();
	  sorlat=new Array();
	  dism=new Array();
  }
}
//거리 측정 시작 
var cnt=0;
var c=0;
function addAddressToMap(response) {
    if (!response || response.Status.code != 200) {
      alert("Sorry, we were unable to geocode that address");
    } else {
	    var  place = response.Placemark[0];
	      if(size>1){
		     switch(cnt){
			     case 0:
			    	 sorlat[c]=new GLatLng(place.Point.coordinates[1],place.Point.coordinates[0]);
				     cnt++;
			    	 break;
			     case 1:
			    	 deslat[c++]=new GLatLng(place.Point.coordinates[1],place.Point.coordinates[0]);
			    	 cnt=0;
			    	 break;
		     } 
	      }else{
	    	  switch(cnt){
			     case 0:
			    	 sorlat=new GLatLng(place.Point.coordinates[1],place.Point.coordinates[0]);
				     cnt++;
			    	 break;
			     case 1:
			    	 deslat=new GLatLng(place.Point.coordinates[1],place.Point.coordinates[0]);
			    	 cnt=0;
			    	 break;
		     }
	      }
    }
 }
function reset(){
	geocoder=null;
	deslat=null;
	sorlat=null;;
	dism=null;
	if(size>1){
	 deslat=new Array(); 
	 sorlat=new Array(); 
	 dism=new Array();   
	}
	geocoder = new GClientGeocoder();
}
  // showLocation() is called when you click on the Search button
  // in the form.  It geocodes the address entered into the form
  // and adds a marker to the map at that location.
 function showLocation() {
  		var addr=parent.document.order.addr;
  		var uaddr1=	parent.document.order.preAddress.value+parent.document.order.tailAddress.value;
  		if(size>1){
	  		 for(var i=0;i<size;i++){ 
		  		geocoder.getLocations(uaddr1, addAddressToMap);
		     	geocoder.getLocations(addr[i].value,addAddressToMap);
		     }
  		}else{
  			geocoder.getLocations(uaddr1, addAddressToMap);
	     	geocoder.getLocations(addr.value,addAddressToMap);
  		}
  		c=0;
 }
</script>
</head>
<body onload="init('${uaddr}','${size}')" >
<input type="button" onclick="calcdistance()" value="거리측정" align="top"/>
<script type="text/javascript">
function calcdistance(){
	 showLocation();
  	alert("거리를 측정 하고 있습니다.");
  	if(size>1){
  		for(var i=0;i<size;i++){
	  		dism[i]=sorlat[i].distanceFrom(deslat[i]);
	  		dism[i] =  Number(dism[i])/1000;
  		  	parent.document.order.usrdistance[i].value=dism[i].toFixed(2)+'km';
  		  	}
  	}else{
  		dism=sorlat.distanceFrom(deslat);
  		dism=Number(dism)/1000;
  		for(var i=0;i<size;i++){
  		  	parent.document.order.usrdistance.value=dism.toFixed(2)+'km';
  		  }
  	}
  	parent.dis_check=true;
  	reset();
}
</script>
</body>
</html>