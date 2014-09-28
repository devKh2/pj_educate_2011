<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주인장 페이지</title>
</head>
<style type="text/css">
a { text-decoration:none; cursor:auto;}
</style>
<style>
font{
	face:굴림체;
}
</style>
<!--
1.레이아웃 컬러설정
2.배경색상 설정
3.메인 탑 로고 설정
4.레프트 탑 로고설정
5.소개페이지 이미지 설정
6.메뉴설정 
 -->
<body bgcolor=${blog_des.bgcolor}>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="${blog_des.bgcolor}" align="center" title="블로그메인">
	<tr valign="middle" height="5px" align="center">
		<td width="35%" align="left"><b>Gunchim.com</b></td>
	<td width="65%" align="right" title="로그인하기">
	<c:if test="${sessionScope.member == null }">
		<a href="blog.do?page=login_form.do" title="로그인"><font color="gray" size=2>LOGIN</font></a>
	</c:if>
	<c:if test="${sessionScope.member != null }">
		<font color="gray" size=2>${sessionScope.member.userName}님 환영합니다.</font>
		<select onchange="goUrl(this.value)">
		<option selected="selected">즐겨찾는맛집</option>
		<c:forEach var="it" items="${sessionScope.member.favoritesite.storemodel}">
			<option value="${it.st_num}">${it.st_name}</option>
		</c:forEach>
		</select>
		<a href="/peach/logout.do" title="로그아웃"><font color="gray" size=2>LOGOUT</font></a>
		<a href="mypage.do" title="마이페이지"><font color="gray" size=2>MYPAGE</font></a>
	</c:if>
		<a href="/peach/main.do" title="메인으로"><font color="gray" size=2>Gunchim</font></a></td>
	</tr>
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="${blog_des.layout_color}"><b>${st.st_name}</b></td>
	</tr>
</table>
<table width="900px" align="center" frame="void"  bordercolor="${blog_des.layout_color}" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
	<tr>
	<td valign="top" width="30%" align="center">
	<div style="height:100px;">
		<table border="1" bordercolor="${blog_des.layout_color}" width="100%"  height="100px" bordercolor="${blog_des.layout_color}" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
		<tr><td><img src="${blog_des.left_top_logo_path}" width="90%" height="100px" border="0" /></td>
		</tr>
		</table>
	</div>
		<table align="center" frame="void"  width="100%" height="100%" bordercolor="${blog_des.layout_color}" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
		<!-- 서브메뉴 시작 -->
		<tr>
		<td bgcolor="${blog_des.layout_color}"><b><font color="lightyellow" size="4"><a href="blog.do?stnum=${st.st_num}">HOME</font></b></a></td>
		</tr>
		<tr>
		<td><a href="owner.do?stnum=${st.st_num}&page=defaultinfo.do"><b><font color="gray" size="4">기본정보수정</font></b></a></td>
		</tr>
		<tr>
		<td><a href="owner.do?stnum=${st.st_num}&page=menuinfo.do"><font color="gray" size="4"><b>메뉴관리</b></font></a></td>
		</tr>
		<tr>
			<td><a href="st_sale.do?st_num=1&st_name=${st.st_name}" target="contentFrame"><font color="gray" size="4"><b>매출현황</b></font></a></td>
		</tr>
		<tr>
		<td><a href="owner.do?stnum=${st.st_num}&page=designinfo.do"><font color="gray" size="4"><b>디자인관리</b></font></a></td>
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
		<td  height="" width="100%" colspan="2" bgcolor="${blog_des.layout_color}"><b>${st.st_name}</b></td>
	</tr>
</table>
</body>
</html>