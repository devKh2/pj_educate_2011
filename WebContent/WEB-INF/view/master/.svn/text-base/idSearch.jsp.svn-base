<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "base_jspf.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function stName_link(id, name) {
		var f = opener.document.getElementById("storeModel");
		f.owner_id.value = id;
		f.st_owner.value = name;
		window.close();
	}
</script>
<hr />
<b>ID 검색</b>
<hr />
<br />
<form action = "idSearch.do", method="post">
<table width = "500px" class = "list_tb">
	<tr>
		<td width = "65%">
			<input type = "text" name="id" style="height: 20px; width: 100px" value = "${id }"/>
		</td>
		<td width = "25%" colspan="2">
			<input type = "submit" value = "검색"/>
		</td>
	</tr>
	<c:forEach var="sList" items="${memberList.memberList }">
		<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'"
		onMouseOut="this.style.backgroundColor=''" onclick="javascript:stName_link('${sList.cu_id}', '${sList.cu_name }');" >
			<td>${sList.cu_id }</td>
			<td>${sList.cu_name }</td>
		</tr>
	</c:forEach>
</table>
</form>
</body>
</html>