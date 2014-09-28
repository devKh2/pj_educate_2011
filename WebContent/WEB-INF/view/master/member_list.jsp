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
	function search(){
		var f = document.getElementById("search");
		f.method = "get";
		f.action = "member.do?searchValue="+f.searchValue.value;
		f.submit();		
	}
	
	function del(id){
		var f = document.getElementById("search");
		if(confirm('���� ���� �Ͻðڽ��ϱ�?')){
			f.method = "post";
			f.action = "delete_member.do?id="+id;
			f.submit();
		}
	}
</script>

<hr />
<b>ȸ�� ���</b>
<hr />
<br />
<form id = "search">
<table width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="50%" align="center">
			ID
			&nbsp;&nbsp;
			<input type = "text" name = "searchValue" value = "${searchValue }"/>
			&nbsp;&nbsp;
			<input type = "button" class = "b_style4" value = "�˻�" onclick = "search();"/>
		</td>
		<td width="50%"></td>
	</tr>
</table>
</form>
<hr />
<table width = "750px" class = "list_tb">
	<tr>
		<th width = "5%">NO</th>
		<th width = "12.5%">ID</th>
		<th width = "10.5%">�� ��</th>
		<th width = "10.5%">��������</th>
		<th width = "19%">E-Mail</th>
		<th width = "10%">Phone</th>
		<th width = "25%">�ּ� </th>
		<th width = "7.5%">����</th>
	</tr>
	<c:forEach var = "member" items = "${memberList.memberList }">
	<tr>
		<td>${member.num }</td>
		<td>${member.id }</td>
		<td>${member.userName }</td>
		<td>${member.joinDate }</td>
		<td>${member.email }</td>
		<td>${member.phone }</td>
		<td>${member.preAddress } <br/>${member.tailAddress }</td>
		<td><input type = "button" value = "����" onclick = "del('${member.id}');"/></td>
	</tr>
	</c:forEach>
</table>
<table  width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"></td>
		<td width="350px" align="center">
		<c:if test="${memberList.beginPageNumber >= 6}">
			<a href="menu.do?pageNum=${memberList.beginPageNumber-1}">��</a>
		</c:if>
		<c:forEach var="pno" begin="${memberList.beginPageNumber}" end="${memberList.endPageNumber}">
		
		<c:if test = "${pno != memberList.requestPage }">
			<a href="menu.do?pageNum=${pno}&searchValue=${searchValue}&searchKey=${searchKey}" target="_content">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${memberList.endPageNumber < memberList.totalPageCount}">
			<a href="menu.do?pageNum=${memberList.endPageNumber + 1}">��</a>
		</c:if>
		</td>
		<td width="200px" align="right">�� ${memberList.totalPageCount}������ / ȸ���� ${memberList.totalMenuCount}��</td>
</table>
</body>
</html>