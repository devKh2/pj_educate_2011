<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>

	var res1 = 1;

	//사진 확대 팝업창
	function picExpand (picPath){
		window.open('picExpand.do?picPath=' + picPath, 'pop', 'top=300, left=200, width=450, height=550, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=1')
	}
	
	function insert(){
		var res = check();
		if(res == -1){
			command.title.focus();
		}
		else{
			var f = document.getElementById("banner");
			var reply = confirm('등록하시겠습니까?');
			if(reply == true){
			f.submit();
			}
		}
	}
	
	//시간중복체크
	function timeCheck() {
		var f = document.getElementById("banner");
		var org_action = f.action;
		var org_target = f.target;
		f.target = "check_iframe";
		f.action = "banner_TimeCheck.do";
		f.submit();
		f.target = org_target;
		f.action = org_action;
	}
	
	function success() {
		res1 = 1;
		alert('사용할 수 있습니다');
	}

	function fail() {
		res1 = -1;
		alert('사용하실 수 없습니다');
		banner.title.focus();
	}
	
	function popDelete(ban_artid){
		var f = document.getElementById("command1");
		alert(ban_artid);
		var reply = confirm('삭제하시겠습니까?');
		if(reply == true){
			alert('banner_delete.do?ban_artid=' + ban_artid);
			f.action="banner_delete.do?ban_artid=" + ban_artid;
			f.submit();
		}	
	}
	
	function check(){
		var res = 1;
		var f = document.getElementById("banner");
		if(f.title.value == '' || f.startYear.value =='' || f.startMonth.value =='' || f.startDay.value =='' || f.startHour.value =='' || f.startMin.value =='' 
		|| f.endYear.value =='' || f.endMonth.value =='' || f.endDay.value =='' || f.endHour.value =='' || f.endMin.value ==''){
			alert('내용을 입력해주십시오');
			res = -1;
			return res;
		}
		
		if(f.file.value ==''){
			alert('사진을 넣어주세요');
			res = -1;
			return res;
		}
		if(f.position.value ==''){
			alert('위치를 선택해주세요');
			res = -1;
			return res;
		}
		if(f.startYear.value > f.endYear.value){
			alert('입력한 Year이 잘못되었습니다');
			res = -1;
			return res;
		}
		if(f.startYear.value == f.endYear.value){
			if(f.startMonth.value > f.endMonth.value){
				alert('입력한 Month가 잘못되었습니다');
				res = -1;
				return res;
			}
		}
		if(f.startYear.value == f.endYear.value){
			if(f.startMonth.value == f.endMonth.value){
				if(f.startDay.value > f.endDay.value ){
					alert('입력한 Day가 잘못되었습니다');
					res = -1;
					return res;
				}
			}
		}
		
		/*
		if(f.startYear.value == f.endYear.value){
			if(f.startYear.value == f.endYear.value){
				if(f.startDay.value == f.endDay.value){
					if(f.startHour.value > f.endHour.value){
						alert('입력한 Hour가 잘못되었습니다');
						res = -1;
						return res;
					}
				}
			}
		}
		
		if(f.startYear.value == f.endYear.value){
			if(f.startYear.value == f.endYear.value){
				if(f.startDay.value == f.endDay.value){
					if(f.startHour.value == f.endHour.value){
						if(f.startMin.value >= f.endMin.value){
							alert('입력한 Min이 잘못되었습니다');
							res = -1;
							return res;
						}
					}
				}
			}
		}
		*/
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>


<body>
<hr/>
배너 관리하기
<hr/>
<br/>
<!-- 
<table width="750px">
	<tr align="right">
		<td>
			<a href = "popup_regist.do">[팝업 등록 하기]</a>
		</td>
	</tr>
</table>
<br/>
 -->

<form action = "banner_regist.do" method = "post" id = "banner" name="banner" enctype = "multipart/form-data" >
[배너 등록 하기]
<br>
<br>
<table width="750px">
	<tr>
		<td width = "10%" >제목</td>
		<td><input type = "text" name = "title" size = 70 maxlength="50"> 
			위치&nbsp;&nbsp;<select name = "position">
					<option>선택</option>
					<option value = "center">가운데</option>
					<option value = "right">오른쪽</option>
				</select> </td>
	</tr>
	<tr>
		<td width = "10%" >적용기간</td>
		<td>
			<input type = "text" name = "startYear" size = 2 maxlength="4"> 년  
			<input type = "text" name = "startMonth" size = 2 maxlength="2"> 월
			<input type = "text" name = "startDay" size = 2 maxlength="2"> 일
			<input type = "text" name = "startHour" size = 2 maxlength="2"> 시 
			<input type = "text" name = "startMin" size = 2 maxlength="2"> 분 부터 
			  ~ 
			<input type = "text" name = "endYear" size = 2 maxlength="4"> 년
			<input type = "text" name = "endMonth" size = 2 maxlength="2"> 월
			<input type = "text" name = "endDay" size = 2 maxlength="2"> 일
			<input type = "text" name = "endHour" size = 2 maxlength="2"> 시 
			<input type = "text" name = "endMin" size = 2 maxlength="2"> 분 까지&nbsp;&nbsp;
			<input type="button" value="시간체크" onClick="javascript:timeCheck()"/>
		</td>
	</tr>
	<tr>
		<td >배경이미지</td>
		<td><input type = "file" name = "file" value = "이미지첨부" size="70"></td>
	</tr>
	
	<tr>
		<td>링크될 주소</td>
		<td>
			<input type = "text" name = "linkAddr" size = "70" value = "http://">
			<input type = "button" onClick = "javascript:insert()" value = "등록하기">
		</td>
	</tr>
</table>
<table width="650px">
	<tr align="right">
		<td>
		</td>
	</tr>
</table>
<br/>
</form>

<form action = "banner.do" method = "post">
<table width="750px">
	<tr align="right">
		<td width="50%" align="left">
			[등록된 배너리스트] </td>
		<td align="right">제목&nbsp;  
			<input type= "text" name = "search" value = "${param.search }" size = 10>
			<input type = "submit" value = "검색">
		</td>
	</tr>
</table>
</form>
<br/>

<form action = "banner_delete.do" method = "get" id ="command1" name = "command1">
<table width="750px" >
	<tr align="center" bgcolor="ffcc66">
		<td width = "5%" >No</td>
		<td width = "5%" >위치</td>
		<td width = "10%" >사진</td>
		<td width = "20%" >제목</td>
		<td width = "35%" >적용기간</td>
		<td width = "10%" >상태</td>
		<td width = "10%" >등록일</td>
		<td width = "5%"  >삭제</td>
	</tr>
</table>
<table width="750px" >	
	<c:choose>
		<c:when test = "${listModel.hasBanner == false }">
			<tr>
				<td align = "center">검색한 팝업리스트는 없습니다</td>
			</tr>
		</c:when>
	<c:otherwise>
		<c:forEach var = "banner" items = "${listModel.list}">
			<tr>
				<td width="5%" align="center">${banner.ban_artid}</td>
				<td width="5%" align="center">${banner.ban_position}</td>
				<td width="10%" align="center"><a href = "javascript:picExpand('${banner.ban_picpath}');"><img src = "${banner.ban_picpath}" width = "80px" height="60px"/></a></td>
				<td width="20%" align="center">${banner.ban_title}</td>
				<td width="35%" align="center">${banner.ban_startDate} ~ ${banner.ban_endDate}</td>
				<td width="10%" align="center">${banner.ban_situation}</td>
				<td width="10%" align="center">${banner.ban_registDate}</td>
				<td width="10%" align="center"><a href="javascript:popDelete('${banner.ban_artid}');"><b>ⅹ</b></a></td>
			</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</form>

<br/>
<table width="750px" >
	<tr align="center">
		<td>
			<c:if test = "$beginPage > 10}">
				<a href = "<c:url value = "/master/banner.do?p=${beginPage - 1}"/>">이전</a>
			</c:if>
			
			<c:forEach var = "pno" begin="${beginPage}" end = "${endPage}">
				<a href = "<c:url value = "/master/banner.do?p=${pno}&search = ${param.search}"/>">[${pno}]</a>
			</c:forEach>
			<c:if test="${endPage < listModel.totalPageCount}">
				<a href="<c:url value="/master/banner.do?p=${endPage + 1}"/>">다음</a>
			</c:if>
		</td>
	</tr>
</table>
<iframe id="check_iframe" name="check_iframe" src="" style="display:none;"></iframe> 
</body>
</html>