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
<hr/>
<b>�⺻ ����</b>
<hr/>
<f:form commandName="admin" action="update_admin.do">
<table width="750px" class="list2_tb">
	<colgroup>
		<col width="150">
		<col width="">
	</colgroup>

	<tr>
		<td bgcolor="#F0FFFF">
			Ȩ������ �̸�
		</td>
		<td width = "83%">
			<f:input path = "home_name" value = "${admin.home_name }" style="height: 20px; width: 250px"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			Ȩ������ ����
		</td>
		<td>
			<f:input path = "home_title" value = "${admin.home_title }" style="height: 20px; width: 400px"/><br/>
			<font class="help">* ������ ��� Ÿ��Ʋ�ٿ� ǥ�õ˴ϴ�.</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			��Ÿ ����
		</td>
		<td>
			������ ���� �ð� ${admin.time }
		</td>
	</tr>
</table>
<br/>
<b>������ ����</b>
<table width="750px"  class="list2_tb">
	<tr>
		<td bgcolor="#F0FFFF">
			������ ���̵�
		</td>
		<td width = "83%">
			<f:input path = "id" value = "${admin.id }" style="height: 20px; width: 100px"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			������ ��й�ȣ
		</td>
		<td>
			<f:password path = "pw" style="height: 20px; width: 100px"/><font class="help">* ��й�ȣ ����ÿ��� �Է��ϼ���.</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			������ ��й�ȣ
		</td>
		<td>
			<f:password path = "pwch" style="height: 20px; width: 100px"/><font class="help">* ��й�ȣ�� ��Ÿ�� �ԷµǼ� ���� �α����� �ȵǴ� ���� ������ ���� �Է��մϴ�.</font>
			<f:errors path = "pwch"/>
		</td>
	</tr>
	<tr>
	<td bgcolor="#F0FFFF">
			������ �߼۸���
		</td>
		<td>
			<f:input path = "email" value = "${admin.email }" style="height: 20px; width: 150px"/>
		</td>
	</tr>
	<tr>
	<td bgcolor="#F0FFFF">
			������ ���Ÿ���
		</td>
		<td>
			<f:input path = "emailrev" style="height: 20px; width: 150px"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#F0FFFF">
			���� å����
		</td>
		<td>
			<f:input path = "name" value = "${admin.name }" style="height: 20px; width: 80px"/>
		</td>
	</tr>
</table>
<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value = "���"/>
		</td>
		<td width="30%"></td>
	</tr>
</table>
</f:form>
</body>
</html>