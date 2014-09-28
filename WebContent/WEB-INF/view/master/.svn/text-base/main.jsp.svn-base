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

<!-- 기본 관리지페이지 접속하면 보여주는 화면 불러오기 위한 셋팅 -->
<c:set var = "page_name_submenu" value = "submenu.do?page=adm"/>		<!-- 서브메뉴 값을 지정 -->
<c:set var = "page_name_content" value = "content.do?content=list"/>	<!-- 컨텐츠 값을 지정 -->

<!--  해당 상당메뉴버튼을 누르면 보여주기 위한 화면 값 셋팅 -->
<c:if test = "${param.page_name != null }">
	<c:set var = "page_name_submenu" value = "submenu.do?page=${param.page_name }"/>
	<c:set var = "page_name_content" value = "${param.page_name}.do"/>
</c:if>

<script type="text/javascript">
	function resize(){
	 var doc = document.getElementById('main');
	   if(doc.offsetHeight == 0){
	   } else {
	   pageheight = doc.offsetHeight;
	   parent.document.getElementById("_content").height = Number(pageheight+50)+"px";
	   }
	}
</script>

<body onload="resize();">

<div id = "main">
<table width="950px" border="0" cellspacing="0" cellpadding="0">
	<tr/>
	<tr valign="middle" height="30px">
		<td width = "10%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size = 4><b>관리자 페이지</b></font></td>
		<td/>
	</tr>
	
</table>
<br />
<table cellpadding='0' cellspacing='0' border='0' width="950px" background="/peach/images/master/menu_bg.gif">
	<tr height="30px" valign="middle">
		<td width = "0.5%"><img src = "/peach/images/master/menu_bg_left.gif"></td>
		<td width = "9%"></td>
		<td width = "15%"><a href="main.do"><b>기본 정보</b></a></td>
		<td width = "15%"><a href="main.do?page_name=sale_list"><b>주문 관리</b></a></td>
		<td width = "15%"><a href="main.do?page_name=menu"><b>메뉴 관리</b></a></td>
		<td width = "15%"><a href="main.do?page_name=member"><b>회원 관리</b></a></td>
		<td width = "15%"><a href="main.do?page_name=store"><b>가게 관리</b></a></td>
		<td width = "15%"><a href="main.do?page_name=popup"><b>팝업/배너 관리</b></a></td>
		<td width = "0.5%"><img src = "/peach/images/master/menu_bg_right.gif"></td>
	</tr>
</table>

<table>
	<tr>
		<td width = "20%" valign="top"><iframe name="_submenu" src="${page_name_submenu }" width="170px" height="500px" frameborder="0" scrolling="no" ></iframe></td>
		<td width = "78%" valign="top"><iframe name="_content" src="${page_name_content }" width="770px" frameborder="0" scrolling="yes"></iframe></td>
	</tr>
</table>
</div>
</body>
</html>