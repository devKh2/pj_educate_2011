<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문이 완료 되었습니다.</title>
</head>
<script type="text/javascript">
function sub(addr){
	parent.location.replace(addr);
}

</script>
<body>
<table align="center" width="100%">
	<tr height="100px">
		<td colspan="5">주문이 정상적으로 완료되었습니다.^^</td>
	</tr>
	<tr align="center" bgcolor="${blog_des.layout_color}">
		<td>음식명</td>
		<td>사진</td>
		<td>음식설명</td>
		<td>가격</td>
		<td>수량</td>
	</tr>
	<c:set var="cnt" value="0" />
	<c:forEach var="menu" items="${menulist}">
		<tr align="center">
			<td>${menu.menu_name}</td>
			<td><a href="${menu.menu_picpath}"><img
				src="${menu.menu_picpath}" width="70px" height="60px" border="0" /></a></td>
			<td>${menu.menu_comment}</td>
			<td>${menu.menu_price}</td>
			<td><input type="text" id="count${cnt}" name="count"
				value="${countlist[cnt]}" size="2" readonly="readonly"/></td>
			<c:set var="pricetotal"
				value="${pricetotal+(menu.menu_price*countlist[cnt])}" />
			<c:set var="cnt" value="${cnt+1}" />
	</c:forEach>
	<tr>
		<td colspan="5">
		<input type="button" value="메인으로가기" onclick="sub('/peach/')">
		<input type="button" value="마이페이지" onclick="sub('/peach/mypage.do')">
		</td>
</table> 
</body>
</html>