<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import  = "model.Member" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>
<style type="text/css">
input {
	border-style:solid; border-color: orange;
	background-color: white;
}
table {
	font-family: 돋움체;
}
</style>
</head>
<body>
<form action = "/peach/member_idsearch.do" method = "post">
<table width = "500px">
	<tr>
		<td>
				<tr>
					<td><b>아이디 찾기</b></td>
				</tr>
		</td>
	<tr>
		<td>
			<table border = 0>
				<tr>
					<td width = "30%">이름:</td>
					<td><input type = "text" size = 20 name = "name" value = "${param.name }"></td>
				</tr>
				<tr>
					<td>주민등록번호:</td>
					<td><input type = "text" size = 20 maxlength ="6" name = "preResidentNum" value = "${param.preResidentNum }">
					- <input type = "password" size = 20 maxlength="7" name = "tailResidentNum" value = "${param.tailResidentNum}"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table border = 0>
				<tr>
					<td align = "center">
						<input type = "submit" value="검색"/>
					</td>
					
				</tr>

			</table>
		</td>
		
	</tr>
		<tr>
				<td align="right"><img src="./images/logo.jpg"></td>
				</tr>
			<tr>
		<td>
		<c:choose>
			<c:when test = "${memberlistModel.hasMember == false }">
			<table>
				<tr>
					<td align = "center"> 결과 값이 없습니다</td>
			</table>
			</c:when>
		<c:otherwise>
			<table border = 1 bordercolor = "red" width = "500px">
				<tr>
					<c:forEach var = "member" items = "${memberlistModel.memberList }">				
					<td width = "20%" align = "center">아이디</td>
					<td align = "center">${member.cu_id}</td>
					</c:forEach>
				</tr>	
			</table>
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>
</form>
</body>
</html>