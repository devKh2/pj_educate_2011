<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ħ</title>
</head>
<style type="text/css">
a { text-decoration:none; cursor:auto;}
</style>
<style>
font{
	face:����ü;
}
</style>
<body>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="white" align="center" title="��α׸���">
	<tr valign="middle" height="5px" align="center">
		<td width="35%" align="left"><b>Gunchim.com</b></td>
	<td width="65%" align="right" title="�α����ϱ�">
	<c:if test="${sessionScope.member == null }">
			<a href="blog.do?page=login_form.do" title="����������"><font color="gray" size=2>LOGIN</font></a>
		<a href="blog.do?page=CartView.do" title="����������"><font color="gray" size=2>CART</font></a>
	</c:if>
	<c:if test="${sessionScope.member != null }">
		<font color="gray" size=2>${sessionScope.member.userName}�� ȯ���մϴ�.</font>
		<a href="/peach/logout.do" title="�α׾ƿ�"><font color="gray" size=2>LOGOUT</font></a>
	</c:if>
		<a href="/peach/main.do" title="��������"><font color="gray" size=2>Gunchim</font></a></td>
	</tr>
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="#fea44d"><b>${st.st_name}</b></td>
	</tr>
</table>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="white" align="center" title="��α׸���">
	<tr>
	<td valign="top" width="30%" align="center">
	<div style="height:100px;">
		<table border="1" bordercolor="#fea44d" width="100%" height="100%">
		<tr>
			<td>
			${sessionScope.member.userName}�� ȯ���մϴ�.
			</td>
		</tr>
		</table>
	</div>
		<table border="1" bordercolor="#fea44d" width="100%" height="100%">
		<!-- ����޴� ���� -->
		<tr>
		<td bgcolor="#fea44d"><b><font color="lightyellow" size="4">����������</font></b></td>
		</tr>
		<tr>
		<td><a href="memberModified.do" target="contentFrame"><b><font color="gray" size="4">ȸ����������</font></b></a></td>
		</tr>
		<tr>
		<td><a href="orderinfo.do" target="contentFrame"><font color="gray" size="4"><b>�ֹ�����</b></font></a></td>
		</tr>
		<tr>
		<td><a href="CartView.do" target="contentFrame"><font color="gray" size="4"><b>��ٱ���</b></font></a></td>
		</tr>
		<tr>
		<td><a href="favorite.do" target="contentFrame"><font color="gray" size="4"><b>���ã�¸���</b></font></a></td>
		</tr>
		<!-- ����޴� ��-->
		</table>
	</td>
		<!-- ���� ���� -->
		<td align="right" width="70%">
			<iframe name="contentFrame" id="contentFrame" src="${page}" marginwidth="0" marginheight="0" frameborder="0"  width="750px" scrolling="no" height="90%" ></iframe>
		</td>
		<!-- ���� �� -->
	</tr>
</table>
<table width="900px" border="0" cellspacing="0" cellpadding="0" bgcolor="white" align="center" title="��α׸���">
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="#fea44d"></td>
	</tr>
</table>
</body>
</html>