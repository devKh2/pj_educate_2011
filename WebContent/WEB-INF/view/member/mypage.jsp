<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이페이지</title>
</head>
<script type="text/javascript">
function resize(){
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		 parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
	  }
}
</script>
<body onload="resize()">
<div id="content">
<table>
	<tr><td>마이페이지 입니다.${a }</td></tr>
	<tr></tr>
</table>
</div>
</body>
</html>