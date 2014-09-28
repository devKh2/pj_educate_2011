<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>기본 정보 수정</title>
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
function post(){
	var f = document.getElementById("storeModel");
	var winopts = "width=200px,height=450px,toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes";
	window.open('master/post.do', 'viewer', 'winopts');
}
function modified(st_num){
	var f = document.getElementById("storeModel");
	f.method = "post";
	f.action = "modify_store.do?st_num="+st_num;
	f.submit();
}
</script>
<body onload="resize()" bgcolor="${blog_des.bgcolor}">
<f:form commandName="storeModel" enctype = "multipart/form-data">
<div id="content">
<table>
<tr height="100px">
	<td colspan="2">기본 정보 수정</td>
</tr>
<tr>
	<td colspan="2"><font color="red">(*)</font>는 수정 하실 수 없습니다.</td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">가게이름</td>
	<input type="hidden" id="stnum" value="${params.stnum}"/>
	<td><f:input path="st_name"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">업종</td>
	<td><f:select path="st_type">
		<f:options items="${option}"/>
	</f:select>
			</td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">업주</td>
	<td><f:input path="st_owner"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">가게이미지</td>
	<td><input type = "file" name = "file" value = "${storeModel.st_picpath }" style="height: 20px; width: 350px"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">연락처 HP</td>
	<td><f:input path="st_ownerph"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">연락처 STORE_PHONE</td>
	<td><f:input path="st_ph"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}"><font color="red">(*)</font>사업자 번호</td>
	<td><f:input readonly="readonly" path="biz01"/>-<f:input readonly="readonly" path="biz02"/> - <f:input readonly="readonly" path="biz03"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">우편번호</td>
	<td><f:input path="st_post"/> <input type="button" value="주소찾기" onclick="post()"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">주소</td>
	<td><f:input readonly="readonly" path="st_detailaddr" size="50"/></td>
	<f:hidden path = "st_sido" value = "${sotreModel.st_sido}"/>
	<f:hidden path = "st_gugun" value = "${sotreModel.st_gugun}"/>
	<f:hidden path = "st_dong" value = "${sotreModel.st_dong}"/>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">상세 주소</td>
	<td><f:input path="st_addr"/></td>
</tr>
<tr>
	<td bgcolor="${blog_des.layout_color}">배달 가능 거리 <font color="red">단위(반경/KM)</font></td>
	<td><f:input path="restrictDistance" size="20" /></td>
</tr>
	<f:hidden path="st_num"/>
	<f:hidden path="owner_id"/>
<tr>
	<td colspan="2"><input type="button" value="수정하기" onclick="modified('${storeModel.st_num}')"/></td>
</tr>
</table>
</div>
</f:form>
</body>
</html>