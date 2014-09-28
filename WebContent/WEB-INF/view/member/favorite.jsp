<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>[군침] 즐겨찾기 목록</title>
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
<table align="center" align="center" frame="void" width="100%"  border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
<tr align="left">
	<th colspan="4" height="100px" align="left" >즐겨찾기</th>
</tr>
<tr bgcolor="orange">
	<th>사진</th>
	<th>가게이름</th>
	<th>주소</th>
	<th>영업시간</th>
</tr>

<c:forEach var="it" items="${sessionScope.member.favoritesite.storemodel}">
<tr onclick="window.open('blog.do?stnum=${it.st_num}');" style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
	<td><img src="${it.st_picpath}" width="50" height="50"/></td>
	<td>${it.st_name}</td>
	<td>${it.st_detailaddr}</td>
	<td>${it.st_optime}</td>
	</tr>
</c:forEach>
</table>
</div>
</body>
</html>