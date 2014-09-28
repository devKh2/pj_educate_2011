<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ϻ� ���</title>
</head>
<body>
<hr />
<b>${listModel.st_name } �� ���� ���� ���</b>
<hr />
<c:choose>
	<c:when test = "${listModel.hasStats == false }">

		<br/>
		<br/>
		<table align="center">
			<tr>
				<td> ${param.status_year }�� ${param.status_month }�� ${param.status_day }�� ������ ������Ʈ�� ���� �ʾҽ��ϴ�</td>
			</tr>
			<tr>
				<td>�ٽð˻��� �ֽʽÿ�</td>
			</tr>
		</table>
	</c:when>
<c:otherwise>
<table width="750px" >
	<tr>
		<td align="center"><img src="..\images\chart01.png" width="488" height="300"/></td>
		<td>y��: �� ����� (����: won)<br>
			x��: month<br>
		</td>
	</tr>
</table>

<br>
	<br/>
	
	
	
	<table class="list_tb" width="750px" border = 1>
		<tr bgcolor="ffcc66">
			<th width = "10%">�⵵/ ��</th>
			<th width = "20%">���� �̸�</th>
			<th width = "20%">�Ѵ� �����</th>
		</tr>
	<c:forEach var = "stats" items = "${listModel.statsList }">
		<tr>
			<td>${stats.monthly}</td>
			<td>${stats.st_name }</td>
			<td align="right">${stats.totalProfit } �� (won)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>


<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="ffff99">
		<th>'${listModel.st_name }' ��  20${listModel.viewDate} �� �Ǹż���</th>
		<th>�հ�: ${listModel.totalProfit } �� (won)</th>
	</tr>
</table>
</body>
</html>