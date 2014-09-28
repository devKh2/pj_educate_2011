<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "base_jspf.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script>

	//상호 검색 버튼을 눌렀을시에
	//menuModel을 controller로 넘겨 준다.
	function stName() {
		var f = document.getElementById("menuModel");
		var winopts = "width=200px,height=450px,toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes";
		window.open('', 'viewer', 'winopts');
		f.target = "viewer";
		f.action = "stName.do";
		f.method = "post";
		f.submit();
	}
	
	//확인 버튼을 눌렀을시에
	//menuModel을 controller로 넘겨 준다.
	function ack(){
		var f = document.getElementById("menuModel");
		f.target = "_content";
		f.method = "post";
		f.action = "add_ack.do";
		f.submit();
	}
	
	//취소 버튼을 눌렀을시에 list 페이지로 넘어간다.
	function cancle(){
		var f = document.getElementById("menuModel");
		f.target = "_content";
		f.method = "get";
		f.action = "menu.do?content=list";
		f.submit();
	}
	
</script>

<hr />
<b>메뉴 등록</b>
<hr />
<br />
<f:form commandName = "menuModel" enctype = "multipart/form-data">
<table width="750px" class="list2_tb">
	<tr>
		<th>상 품 명</th>
		<f:hidden path = "menu_num" value = "${menuModel.menu_num }"/>
		<td width = "83%">
		<f:input id="menu_name" path = "menu_name" style="height: 20px; width: 250px" value = "${menuModel.menu_name }"/>
		<f:errors path="menu_name" />
		</td>
	</tr>
	<tr>
		<th>상 호 명</th>
		<td width = "83%">
			<f:hidden path = "st_num" value = "${menuModel.st_num }"/>
			<f:input path = "st_name" readonly="true" value = "${menuModel.st_name }" style="height: 20px; width: 150px"/>
			<c:if test = "${!updateFlag }">
				<input type = "button" value = "상호검색" onclick="stName();"/>
			</c:if>
			<f:errors path="st_name" />
		</td>
	</tr>
	<tr>
		<th>상품 이미지</th>
		<td width = "83%"><input type = "file" name = "file" value = "${menuModel.menu_picpath }" style="height: 20px; width: 350px"/></td>
	</tr>
	<tr>
		<th>가 격</th>
		<td width = "83%">
			<f:input path = "menu_price" value = "${menuModel.menu_price }" style="height: 20px; width: 100px"/>
			<f:errors path="menu_price" /> 
		</td>
	</tr>
	<tr>
		<th>코멘트</th>
		<td width = "83%" height="50px">
			<textarea id = "menu_comment" name = "menu_comment"  style="height: 50px; width: 600px">${menuModel.menu_comment }</textarea> 
		</td>
	</tr>
</table>
<br/>
<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			<input type = "button" value = "등록" onclick="ack();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "취소" onclick = "cancle();"/>
		</td>
		<td width="30%"></td>
	</tr>
</table>
</f:form>
</body>
</html>