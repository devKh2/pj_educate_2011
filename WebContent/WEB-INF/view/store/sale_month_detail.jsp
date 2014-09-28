<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일별 통계</title>
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
<hr />
<b>${listModel.statsList[0].st_name} 의 일일 매출 목록</b>
<hr />
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
<table width="750px" >
	<tr>
		<td align="center"><img src=".\images\chart01.png" width="488" height="300"/></td>
		<td>y축: 총 매출액 (단위: won)<br>
			x축: month<br>
		</td>
	</tr>
</table>

<br>
	<br/>
	
	
	
	<table align="center" frame="void" width="100%"  border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
		<tr bgcolor="ffcc66">
			<th width = "10%">년도/ 월</th>
			<th width = "20%">가게 이름</th>
			<th width = "20%">한달 매출액</th>
		</tr>
	<c:forEach var = "stats" items = "${listModel.statsList }">
		<tr>
			<td>${stats.monthly}</td>
			<td>${stats.st_name }</td>
			<td align="right">${stats.totalProfit } 원 (won)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>


<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="ffff99">
		<th>'${listModel.statsList[0].st_name }' 의  20${listModel.viewDate} 총 판매수익</th>
		<th>합계: ${listModel.totalProfit } 원 (won)</th>
	</tr>
</table>
</div>
</body>
</html>