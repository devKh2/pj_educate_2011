<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Store Info</title>
</head>
<script type="text/javascript">
function resize(){
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		 parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
	  }
}
</script>
<body onload="resize()">
<div id="content">
<form:form commandName="storeModel">
<table width="700px" align=center border="0">
		<!-- 블로그 탑 시작 -->
		<tr>
			<td colspan="6" align="left">상세 페이지</td>
		</tr>
		<tr>
			<td colspan="6">${storeModel.st_name} 입니다.</td>
		</tr>
		<!-- 블로그 탑 끝-->
		<!-- 가게 소개 페이지 시작-->
		<tr>
			<td rowspan="5" width="40%" colspan="4" align="center"><img
				src="${storeModel.st_picpath}" width="250" height="250" border="0" /><br>
			<font color="green">${storeModel.st_name}</font></td>
			<td width="30%" align="center" bgcolor="${blog_des.layout_color}"><font color="lightyellow"><b>업체명</b></font></td>
			<td width="30%" align="center">${storeModel.st_name}</td>
		</tr>
		<tr>
			<td width="30%" align="center" bgcolor="${blog_des.layout_color}"><font color="lightyellow"><b>업종</b></font></td>
			<td width="30%" align="center">${storeModel.st_type }</td>
		</tr>
		<tr>
			<td width="30%" align="center" bgcolor="${blog_des.layout_color}"><font color="lightyellow"><b>전화번호</b></font></td>
			<td width="30%" align="center">${storeModel.st_ownerph}</td>
		</tr>
		<tr>
			<td width="30%" align="center" bgcolor="${blog_des.layout_color}"><font color="lightyellow"><b>위치정보</b></font></td>
			<td width="30%" align="center">주소:${storeModel.st_detailaddr}
			</td>
		</tr>
		<tr>
			<td width="30%" align="center" bgcolor="${blog_des.layout_color}"><font color="lightyellow"><b>영업시간</b></font></td>
			<td width="30%" align="center">${storeModel.st_optime}</td>
		</tr>
</table>
<table>
	<tr>
		<td><img src="${blog_des.introduction_img_path}" width="100%" border="0" /></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
</table>
</form:form>
</div>
</body>
</html>