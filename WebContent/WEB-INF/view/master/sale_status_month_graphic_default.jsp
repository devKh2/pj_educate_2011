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
���� ��� �׷���
<hr/>
<br />

<form action = "sale_status_month_graphic.do" method = "post">
<table width="750px" border="1" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="20px">
		<td  align="center">
			<b>���� ��</b> ���� ���� �׷���
			<input type = "text" name = "status_year"  value = "${param.status_year }" size = "2" maxlength="2"> �⵵&nbsp;&nbsp;
			��ȣ <input type = "text" name = "status_st_name" value = "${param.status_st_name }" size = "8">
			<input type = "submit" value = "����"/>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>
</form>

</body>
</html>