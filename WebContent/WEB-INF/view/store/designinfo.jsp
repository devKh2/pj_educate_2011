<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>디자인 관리</title>
</head>
<script type="text/javascript">
var dlgHelper;
function init(){
	if (dlgHelper==null)
	{
		dlgHelper = document.createElement("OBJECT");
		dlgHelper.classid = "clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b";
		dlgHelper.style.width = 0;
		dlgHelper.style.height = 0;
		document.body.appendChild(dlgHelper);
	}
}
function resize(){
	 init();
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		 parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
	  }
}
function callColorDlg(mode) {
	var sColor = dlgHelper.ChooseColorDlg();
 
	sColor = sColor.toString(16);
 
	if(sColor.length < 6) {
		var sTempString = '000000'.substring(0,6-sColor.length);
		sColor = sTempString.concat(sColor);
	}
 
	if(sColor == '000000') {
		sColor = "020202";
	}
	if(mode=='bg'){
		document.blog_des.bgcolor.value = '#'+sColor;
	}else{
		document.blog_des.layout_color.value = '#'+sColor;
	}
}
</script>
<body onload="resize()" bgcolor="${blog_des.bgcolor }" >
<f:form commandName="blog_des" name="blog_des" enctype = "multipart/form-data" >
<div id="content">
<table width="100%" cellpadding="1" bordercolor="gray" cellspacing="1">
	<tr height="100px"> 
		<td colspan="2">디자인 관리</td>
	</tr>
	<tr bgcolor="${blog_des.layout_color}"> 
		<td colspan="2">이미지</td>
	</tr>
	<tr > 
		<td bgcolor="${blog_des.layout_color}">메인 상단 로고</td>
		<td><input type = "file" id="file1" name="file1" value = "0" style="height: 20px; width: 350px"/></br>700px X 100px 크기를 권장 합니다.</td>
	</tr>
	<tr > 
		<td bgcolor="${blog_des.layout_color}">좌측 상단 로고</td>
		<td><input type = "file" id="file2" name="file2" value = "0" style="height: 20px; width: 350px"/></br>150px X 100px 크기를 권장 합니다.</td>
	</tr>
	<tr > 
		<td bgcolor="${blog_des.layout_color}">소개 이미지</td>
		<td><input type = "file" id = "file3" name="file3" value = "0" style="height: 20px; width: 350px"/></br>150px X 100px 크기를 권장 합니다.</td>
	</tr>
	<tr bgcolor="${blog_des.layout_color}"> 
		<td colspan="2">색상</td>
	</tr>
	<tr > 
		<td bgcolor="${blog_des.layout_color}">전경색</td>
		<td><input type="text"  name="bgcolor" id="bgcolor" value="${blog_des.bgcolor}" readonly="readonly"/>
			<input type="button" value="선택" onclick="callColorDlg('bg')"/></td>
	</tr>
	<tr > 
		<td bgcolor="${blog_des.layout_color}">레이아웃 색상</td>
		<td><input type="text"  name="layout_color" id="layout_color" value="${blog_des.layout_color}" readonly="readonly"/>
			<input type="button" value="선택" onclick="callColorDlg('lo')"/></td>
	</tr>
	<tr > 
	<f:hidden path="main_top_logo"/>
	<f:hidden path="left_top_logo"/>
	<f:hidden path="introduction_img"/>
		<td colspan="2"><input type="submit" value="수정"></td>
	</tr>
</table>
</div>
</f:form>
</body>
</html>