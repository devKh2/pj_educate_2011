<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="resize()">
<script type="text/javascript">
function resize(){
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
	  }
}
	function find(){
		var f = document.getElementById("find");
		f.aciont = "orderinfo.do?state=" + f.state.value;
		f.method = "get";
		f.submit();
	}
	
	function detail(count){
		var f = document.getElementById("data"+count);
		var temp;
		for(var i = 1;document.getElementById(i)!=null;i++){
			if(i == count){}
			else{
				document.getElementById(i).innerHTML = "";
			}
		}
		var src = "<table width = \"700px\" class = \"list_tb\"><tr bgcolor=orange><td>상세주문번호</td><td>상 호</td>"
		+"<td>시간</td><td>메뉴</td><td>수량</td><td>가격</td><td>총가격</td><td>상태</td></tr>";
		if(f.count.value == 1){
			src += "<tr>";
			src += "<td>"+f.orderdetail_num.value+"</td>";
			src += "<td>"+f.st_name.value+"</td>";
			src += "<td>"+f.order_time.value+"</td>";
			src += "<td>"+f.menu_name.value+"</td>";
			src += "<td>"+f.quantity.value+"</td>";
			src += "<td>"+f.menu_price.value+"</td>";
			src += "<td>"+(f.quantity.value * f.menu_price.value)+"</td>";
			src += "<td>"+f.order_status.value+"</td></tr>";
		}else{
		for(var i = 0;i<f.st_name.length;i++){
			src += "<tr>";
			src += "<td>"+f.orderdetail_num[i].value+"</td>";
			src += "<td>"+f.st_name[i].value+"</td>";
			src += "<td>"+f.order_time[i].value+"</td>";
			src += "<td>"+f.menu_name[i].value+"</td>";
			src += "<td>"+f.quantity[i].value+"</td>";
			src += "<td>"+f.menu_price[i].value+"</td>";
			src += "<td>"+(f.quantity[i].value * f.menu_price[i].value)+"</td>";
			src += "<td>"+f.order_status[i].value+"</td></tr>";
		}
		}
		src += "</table>";
		document.getElementById(count).innerHTML =src;
		resize();
	}
</script>
<div id="content">

<table width="100%" frame="void" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
	<tr height="100px">
		<td colspan="9"><b>주문 내역</b></td>
	</tr>
	<tr bgcolor="orange" align="center">
		<th  width = "163px">주문정보</th>
		<th  width = "93px">주문시간</th>
		<th  width = "93px">확인시간</th>
		<th  width = "93px">출발시간</th>
		<th  width = "73px">주문자명</th>
		<th  width = "93px">상호명	</th>
		<th  width = "63px">금 액</th>
		<th  width = "73px">상 태</th>
	</tr>
	<c:forEach var = "order" items = "${orderList.orderList }" varStatus = "status">
	<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'"
		onMouseOut="this.style.backgroundColor=''" 
		onclick = "detail('${status.count}');">
		<td>${order.order_inf }</td>
		<td>${order.order_time }</td>
		<td></td>
		<td></td>
		<td>${order.order_name }</td>
		<td>${order.st_name }</td>
		<td>${order.price }</td>
		<td>${order.state}</td>
	</tr>
	<tr><td colspan = "8"><div id="${status.count }" align="right" style=""></div></td></tr>
	<form id = "data${status.count }" name = "data${status.count }">
	<c:forEach var = "ot" items = "${order.orderList }" varStatus = "cc">
		<input type = hidden name = "count" value= "${cc.count }"/>
		<input type = hidden name = "menu_name" value = "${ot.menu_name }"/>
		<input type = hidden name = "st_name" value = "${ot.st_name }"/>
		<input type = hidden name = "quantity" value = "${ot.quantity }"/>
		<input type = hidden name = "menu_price" value = "${ot.menu_price }"/>
		<input type = hidden name = "order_status" value = "${ot.order_status }"/>
		<input type = hidden name = "order_time" value = "${ot.order_time }"/>
		<input type = hidden name = "orderdetail_num" value = "${ot.orderdetail_num }"/>
	</c:forEach>
	</form>
	</c:forEach>
	
</table>
<form id = "find">
<table  width="100%" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"></td>
		<td width="350px" align="center">
		<c:if test="${orderList.beginPageNumber >= 6}">
			<a href="orderinfo.do?pageNum=${orderList.beginPageNumber-1}">◁</a>
		</c:if>
		<c:forEach var="pno" begin="${orderList.beginPageNumber}" end="${orderList.endPageNumber}">
		<c:if test = "${pno != orderList.requestPage }">
			<a href="orderinfo.do?pageNum=${pno}&searchKey=${searchKey}">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${orderList.endPageNumber < orderList.totalPageCount}">
			<a href="orderinfo.do?pageNum=${orderList.endPageNumber + 1}">▷</a>
		</c:if><select name = "state" class="select_d">
				<option value = "0" selected>주문전체</option>
				<option value = "주문" <c:if test = "${state eq '주문' }">selected</c:if>>주문대기</option>
				<option value = "완료" <c:if test = "${state eq '완료' }">selected</c:if>>발송완료</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" class = "b_style4" value = "검색" onclick = "find();"/>
		</td>
		<td width="200px" align="right">총 ${orderList.totalPageCount}페이지 / 자료 ${orderList.totalOrderCount}건</td>
</table>
</form>
</div>
</body>
</html>
