<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일별 통계</title>

<script type="text/javascript">
	//정렬하기 위한 스크립트
	function array(){
		var f = document.getElementById("array");
		f.submit();
	}

</script>

</head>
<body>
<hr />
<b>일별 통계</b>
<hr />
<br />

<form action = "sale_status_day_default.do" method = "post">
<table width="750px" border="1" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="20px">
		<td  align="center">
			<b>가게 별</b> 일일 매출
			<input type = "text" name = "status_year"  value = "${param.status_year }" size = "3" maxlength="4"> 년&nbsp;&nbsp;
			<input type = "text" name = "status_month" value = "${param.status_month }" size = "2" maxlength="2"> 월&nbsp;&nbsp;
			<input type = "text" name = "status_day" value = "${param.status_day }" size = "2" maxlength="2"> 일
			상호 <input type = "text" name = "status_st_name" value = "${param.status_st_name }" size = "8">
			<input type = "submit" value = "검색"/>&nbsp;&nbsp;&nbsp;
			<a href='sale_status_day_default.do' target = "_content">[오늘]</a>
			<a href='sale_status_day_default.do' target = "_content">[어제]</a>
		</td>
	</tr>
</table>
</form>

<br/>
<c:choose>
	<c:when test = "${listModel.hasStats == false }">

		<br/>
		<br/>
		<table align="center">
			<tr>
				<td> 결과 값이 없습니다.</td>
			</tr>
			<tr>
				<td>다시검색해 주십시오</td>
			</tr>
		</table>
	</c:when>
<c:otherwise>

	<br/>
	<table class="list_tb" width="750px" border = 1>
		<tr bgcolor="ffcc66">
			<th width = "10%">가게번호</th>
			<th width = "30%">가게이름</th>
			<th width = "30%">판매수익 [자세히보기]</th>
			<th width = "30%">날짜</th>
		</tr>
	<c:forEach var = "stats" items = "${listModel.statsList }">
		<tr>
			<td>${stats.st_num}</td>
			<td>${stats.st_name }</td>
			<td align="right"><a href = "sale_status_day_detail.do?status_date=${listModel.date}&status_st_num=${stats.st_num }&status_totalProfit=${stats.profit }&status_st_name=${stats.st_name}">${stats.profit } 원 (won)</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<!-- 
			<td>${stats.menu_price * stats.quantity} </td>
			-->
			<td>${listModel.viewDate}</td>	
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</body>
</html>