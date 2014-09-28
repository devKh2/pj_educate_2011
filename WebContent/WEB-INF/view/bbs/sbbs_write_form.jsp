<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۾���</title>
<script type="text/javascript">
	function ack(){
		var f = document.getElementById("sbbs_article");
		f.target = "_content";
		f.method = "post";
		f.action = "add_store.do";
		f.submit();
	}
	
	function cancle(){
		var f = document.getElementById("sbbs_article");
		f.target = "_content";
		f.method = "get";
		f.action = "store.do?content=list";
		f.submit();
	}
	function resize(){
		var doc = document.getElementById('content');
		  if(doc.offsetHeight == 0){
		  } else {
			 pageheight = doc.offsetHeight;
			parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
		  }
	}
</script>
<style type="text/css">
input {
	border-style: solid;
}
</style>
</head>
<body onload="resize()">
<div id="content">
<f:form commandName="sbbs_Article" enctype = "multipart/form-data" >
	<table frame="void" width="95%" class = "list_tb" style="border-collapse:collapse; ">
	<tr>
	<td colspan="2"></td>
	</tr>
		<f:hidden path="st_type"value="�н�"/>
		<tr>
			<td align="center" bgcolor="${blog_des.layout_color}">�� ���� :</td>
			<td width = "85%">
			<f:input path = "sbbs_title" style="height: 19px; width: 615px" value = "${sbbs_Article.sbbs_title}"/>
			<f:errors path="sbbs_title"/>
			</td >
		</tr>
		
		<tr>
			<td align="center" bgcolor="${blog_des.layout_color}">�� ���� : </td>
			<td width = "85%">
				<select name = "sbbs_arttype">
					<option value = "����" selected>����</option>
					<option value = "����">����</option>
					<option value = "����">����</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="${blog_des.layout_color}">���� �ø��� : </td>
			<td width = "85%">
				<input type = "file" name = "file" value = "${sbbs_Article.sbbs_picpath}" style="height: 20px; width: 350px"/>
			</td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="${blog_des.layout_color}">�� ���� : </td>
			<td width = "85%">
				<f:textarea path="sbbs_content" cols="85" rows="15"/>
				<td><f:errors path="sbbs_content"/>
			</td>
		</tr>
</table>
<br/>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			<input type="submit" value="����">
		</td>
		<td width="30%"></td>
	</tr>
</table>

</f:form>
</div>
</body>
</html>