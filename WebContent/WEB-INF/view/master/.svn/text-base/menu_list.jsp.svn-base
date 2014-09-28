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

<script type="text/javascript">

	//삭제 버튼 클릭시 호출되는 함수
	//st_num, menu_name 을 변수로 받아 controller로 넘겨 준다.
	function del(st_num, menu_name){
		var f = document.getElementById("delete");
		if(confirm('정말 삭제 하시겠습니까?')){
			f.method = "post";
			f.action = "delete.do?st_num="+st_num+"&menu_name="+menu_name;
			f.submit();
		}
	}
	
	//수정 버튼 클릭시 호출되는 함수
	//st_num, menu_num 을 변수로 받아 controller로 넘겨 준다.
	function modify(st_num, menu_num){
		var f = document.getElementById("delete");
		f.method = "post";
		f.action = "update.do?st_num="+st_num+"&menu_num="+menu_num;
		f.submit();
	}
	
	//검색 버튼 클릭시 호출 되는 함수
	//searchValue, searchKey 의 값을 controller로 넘겨 준다.
	function search(){
		var f = document.getElementById("search");
		f.method = "get";
		f.action = "menu.do?searchValue="+f.searchValue.value+"&searchKey="+f.searchKey.value;
		f.submit();
	}
	
</script>

<hr />
<b>메뉴 목록</b>
<hr />
<br />
<form id = "search">
<table width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="20%" align="center">
			상호명<input type="radio" name = "searchKey" value = "0" checked="checked">&nbsp;
			상품명<input type="radio" name = "searchKey" value = "1" 
			<c:if test="${searchKey == 1 }"> checked="checked"</c:if>>&nbsp;
		</td>
		<td width = "25%">
			<input type = "text" name = "searchValue" value = "${searchValue }" style="height: 20px; width: 150px"/>
		</td>
		<td width = "10%"><input type = "button" class = "b_style4" value = "검색" onclick = "search();"/></td>
		<td width="45%"></td>
	</tr>
</table>
</form>
<hr />

<table width = "750px" class = "list_tb">
	<tr>
		<th width = "15%">상품이미지</th>
		<th width = "15%">상 호 명</th>
		<th width = "15%">상 품 명</th>
		<th width = "20%">상 품 평</th>
		<th width = "12.5%">가 격</th>
		<th width = "12.5%">삭제</th>
	</tr>
	<c:forEach var = "menu" items = "${menuListModel.menuList }">
		<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'"
		onMouseOut="this.style.backgroundColor=''">
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }');"><img src = "${menu.menu_picpath }" width = "80px" height="60px"/></td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }');">${menu.st_name }</td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }');">${menu.menu_name }</td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }');">${menu.menu_comment }</td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }');">${menu.menu_price }</td>
			
			<td><form id="delete">
			<input type = "button" class = "b_style4" value = "삭제" onclick = "del('${menu.st_num }', '${menu.menu_name }');"/></form></td>
			
		</tr>
	</c:forEach>
</table>

<table  width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"></td>
		<td width="350px" align="center">
		<c:if test="${menuListModel.beginPageNumber >= 6}">
			<a href="menu.do?pageNum=${menuListModel.beginPageNumber-1}">◁</a>
		</c:if>
		<c:forEach var="pno" begin="${menuListModel.beginPageNumber}" end="${menuListModel.endPageNumber}">
		
		<c:if test = "${pno != menuListModel.requestPage }">
			<a href="menu.do?pageNum=${pno}&searchValue=${searchValue}&searchKey=${searchKey}" target="_content">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${menuListModel.endPageNumber < menuListModel.totalPageCount}">
			<a href="menu.do?pageNum=${menuListModel.endPageNumber + 1}">▷</a>
		</c:if>
		</td>
		<td width="200px" align="right">총 ${menuListModel.totalPageCount}페이지 / 자료 ${menuListModel.totalMenuCount}건</td>
</table>
</body>
</html>