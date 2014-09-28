<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
<script type="text/javascript">
	function search(){
		var f = document.getElementById("search");
		f.method = "get";
		f.action = "master/guest.do?searchValue="+f.searchValue.value;
		f.submit();		
	}
	
	function del(id){
		var f = document.getElementById("search");
		if(confirm('정말 삭제 하시겠습니까?')){
			f.method = "post";
			f.action = "delete_member.do?id="+id;
			f.submit();
		}
	}
</script>
<hr />
<b>게시판 관리</b>
<hr />
<br />
<form id = "search">
<table width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="50%" align="center">
			<select name = "type" class="select_d">
				<option value = "mbbs" selected></option>
				<option value = "nbbs" >공지게시판</option>
				<option value = "sbbs" >가게게시판</option>
				<option value = "ebbs" >평가게시판</option>
			</select>
			<select name = "searchKey" class="select_d">
					<option value = "total_search">전체</option>
					<option value = "writer_search">작성자</option>
					<option value = "content_search">글 내용</option>
					<option value = "title_search">글제목</option>
			</select>
			<input type = "text" name = "searchValue" value = "${searchValue}"/>
			<div id="sear" style=""></div>
			&nbsp;&nbsp;
			<input type = "button" class = "b_style4" value = "검색" onclick = "search();"/>
		</td>
		<td width="50%"></td>
	</tr>
</table>
</form>
<hr />

<table width = "750px" class = "list_tb">
	<tr>
		<th width = "5%">번호</th>
		<th width = "12.5%">글종류</th>
		<th width = "10.5%">사진</th>
		<th width = "10.5%">제목</th>
		<th width = "19%">작성자</th>
		<th width = "10%">작성일</th>
		<th width = "25%">조회수</th>
		<th width=  "7.5%">삭제</th>
	</tr>
	<c:forEach var = "model" items = "${listmodel}">
	<tr>
		<td><c:out value="${rownum}" /><c:set var="rownum" value="${rownum-1}" /></td>
		<td><c:out value="${model.mbbs_arttype}"/></td>
		<c:if test="${model.mbbs_picnum == 0}">
		
		<td><img src="<c:url value="/images/NO_PHOTO.jpg" />" width="100" /></td>
		</c:if>
		<c:if test="${model.mbbs_picnum != 0}">
		<td><img alt="" src="${model.mbbs_picpath}" width="100" /></td>
		</c:if>
		<td>
					<c:if test="${model.level > 0}">
						<c:forEach begin="1" end="${model.level}">-</c:forEach>&gt;
						</c:if> 
						<c:set var="query"
						value="artId=${model.mbbs_artid}&p=${listModel.requestPage}" /> <a
						href="<c:url value="/mbbs_read.do?${query}"/>"> ${model.mbbs_title} <c:if
						test="${model.newArticleYN}">
						<img src="<c:url value="/images/new.jpg" />" width="35"
							height="15" border="0" />
					</c:if> </a>
		</td>
		<td>${model.cu_id}</td>
		<td>${model.mbbs_regdate}</td>
		<td>${model.mbbs_count}</td>
		<td><input type="button" value="삭제"></td>
	</tr>
	</c:forEach>
</table>

<table  width="750px" border = "0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200px"></td>
		<td width="350px" align="center">
		<c:if test="${beginPage >= 6}">
			<a href="master/guest.do?pageNum=${beginPage-1}">◁</a>
		</c:if>
		<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
		
		<c:if test = "${pno != memberList.requestPage }">
			<a href="master/guest.do?pageNum=${pno}&searchValue=${searchValue}&searchKey=${searchKey}" target="_content">
			<font color="blue">
		</c:if>
		[${pno}]</a></font>
		</c:forEach>
		<c:if test="${memberList.endPageNumber < memberList.totalPageCount}">
			<a href="master/guest.do?pageNum=${memberList.endPageNumber + 1}">▷</a>
		</c:if>
		</td>
		<td width="200px" align="right">총 ${memberList.totalPageCount}페이지 / 회원수 ${memberList.totalMenuCount}명</td>
</table>
</body>
</html>