<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	
	function ack(){
		var f = document.getElementById("mbbs_article");
		f.target = "_content";
		f.method = "post";
		f.action = "add_store.do";
		f.submit();
	}
	
	function cancle(){
		var f = document.getElementById("mbbs_article");
		f.target = "_content";
		f.method = "get";
		f.action = "store.do?content=list";
		f.submit();
	}
</script>


<hr />
<b>main 게시판에 글쓰기</b>
<hr />

<f:form commandName="nbbs_Article" enctype = "multipart/form-data" >
	<table width="750px" class = "list_tb">
		<f:hidden path="admin_id" value="${member.id}"/>
		<tr>
			<td align="center" >글 제목 :</td>
			<td width = "85%">
			<f:input path = "notice_title" style="height: 19px; width: 615px" value = "${nbbs_Article.notice_title}"/>
			<f:errors path="notice_title"/>
			</td >
		</tr>
		<tr>
			<td align="center">글 쓰기 : </td>
			<td width = "85%">
				<f:textarea path="notice_content" cols="85" rows="15"/>
				<td><f:errors path="notice_content"/>
			</td>
		</tr>
</table>

<br/>
<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			<!--  <input type = "button" value = "등록" onclick="ack();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "취소" onclick="cancle();"/> -->
			<input type="submit" value="전송">
		</td>
		<td width="30%"></td>
	</tr>
</table>

</f:form>



</body>
</html>