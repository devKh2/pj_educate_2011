<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "model.AuthNumModel" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	function closed(){
		opener.document.getElementById("command").authCheck.value = "������";
		self.close();
	}
	
	function authRequest(){
		var f=document.getElementById('authenticationForm');
		f.submit();
		alert('������ȣ�� ���½��ϴ�');
	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ȣ�ޱ�</title>
</head>
<body>
<b>������ȣ�ޱ�</b>
<hr/>
<form id="authenticationForm" action = "/peach/authentication.do" method = "post">
<table  width = "400px" border = 1>
	<tr>
		<td width = "40%">�̸��� �ּ�</td>
		<td>${param.email}
		<input type = "hidden" name ="email" value = ${param.email}>
		</td>
		<td><input type = "button" value = "������ȣ�ޱ�" onClick = "javascript:authRequest()"></td>
	</tr>	
	<tr>
		<td>������ȣ�Է�</td>
		<td><input type = "text" name = "checkNum"></td>
		<td><input type = "submit" value = "Ȯ��"/></td>
	</tr>

</table>
<table>
	<tr>
		<td>
		<c:choose>
			<c:when test = "${authNumModel.result == 'success' }">
				<table>
					<tr>
						<td>������ �����Ͽ����ϴ�</td>&nbsp;&nbsp;&nbsp;
						<td><input type = "button" value = "�ݱ�" onClick="javascript:closed()"></td>
					</tr>
				</table>
			</c:when>
			<c:when test = "${authNumModel.result == 'fail' }">
				<table>
					<tr>
						<td>�Է��� ������ȣ�� ���� �ʽ��ϴ�<br>
							�ٽ� �Է����ֽʽÿ�</td>
					</tr>
				</table>
			</c:when>
		<c:otherwise>
			<table>
				<tr>
					<td></td>
				</tr>
			</table>
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>
</form>
</body>
</html>