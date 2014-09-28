<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>군침.. 츄르륵</title>
</head>
<script
	src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAK4TKV0NF4V4VyWXbcCkw5RRjnEEg1WKiJQ4c--MUyKWypgOizxR_jS6n0hM2n_ShbkYijBX5eyICQw"
	type="text/javascript"></script>
<script type="text/javascript">
var map = null;
var geocoder = null;

function createMarker(point, html,markerOptions) {
	  var marker = new GMarker(point,markerOptions); 
	  GEvent.addListener(marker, "click", function() {
	    marker.openInfoWindowHtml(html);
	  });
	  return marker;
	}
	
    function initialize() {
    	var myIcon = new GIcon(G_DEFAULT_ICON);
		myIcon.image = "http://maps.google.com/mapfiles/kml/pal2/icon33.png"; 
		myIcon.iconSize=new GSize(32,32);
		myIcon.shadowSize=new GSize(56,32);
		myIcon.iconAnchor=new GPoint(16,32);
		myIcon.infoWindowAnchor=new GPoint(16,0);
		// Set up our GMarkerOptions object
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map"));
        var addr=document.dilmap.addr;
    	var stname=document.getElementsByName("stname");
        map.enableScrollWheelZoom();
        for(var i=0;i<addr.length;i++){
        geocoder = new GClientGeocoder();
        if (geocoder) {
	            geocoder.getLatLng(addr[i].value,function(point) {
	            	if (!point) {
	                } else {
	                  map.setCenter(point, 8);
	                  map.addControl(new GSmallMapControl());
	                  var markerOptions ={title:"맛집"+i,icon:myIcon, draggable:false };
	                  var marker = createMarker(point, "<table><tr><td></td></tr><table>",markerOptions);
	                  map.addOverlay(marker);
	                }
	              }
	            );
	          }
        }
      }
    }
   </script>
<link rel="stylesheet" href="style/layout.css" type="text/css">
<style type="text/css">
	/*씨네21*/
	#movieCine21{overflow:hidden; width:210px; height:351px; background:url(images/main/bg_storeMap_frame.gif) no-repeat left top; padding:10px 5px 0 5px;}
	#movieCine21 p{border-bottom:1px solid #d3d3d3; padding:0 0 5px 0;}
	#movieCine21 dl{width:210px;}
	#movieCine21 dl dt{margin:10px 0 0 0;}
	#movieCine21 dl dd{text-align:center;}
	#movieCine21 dl dd.tit{margin:10px 0 0 0; font-weight:bold;}
	#movieCine21 dl dd.desc{}
</style>
 
<body onload="initialize()" onunload="GUnload()" >
<div id="movieCine21">
<!-- 배달 맛집 지도 영역// -->
<form id="dilmap" name="dilmap">
	<c:forEach var="i" items="${randomStoreList}">
		<input type="hidden" name="addr" value="${i.st_sido}${i.st_gugun}${i.st_dong}${i.st_detailaddr}"/>
		<input type="hidden" name="stname" value="${i.st_name}"/>
	</c:forEach>
</form>
<p><b><font size="2" face="굴림">맛집 지도!</font></b></p>
<div id="map" title="위치 정보"  style="width:210px; height:300px;"/>
<script type="text/javascript">

</script>
</div>
</body>
</html>
