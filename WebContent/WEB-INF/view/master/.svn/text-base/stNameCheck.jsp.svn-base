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
<script>
	function stName() {
		var f = document.getElementById("storeSearch");
		f.action = "stName.do";
		f.submit();
	}
	
	function stName_link(name, num) {
		var f = opener.document.getElementById("menuModel");
		f.st_name.value = name;
		f.st_num.value = num;
		window.close();
	}
</script>

<hr />
<b>상호 검색</b>
<hr />
<br />
<f:form commandName="menuModel" method="post">
<input type = "hidden" name="menuModel" value = "${menuModel }"/>
<table width = "500px" class = "list_tb">
	<tr>
		<td width = "65%">
			<f:input path="st_name" style="height: 20px; width: 100px" value = "${stName }"/>
		</td>
		<td width = "25%" colspan="2">
			<input type = "submit" value = "검색"/>
		</td>
	</tr>
	<c:forEach var="sList" items="${storeList.storeList }">
		<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'"
		onMouseOut="this.style.backgroundColor=''" onclick="javascript:stName_link('${sList.st_name }', '${sList.st_num }');" >
			<td>${sList.st_detailaddr }</td>
			<td>${sList.st_name }</td>
		</tr>
	</c:forEach>
</table>
</f:form>
</body>
</html>