<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>군침</title>
</head>
<style type="text/css">
a { text-decoration:none; cursor:auto;}
</style>
<style>
font{
	face:굴림체;
}
</style>
<body>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="white" align="center" title="블로그메인">
	<tr valign="middle" height="5px" align="center">
		<td width="35%" align="left"><b>Gunchim.com</b></td>
	<td width="65%" align="right" title="로그인하기">
	<c:if test="${sessionScope.member == null }">
			<a href="blog.do?page=login_form.do" title="마이페이지"><font color="gray" size=2>LOGIN</font></a>
		<a href="blog.do?page=CartView.do" title="마이페이지"><font color="gray" size=2>CART</font></a>
	</c:if>
	<c:if test="${sessionScope.member != null }">
		<font color="gray" size=2>${sessionScope.member.userName}님 환영합니다.</font>
		<a href="/peach/logout.do" title="로그아웃"><font color="gray" size=2>LOGOUT</font></a>
	</c:if>
		<a href="/peach/main.do" title="메인으로"><font color="gray" size=2>Gunchim</font></a></td>
	</tr>
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="#fea44d"><b>${st.st_name}</b></td>
	</tr>
</table>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="white" align="center" title="블로그메인">
	<tr>
	<td valign="top" width="30%" align="center">
	<div style="height:100px;">
		<table border="1" bordercolor="#fea44d" width="100%" height="100%">
		<tr>
			<td>
			${sessionScope.member.userName}님 환영합니다.
			</td>
		</tr>
		</table>
	</div>
		<table border="1" bordercolor="#fea44d" width="100%" height="100%">
		<!-- 서브메뉴 시작 -->
		<tr>
		<td bgcolor="#fea44d"><b><font color="lightyellow" size="4">마이페이지</font></b></td>
		</tr>
		<tr>
		<td><a href="memberModified.do" target="contentFrame"><b><font color="gray" size="4">회원정보수정</font></b></a></td>
		</tr>
		<tr>
		<td><a href="orderinfo.do" target="contentFrame"><font color="gray" size="4"><b>주문정보</b></font></a></td>
		</tr>
		<tr>
		<td><a href="CartView.do" target="contentFrame"><font color="gray" size="4"><b>장바구니</b></font></a></td>
		</tr>
		<tr>
		<td><a href="favorite.do" target="contentFrame"><font color="gray" size="4"><b>즐겨찾는맛집</b></font></a></td>
		</tr>
		<!-- 서브메뉴 끝-->
		</table>
	</td>
		<!-- 메인 시작 -->
		<td align="right" width="70%">
			<iframe name="contentFrame" id="contentFrame" src="${page}" marginwidth="0" marginheight="0" frameborder="0"  width="750px" scrolling="no" height="90%" ></iframe>
		</td>
		<!-- 메인 끝 -->
	</tr>
</table>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="white" align="center" title="블로그메인">
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="#fea44d"></td>
	</tr>
</table>
</body>
</html>