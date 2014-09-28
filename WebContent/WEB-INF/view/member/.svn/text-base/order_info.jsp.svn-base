<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문정보창</title>
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
function detail(ordernum){
	window.open("orderinfo.do?mode=nomalmode&orderid="+ordernum, "상세주문내역", "width=750, height=300, location=no, toolbar=no , menubar=no, status=no, scrollbars=yes");
}

</script>
<body onload="resize()">
<div id="content">
<table width="700px" height="100px" align="center">
	<tr>
		<td>주문정보창</td>
		<td></td>
	</tr>
</table>
<table align="center" frame="void" width="100%"  border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
	<tr bgcolor="fea44d" align="center">
		<td>주문번호</td><td>메뉴</td><td>판매처</td><td>주문일자</td>
	</tr>
	<!--
	반복문위치
	-->
	<c:set var="odnum" value="false"/>
	<c:set var="cnt" value="0"/>
	<c:forEach var="model" items="${ordermodel}" varStatus="status">
	<c:set var="cnt" value="${cnt+1}"/>
	<tr align="center" onclick="detail('${model.order_num}')" style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
	<c:if test="${model.order_num != ordermodel[status.index+1].order_num}">
	<c:if test="${status.begin }">
		<c:set var="cnt" value="${cnt+1}"/>
	</c:if>
		<td>${model.order_num}</td>
		<td>${model.menu_name} <c:if test="${cnt-1 > 0}"><font color="red">외 ${cnt-1}개</font></c:if></td>
		<td>${model.st_name}</td>
		<td>${model.ordertime}</td>
		<c:set var="cnt" value="0"/>
	</c:if>
	
	<c:set var="odnum" value="${model.order_num}"/>
	</tr>
	</c:forEach>
	
</table>
</div>
</body>
</html>