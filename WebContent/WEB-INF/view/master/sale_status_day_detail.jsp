 <%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일별 통계</title>
</head>
<body>
<hr />
<b>${listModel.st_name } 의 일일 매출 목록</b>
<hr />
<br />


<br/>

<c:choose>
	<c:when test = "${listModel.hasStats == false }">

		<br/>
		<br/>
		<table align="center">
			<tr>
				<td> ${param.status_year }년 ${param.status_month }월 ${param.status_day }일 정보는 업데이트가 되지 않았습니다</td>
			</tr>
			<tr>
				<td>다시검색해 주십시오</td>
			</tr>
		</table>
	</c:when>
<c:otherwise>
<form action = "sale_status_day_detail.do" name="array" method = "post">
	<table width="750px" border="0" cellspacing="0" cellpadding="0">
		<tr align = "right">
			<td>정렬 
				<select name="syear" class="select_d">
					<option value="">선택</option>
					<option value="menu">메뉴명</option>
					<option value="quentity">판매량</option>
					<option value="income">판매약</option>
				</select>
				<br/>
				<font color = "red" size="1">--- 최고 판매량</font><br/>
				<font color = "blue" size="1">--- 최저 판매량</font><br/>
			</td>
		</tr>
	</table>
</form>
	<br/>
	
	
	
	<table class="list_tb" width="750px" border = 1>
		<tr bgcolor="ffcc66">
			<th width = "20%">메뉴</th>
			<th width = "10%">메뉴번호</th>
			<th width = "20%">가격</th>
			<th width = "15%">수량</th>
			<th width = "35%">판매액( = 메뉴가격 X 수량)</th>
		</tr>
	<c:forEach var = "stats" items = "${listModel.statsList }">
		<tr>
			<td>${stats.menu_name}</td>
			<td>${stats.menu_num }</td>
			<td align="right">${stats.menu_price } 원 (won)&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>${stats.quantity }</td>
			<td align="right">${stats.menu_price * stats.quantity } ( = ${stats.menu_price } * ${stats.quantity })&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>	
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>


<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="ffff99">
		<th>'${listModel.st_name }' 의 ${listModel.viewDate} 총 판매수익</th>
		<th>합계: ${listModel.totalProfit } 원 (won)</th>
	</tr>
</table>
</body>
</html>