<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "base_jspf.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


</head>
<body>
<hr/>
<b>기본 정보</b>
<hr/>
<f:form commandName="admin" action="update_admin.do">
<table width="750px" class="list2_tb">
	<colgroup>
		<col width="150">
		<col width="">
	</colgroup>

	<tr>
		<td bgcolor="#F0FFFF">
			홈페이지 이름
		</td>
		<td width = "83%">
			<f:input path = "home_name" value = "${admin.home_name }" style="height: 20px; width: 250px"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			홈페이지 제목
		</td>
		<td>
			<f:input path = "home_title" value = "${admin.home_title }" style="height: 20px; width: 400px"/><br/>
			<font class="help">* 브라우저 상단 타이틀바에 표시됩니다.</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			기타 정보
		</td>
		<td>
			마지막 접속 시간 ${admin.time }
		</td>
	</tr>
</table>
<br/>
<b>관리자 정보</b>
<table width="750px"  class="list2_tb">
	<tr>
		<td bgcolor="#F0FFFF">
			관리자 아이디
		</td>
		<td width = "83%">
			<f:input path = "id" value = "${admin.id }" style="height: 20px; width: 100px"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			관리자 비밀번호
		</td>
		<td>
			<f:password path = "pw" style="height: 20px; width: 100px"/><font class="help">* 비밀번호 변경시에만 입력하세요.</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			관리자 비밀번호
		</td>
		<td>
			<f:password path = "pwch" style="height: 20px; width: 100px"/><font class="help">* 비밀번호에 오타가 입력되서 추후 로그인이 안되는 문제 방지를 위해 입력합니다.</font>
			<f:errors path = "pwch"/>
		</td>
	</tr>
	<tr>
	<td bgcolor="#F0FFFF">
			관리자 발송메일
		</td>
		<td>
			<f:input path = "email" value = "${admin.email }" style="height: 20px; width: 150px"/>
		</td>
	</tr>
	<tr>
	<td bgcolor="#F0FFFF">
			관리자 수신메일
		</td>
		<td>
			<f:input path = "emailrev" style="height: 20px; width: 150px"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			관리 책임자
		</td>
		<td>
			<f:input path = "name" value = "${admin.name }" style="height: 20px; width: 80px"/>
		</td>
	</tr>
</table>
<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value = "등록"/>
		</td>
		<td width="30%"></td>
	</tr>
</table>
</f:form>
</body>
</html>