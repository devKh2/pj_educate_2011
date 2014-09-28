<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ħ</title>
</head>
<script type="text/javascript">
function goUrl(values){
	location.href="blog.do?stnum="+values;
}
</script>
<style type="text/css">
a { text-decoration:none; cursor:auto;}
</style>
<style>
</style>
<body bgcolor=${blog_des.bgcolor}>
<table width="930px" border="0" cellspacing="0" cellpadding="0" bgcolor="${blog_des.bgcolor}" align="center" title="��α׸���">
	<tr valign="middle" height="5px" align="center">
		<td width="35%" align="left"><b>Gunchim.com</b></td>
	<td width="65%" align="right" title="�α����ϱ�">
	<c:if test="${sessionScope.member == null }">
		<a href="blog.do?page=login_form.do&stnum=${stnum}" title="�α���"><font color="gray" size=2>LOGIN</font></a>
	</c:if>
	<c:if test="${sessionScope.member != null }">
		<c:if test="${sessionScope.member.id == st.owner_id }">
			<a href="/peach/owner.do?stnum=${stnum}" title="��αװ���"><font color="red" size=2>��αװ���</font></a>
		</c:if>
		<font color="gray" size=2>${sessionScope.member.userName}�� ȯ���մϴ�.</font>
		
		<select onchange="goUrl(this.value)">
		<option selected="selected">���ã�¸���</option>
		<c:forEach var="it" items="${sessionScope.member.favoritesite.storemodel}">
			<option value="${it.st_num}">${it.st_name}</option>
		</c:forEach>
		</select>
		<a href="/peach/logout.do" title="�α׾ƿ�"><font color="gray" size=2>LOGOUT</font></a>
		<a href="mypage.do" title="����������"><font color="gray" size=2>MYPAGE</font></a>
	</c:if>
		<a href="/peach/main.do" title="��������"><font color="gray" size=2>Gunchim</font></a></td>
	</tr>
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="${blog_des.layout_color}" ><b>${st.st_name}</b>
		<c:if test="${sessionScope.member != null }">
			<font color="red" size="1"><a href="favoriteAdd.do?stnum=${st.st_num}">��ã�߰�</a></font>
		</c:if></td>
	</tr>
</table>
<table width="930px" align="center" frame="void"  bordercolor="${blog_des.layout_color}" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
	<tr>
		<td valign="top" width="20%" align="left">
		<div style="height:100px;" align="left">
			<table  bordercolor="${blog_des.layout_color}" width="100%" height="100%"align="center" frame="void"  bordercolor="${blog_des.layout_color}" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
			<tr><td>
			<c:if test="${blog_des.left_top_logo != 0 }">
				<img src="${blog_des.left_top_logo_path}" border="0" width="185px" height="100px"/>
			</c:if>
			<c:if test="${blog_des.left_top_logo == 0 }">
				<img src="./images/leftlogosample.jpg" border="0" width="185px" height="100px"/>
			</c:if>
			</td>
			</tr>
			</table>
		</div>
			<table border="1" align="center" frame="void"  bordercolor="${blog_des.layout_color}" width="100%" height="100%"  border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
			<!-- ����޴� ���� -->
				<tr style=" cursor:pointer;"  onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
					<td bgcolor="${blog_des.layout_color}"><b><font color="lightyellow" size="4">Menu</font></b></td>
				</tr>
				<tr style="cursor:pointer;"  onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
					<td><a href="blog.do?stnum=${stnum}"><b><font color="gray" size="4">��������</font></b></a></td>
				</tr>
				<tr style=" cursor:pointer;"  onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
					<td><a href="blog.do?stnum=${stnum}&page=info.do"><font color="gray" size="4"><b>��������</b></font></a></td>
				</tr>
				<tr  style=" cursor:pointer;"  onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
					<td><a href="sbbs_list.do?stnum=${stnum}" target="contentFrame"><font color="gray" size="4"><b>�Խ���</b></font></a></td>
				</tr>
				<tr style=" cursor:pointer;"  onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
					<td bgcolor="${blog_des.layout_color}"><b><font color="white">Counter:${st.guest_cnt}</font></b></td>
				</tr>
			<!-- ����޴� ��-->
			</table>
		</td>
		<!-- ���� ���� -->
		<td align="left" width="100%">
			<iframe name="contentFrame" id="contentFrame" src="${page}" marginwidth="0" marginheight="0" frameborder="0"  width="100%" scrolling="no" height="90%" ></iframe>
		</td>
		<!-- ���� �� -->
	</tr>
</table>
<table width="930px" border="0" cellspacing="0" cellpadding="0" bgcolor="${blog_des.bgcolor}" align="center" title="��α׸���">
	<tr valign="middle" height="5px">
		<td  height="" width="100%" colspan="2" bgcolor="${blog_des.layout_color}"><b>${st.st_name}</b></td>
	</tr>
</table>
</body>
</html>