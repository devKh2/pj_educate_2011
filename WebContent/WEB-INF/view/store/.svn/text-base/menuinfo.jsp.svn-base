<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메뉴 관리</title>
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
//수정 버튼 클릭시 호출되는 함수
//st_num, menu_num 을 변수로 받아 controller로 넘겨 준다.
function modify(st_num, menu_num,mode){
	var f = document.getElementById("delete");
	f.method = "post";
		f.action = "owner_menu_ack.do?st_num="+st_num+"&menu_num="+menu_num+"&mode="+mode;
	f.submit();
}

function del(st_num, menu_name){
	var f = document.getElementById("delete");
	if(confirm('정말 삭제 하시겠습니까?')){
		f.method = "post";
		f.action = "menu_delete.do?st_num="+st_num+"&menu_name="+menu_name;
		f.submit();
	}
}
</script>
<body onload="resize()">
<div id="content">
<form id="delete" name="delete">
<table width = "750px" class = "list_tb">
<tr height="100px">
</tr>
	<tr bgcolor="${blog_des.layout_color}">
		<th width = "15%">상품이미지</th>
		<th width = "15%">상 호 명</th>
		<th width = "15%">상 품 명</th>
		<th width = "20%">상 품 평</th>
		<th width = "12.5%">가 격</th>
		<th width = "12.5%">삭제</th>
	</tr>
	<c:forEach var = "menu" items = "${menuListModel.menuList }" varStatus="status">
		<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }','update')" ><img src = "${menu.menu_picpath }" width = "80px" height="60px"/></td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }','update')" >${menu.st_name }</td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }','update')" >${menu.menu_name }</td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }','update')" >${menu.menu_comment }</td>
			<td onclick="modify('${menu.st_num }', '${menu.menu_num }','update')" >${menu.menu_price }</td>
			<td>

			<input type = "button" value = "삭제" onclick = "del('${menu.st_num }', '${menu.menu_name }');"/></td>
			<c:set var="cu_stnum" value="${menu.st_num}"/>
			<c:set var="cu_stname" value="${menu.st_name}"/>
		</tr>
	</c:forEach>
</table>
<table  width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"><input type="button" value="메뉴추가" onclick="modify('${st.st_num}','${st.st_name}','add')"></td>

		<td width="350px" align="center">
		<c:if test="${menuListModel.beginPageNumber >= 6}">
			<a href="menuinfo.do?stnum=${st.st_num }&pageNum=${menuListModel.beginPageNumber-1}">◁</a>
		</c:if>
		<c:forEach var="pno" begin="${menuListModel.beginPageNumber}" end="${menuListModel.endPageNumber}">
		
		<c:if test = "${pno != menuListModel.requestPage }">
			<a href="menuinfo.do?stnum=${st.st_num }&pageNum=${pno}">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${menuListModel.endPageNumber < menuListModel.totalPageCount}">
			<a href="menuinfo.do?stnum=${st.st_num }&pageNum=${menuListModel.endPageNumber + 1}">▷</a>
		</c:if>
		</td>
		<td width="200px" align="right">총 ${menuListModel.totalPageCount}페이지 / 자료 ${menuListModel.totalMenuCount}건</td>
</table>
	</form>
</div>
</body>
</html>