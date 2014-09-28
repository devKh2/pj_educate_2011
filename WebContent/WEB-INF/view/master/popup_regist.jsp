<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<hr/>
팝업등록하기
<hr/>
<br/>

<form action = "" method = "post">
<table width="750px">
	<tr>
		<td width = "10%" align="center">배경이미지</td>
		<td><input type = "file" value = "이미지첨부" size="65"></td>
	</tr>
	<tr>
		<td width = "10%" align="center">적용기간</td>
		<td>
			<input type = "text" name = "startYear" size = 4 maxlength="4"> 년  
			<input type = "text" name = "startMonth" size = 3 maxlength="2"> 월
			<input type = "text" name = "startDay" size = 3 maxlength="2"> 일   부터 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ~ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "text" name = "endYear" size = 4 maxlength="4"> 년
			<input type = "text" name = "endMonth" size = 3 maxlength="2"> 월
			<input type = "text" name = "endDay" size = 3 maxlength="2"> 일 까지
		</td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td><textarea cols="50" name = "content"  style="width: 570px;" rows="10" ></textarea></td>
	</tr>
</table>
</form>

<table width="650px">
	<tr align="right">
		<td>
			<input type = "submit" value = "등록">
			<input type = "button" name = "cancel" value = "취소">
		</td>
	</tr>
</table>
</body>
</html>