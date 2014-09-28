<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ϻ� ���</title>

<script type="text/javascript">
	//�����ϱ� ���� ��ũ��Ʈ
	function array(){
		var f = document.getElementById("array");
		f.submit();
	}

</script>

</head>
<body>
<hr />
<b>�Ϻ� ���</b>
<hr />
<br />

<form action = "sale_status_day_default.do" method = "post">
<table width="750px" border="1" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="20px">
		<td  align="center">
			<b>���� ��</b> ���� ����
			<input type = "text" name = "status_year"  value = "${param.status_year }" size = "3" maxlength="4"> ��&nbsp;&nbsp;
			<input type = "text" name = "status_month" value = "${param.status_month }" size = "2" maxlength="2"> ��&nbsp;&nbsp;
			<input type = "text" name = "status_day" value = "${param.status_day }" size = "2" maxlength="2"> ��
			��ȣ <input type = "text" name = "status_st_name" value = "${param.status_st_name }" size = "8">
			<input type = "submit" value = "�˻�"/>&nbsp;&nbsp;&nbsp;
			<a href='sale_status_day_default.do' target = "_content">[����]</a>
			<a href='sale_status_day_default.do' target = "_content">[����]</a>
		</td>
	</tr>
</table>
</form>

<br/>
<c:choose>
	<c:when test = "${listModel.hasStats == false }">

		<br/>
		<br/>
		<table align="center">
			<tr>
				<td> ��� ���� �����ϴ�.</td>
			</tr>
			<tr>
				<td>�ٽð˻��� �ֽʽÿ�</td>
			</tr>
		</table>
	</c:when>
<c:otherwise>

	<br/>
	<table class="list_tb" width="750px" border = 1>
		<tr bgcolor="ffcc66">
			<th width = "10%">���Թ�ȣ</th>
			<th width = "30%">�����̸�</th>
			<th width = "30%">�Ǹż��� [�ڼ�������]</th>
			<th width = "30%">��¥</th>
		</tr>
	<c:forEach var = "stats" items = "${listModel.statsList }">
		<tr>
			<td>${stats.st_num}</td>
			<td>${stats.st_name }</td>
			<td align="right"><a href = "sale_status_day_detail.do?status_date=${listModel.date}&status_st_num=${stats.st_num }&status_totalProfit=${stats.profit }&status_st_name=${stats.st_name}">${stats.profit } �� (won)</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<!-- 
			<td>${stats.menu_price * stats.quantity} </td>
			-->
			<td>${listModel.viewDate}</td>	
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</body>
</html>