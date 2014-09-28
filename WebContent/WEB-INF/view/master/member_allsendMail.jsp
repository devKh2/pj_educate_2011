<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<hr />
<b>회원 전체 메일 전송</b>
<hr />
<br />
<table width="100%" class="list2_tb" summary="회원전체 메일 보내기">
	<tr>
		<td height="50" colspan="2" align="center"><b>※ 이메일 발송
		전문프로그램이 아닌 웹상에서의 단체메일 발송은 메일 발송이 원활하지 않을 수 있습니다.<br>
		또한 대부분의 호스팅업체 서버의 PHP 실행시간이 짧게 설정되어 있기 때문에 메일 발송 도중에 중단될 수 있습니다.</b></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input class="box" name="title" type="text" id="title"
			size="70" value=""></td>
	</tr>
	<tr>
		<th rowspan="2">내용</th>
	</tr>
	<tr>
		<td><textarea name="TextContent" style="width: 100%" rows="25"
				cols="80"></textarea></td>
	</tr>
</table>
<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			<input type = "button" value = "확인"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "취소"/>
		</td>
		<td width="30%"></td>
	</tr>
</table>
</body>
</html>