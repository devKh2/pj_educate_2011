<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style/basic.css" type="text/css">
<link rel="stylesheet" href="style/layout.css" type="text/css">
<link rel="stylesheet" href="style/search.css" type="text/css">

<script>
	function loadURL(url){
		window.creator.location = url;
		window.close();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>팝업창</title>
</head>
<body>
<table>
	<tr>
		<td><a href = "${linkAddr}" target = "_blank"><img src = "${picPath}" width=220, height=270/></a></td>
	</tr>
<!-- 
	<tr>
		<td align="right">	
			<span class="offerFoot">
				<a href="javascript:closeWindow()">닫기<img src="http://image.melon.co.kr/appsvr/melontoday/images/btn/btn_offer_closeb.gif" alt="오늘 하루 이 창을 열지 않음" onFocus="this.blur();"></a>
			</span>
		</td>
	</tr>
 -->
</table>
</body>
</html>