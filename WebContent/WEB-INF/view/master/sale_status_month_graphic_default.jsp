<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
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
<hr/>
월별 통계 그래프
<hr/>
<br />

<form action = "sale_status_month_graphic.do" method = "post">
<table width="750px" border="1" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="20px">
		<td  align="center">
			<b>가게 별</b> 월별 매출 그래프
			<input type = "text" name = "status_year"  value = "${param.status_year }" size = "2" maxlength="2"> 년도&nbsp;&nbsp;
			상호 <input type = "text" name = "status_st_name" value = "${param.status_st_name }" size = "8">
			<input type = "submit" value = "보기"/>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>
</form>

</body>
</html>