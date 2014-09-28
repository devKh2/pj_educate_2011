<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "model.AuthNumModel" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	function closed(){
		opener.document.getElementById("command").authCheck.value = "인증됨";
		self.close();
	}
	
	function authRequest(){
		var f=document.getElementById('authenticationForm');
		f.submit();
		alert('인증번호를 보냈습니다');
	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>인증번호받기</title>
</head>
<body>
<b>인증번호받기</b>
<hr/>
<form id="authenticationForm" action = "/peach/authentication.do" method = "post">
<table  width = "400px" border = 1>
	<tr>
		<td width = "40%">이메일 주소</td>
		<td>${param.email}
		<input type = "hidden" name ="email" value = ${param.email}>
		</td>
		<td><input type = "button" value = "인증번호받기" onClick = "javascript:authRequest()"></td>
	</tr>	
	<tr>
		<td>인증번호입력</td>
		<td><input type = "text" name = "checkNum"></td>
		<td><input type = "submit" value = "확인"/></td>
	</tr>

</table>
<table>
	<tr>
		<td>
		<c:choose>
			<c:when test = "${authNumModel.result == 'success' }">
				<table>
					<tr>
						<td>인증을 성공하였습니다</td>&nbsp;&nbsp;&nbsp;
						<td><input type = "button" value = "닫기" onClick="javascript:closed()"></td>
					</tr>
				</table>
			</c:when>
			<c:when test = "${authNumModel.result == 'fail' }">
				<table>
					<tr>
						<td>입력한 인증번호는 옳지 않습니다<br>
							다시 입력해주십시오</td>
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