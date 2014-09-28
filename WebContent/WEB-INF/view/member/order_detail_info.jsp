<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세 주문 내역</title>
</head>
<script type="text/javascript">
function resize(){
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		 window.innerHeight=pageheight;
	  }
}
</script>
<body onload="resize()">
<div id="content">
<table width="700px" height="100px" align="center">
	<tr>
		<td>상세주문내역</td>
	</tr>
</table>
<table width="700px" align="center">
	<tr bgcolor="fea44d" align="center">
		<td>사진</td>
		<td>메뉴</td>
		<td>가격</td>
		<td>수량</td>
		<td>판매처</td>
		<td>주문일자</td>
		<td>배달상태</td>
		<td>평가</td>
	</tr>
	<!--
	반복문위치
	-->
	<c:forEach var="model" items="${ordermodel}">
	<tr align="center" style="cursor:pointer;" onMouseOver="this.style.backgroundColor='FFFBD7'" onMouseOut="this.style.backgroundColor=''">
		<td><img src="${model.pic_path}" width="70px" height="60px" border="0" /></td>
		<td>${model.menu_name}</td>
		<td>${model.menu_price}</td>
		<td>${model.quantity}</td>
		<td>${model.st_name}</td>
		<td>${model.ordertime}</td>
		<td>	
			<c:choose>
				<c:when test="${model.ordersatus=='주문'}">
					<b><font color="green">${model.ordersatus}</font></b>
				</c:when>
				<c:when test="${model.ordersatus=='주문확인'}">
					<b><font color="blue">${model.ordersatus}</font></b>
				</c:when>
				<c:when test="${model.ordersatus=='배송출발'}">
					<b><font color="red">${model.ordersatus}</font></b>
				</c:when>
				<c:otherwise>
					<b><font color="red">${model.ordersatus}</font></b>
				</c:otherwise>
			</c:choose>
		</td>
		<td><input type="button" value="평가" onclick="goEval('${model.st_num}')"/></td>
	</tr>
	</c:forEach>
	<tr align="center">
	<td colspan="8" align="left">
		주문 시 요청 사항
	</td>
	</tr>
	<tr align="center">
	<td colspan="8" align="center">
	<textarea rows="3" cols="90">${ordermodel[0].order_comments}</textarea>
	</td>
	</tr>
</table>
</div>
</body>
</html>