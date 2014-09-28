<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script>
	function zipSearch(sido ,gugun , dong , bunji){
		var address = sido + gugun + dong + bunji;
		opener.document.getElementById("order").preAddress.value = address;
		opener.document.getElementById("order").tailAddress.value ="";
		self.close();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주소 찾기</title>
</head>
<body>
<table width = "500px">
	<tr>
		<td>우편번호 조회</td>
		<td></td>
	</tr>
	<tr>
		<td>
			<form action = "/peach/order/post.do" method = "post">
			<table>
				<tr>
					<td width = "10%"></td>
					<td width = "20%">지역명</td>
					<td><input type = "text"  size = "20" name = "searchDong" value = "${param.searchDong }">
						<input type = "submit" value = "검색"/>
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td>				
		<c:choose>
			<c:when test = "${listModel.hasPost == false }">
			<table >
				<tr>
					<td align="center">결과 값이 없습니다.</td>
				</tr>
			</table>
			</c:when>
		<c:otherwise>
			<table border = 1 bordercolor = "red"  width = "500px">
					<tr>
						<!-- <td width = "10%">선택</td>  -->
						<td width = "20%" align = "center">번지 수</td>
						<td align = "center">기본 주소</td>
					</tr>
				<c:forEach var = "post" items = "${listModel.postList}">
					<tr>
						<!-- <td align = "center"><input type="radio" name="radiobutton" radio="radiobutton"checked></td>  -->
						<td><a href="javascript:zipSearch('${post.sido }' , '${post.gugun }' , '${post.dong }' , '${post.bunji }');" }>${post.zipcode }</a> </td>
						
						<td>${post.sido }${post.gugun }${post.dong }${post.bunji }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
		</c:choose>
			
		</td>
	</tr>
	

</table>

</body>
</html>