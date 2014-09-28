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
	function del(st_num){
		var f = document.getElementById("delete");
		if(confirm('정말 삭제 하시겠습니까?')){
			f.method = "post";
			f.action = "delete_store.do?st_num="+st_num;
			f.submit();
		}
	}
	
	//수정 버튼 클릭시 호출되는 함수
	//st_num, menu_num 을 변수로 받아 controller로 넘겨 준다.
	function modify(st_num){
		var f = document.getElementById("delete");
		f.method = "post";
		f.action = "update_store.do?st_num="+st_num;
		f.submit();
	}
	
	//검색 버튼 클릭시 호출 되는 함수
	//searchValue, searchKey 의 값을 controller로 넘겨 준다.
	function search(){
		var f = document.getElementById("search");
		f.method = "get";
		f.action = "store.do?searchValue="+f.searchValue.value+"&searchKey="+f.searchKey.value;
		f.submit();
	}
	
	function result(key){
		var f = document.getElementById("search");
		var str = "";
		if(key == 0){
			str = "<input type = \"text\" name = \"searchValue\" value = \"\" style=\"height: 20px; width: 150px\"/>";
		}else{
			str = "<select name = \"searchValue\" class=\"select_d\">";
			str += "<option value = \"한식\">한 식</option>";
			str += "<option value = \"중식\">중 식</option>";
			str += "<option value = \"양식\">양 식</option>";
			str += "</select>";
		}
		document.getElementById("sear").innerHTML = str; 
	}
	
</script>

<hr />
<b>가게 목록</b>
<hr />
<br />
<form id = "search">
<table width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		
		<td width="20%" align="center">
			상호명<input type="radio" name = "searchKey" value = "0" checked="checked" onclick="result(0);">&nbsp;
			업 종<input type="radio" name = "searchKey" value = "1"
			<c:if test="${searchKey == 1 }"> checked="checked"</c:if> onclick="result(1);">&nbsp;
		</td>
		<td width = "25%">
			<div id="sear" style="">
			<c:choose>
			<c:when test="${searchKey == 1 }">
				<select name = "searchValue" class="select_d">
					<option value = "한식" selected>한 식</option>
					<option value = "중식"
					<c:if test="${searchValue eq '중식' }">selected</c:if>>중 식</option>
					<option value = "양식"
					<c:if test="${searchValue eq '양식' }">selected</c:if>>양 식</option>
				</select>
			</c:when>
			<c:otherwise>
				<input type = "text" name = "searchValue" value = "${searchValue }" style="height: 20px; width: 150px"/>
			</c:otherwise>
			</c:choose>
			</div>
		</td>
		<td width = "10%"><input type = "button" class = "b_style4" value = "검색" onclick = "search();"/></td>
		<td width="45%"></td>
		
	</tr>
</table>
</form>
<hr />
<table width = "750px" class = "list_tb">
	<tr>
		<th width = "15%">상호이미지</th>
		<th width = "10%">상 호 명</th>
		<th width = "10%">업 종</th>
		<th width = "10%">대표자명</th>
		<th width = "15%">연 락 처</th>
		<th width = "25%">주 소</th>
		<th width = "5%"></th>
	</tr>
	<c:forEach var = "store" items = "${storeListModel.storeList }">
		<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'"
		onMouseOut="this.style.backgroundColor=''">
			<td onclick = "modify('${store.st_num}');"><img src = "${store.st_picpath }" width = "80px" height="60px"/></td>
			<td onclick = "modify('${store.st_num}');">${store.st_name }</td>
			<td onclick = "modify('${store.st_num}');">${store.st_type }</td>
			<td onclick = "modify('${store.st_num}');">${store.st_owner }</td>
			<td onclick = "modify('${store.st_num}');">${store.st_ownerph }</td>
			<td onclick = "modify('${store.st_num}');">${store.st_detailaddr }</td>
			
			<td><form id="delete">
			<input type = "button" class = "b_style4" value = "삭제" onclick = "del('${store.st_num}')"/></form></td>
			
		</tr>
	</c:forEach>
</table>
<table  width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"></td>
		<td width="350px" align="center">
		<c:if test="${storeListModel.beginPageNumber >= 6}">
			<a href="store.do?pageNum=${storeListModel.beginPageNumber-1}">◁</a>
		</c:if>
		<c:forEach var="pno" begin="${storeListModel.beginPageNumber}" end="${storeListModel.endPageNumber}">
		
		<c:if test = "${pno != storeListModel.requestPage }">
			<a href="store.do?pageNum=${pno}&searchValue=${searchValue}&searchKey=${searchKey}" target="_content">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${storeListModel.endPageNumber < storeListModel.totalPageCount}">
			<a href="store.do?pageNum=${storeListModel.endPageNumber + 1}">▷</a>
		</c:if>
		</td>
		<td width="200px" align="right">총 ${storeListModel.totalPageCount}페이지 / 자료 ${storeListModel.totalStoreCount}건</td>
</table>
</body>
</html>