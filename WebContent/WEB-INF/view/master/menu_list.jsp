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

	//���� ��ư Ŭ���� ȣ��Ǵ� �Լ�
	//st_num, menu_name �� ������ �޾� controller�� �Ѱ� �ش�.
	function del(st_num, menu_name){
		var f = document.getElementById("delete");
		if(confirm('���� ���� �Ͻðڽ��ϱ�?')){
			f.method = "post";
			f.action = "delete.do?st_num="+st_num+"&menu_name="+menu_name;
			f.submit();
		}
	}
	
	//���� ��ư Ŭ���� ȣ��Ǵ� �Լ�
	//st_num, menu_num �� ������ �޾� controller�� �Ѱ� �ش�.
	function modify(st_num, menu_num){
		var f = document.getElementById("delete");
		f.method = "post";
		f.action = "update.do?st_num="+st_num+"&menu_num="+menu_num;
		f.submit();
	}
	
	//�˻� ��ư Ŭ���� ȣ�� �Ǵ� �Լ�
	//searchValue, searchKey �� ���� controller�� �Ѱ� �ش�.
	function search(){
		var f = document.getElementById("search");
		f.method = "get";
		f.action = "menu.do?searchValue="+f.searchValue.value+"&searchKey="+f.searchKey.value;
		f.submit();
	}
	
</script>

<hr />
<b>�޴� ���</b>
<hr />
<br />
<form id = "search">
<table width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="20%" align="center">
			��ȣ��<input type="radio" name = "searchKey" value = "0" checked="checked">&nbsp;
			��ǰ��<input type="radio" name = "searchKey" value = "1" 
			<c:if test="${searchKey == 1 }"> checked="checked"</c:if>>&nbsp;
		</td>
		<td width = "25%">
			<input type = "text" name = "searchValue" value = "${searchValue }" style="height: 20px; width: 150px"/>
		</td>
		<td width = "10%"><input type = "button" class = "b_style4" value = "�˻�" onclick = "search();"/></td>
		<td width="45%"></td>
	</tr>
</table>
</form>
<hr />

<table width = "750px" class = "list_tb">
	<tr>
		<th width = "15%">��ǰ�̹���</th>
		<th width = "15%">�� ȣ ��</th>
		<th width = "15%">�� ǰ ��</th>
		<th width = "20%">�� ǰ ��</th>
		<th width = "12.5%">�� ��</th>
		<th width = "12.5%">����</th>
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
			<input type = "button" class = "b_style4" value = "����" onclick = "del('${menu.st_num }', '${menu.menu_name }');"/></form></td>
			
		</tr>
	</c:forEach>
</table>

<table  width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"></td>
		<td width="350px" align="center">
		<c:if test="${menuListModel.beginPageNumber >= 6}">
			<a href="menu.do?pageNum=${menuListModel.beginPageNumber-1}">��</a>
		</c:if>
		<c:forEach var="pno" begin="${menuListModel.beginPageNumber}" end="${menuListModel.endPageNumber}">
		
		<c:if test = "${pno != menuListModel.requestPage }">
			<a href="menu.do?pageNum=${pno}&searchValue=${searchValue}&searchKey=${searchKey}" target="_content">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${menuListModel.endPageNumber < menuListModel.totalPageCount}">
			<a href="menu.do?pageNum=${menuListModel.endPageNumber + 1}">��</a>
		</c:if>
		</td>
		<td width="200px" align="right">�� ${menuListModel.totalPageCount}������ / �ڷ� ${menuListModel.totalMenuCount}��</td>
</table>
</body>
</html>