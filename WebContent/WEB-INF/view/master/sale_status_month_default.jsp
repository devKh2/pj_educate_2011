<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<hr />
<b>월별 통계</b>
<hr />
<br />

<form action = "sale_status_month_default.do" method = "post">
<table width="750px" border="1" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="20px">
		<td  align="center">
			<b>가게 별</b> 월별 매출
			<input type = "text" name = "status_year"  value = "${param.status_year }" size = "2" maxlength="2"> 년도&nbsp;&nbsp;
			상호 <input type = "text" name = "status_st_name" value = "${param.status_st_name }" size = "8">
			<input type = "submit" value = "검색"/>&nbsp;&nbsp;&nbsp;
			<a href='sale_status_month_default.do' target = "_content">[올해]</a>
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
				<td> ${param.status_year }년 ${param.status_month }월 ${param.status_day }일 정보는 업데이트가 되지 않았습니다</td>
			</tr>
			<tr>
				<td>다시검색해 주십시오</td>
			</tr>
		</table>
	</c:when>
<c:otherwise>
		
	<br/>
	<table class="list_tb" width="750px">
		<tr bgcolor="ffcc66">
			<th width = "10%">가게번호</th>
			<th width = "30%">가게이름</th>
			<th width = "30%">년 판매수익 [월별로 보기]</th>
			<th width = "30%">연도</th>
		</tr>
	<c:forEach var = "stats" items = "${listModel.statsList }">
		<tr>
			<td>${stats.st_num }</td>
			<td>${stats.st_name }</td>
			<td align="right"><a href = "sale_status_month_detail.do?status_date=${listModel.date }&status_st_num=${stats.st_num}&status_totalProfit=${stats.profit }&status_st_name=${stats.st_name}">${stats.profit }&nbsp;원 (won)</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>20${listModel.viewDate }</td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</body>
</html>