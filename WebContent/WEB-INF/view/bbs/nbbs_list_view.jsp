<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/no_che.jspf"%>
<%@ include file = "base_jspf.jspf" %>
<html>
<head>
<title>공지 게시글 목록</title>

</head>
<body>
<script type="text/javascript">
	function write_notice(user_id){
		alert(user_id);
		if(confirm("공지 작성을 하시겠습니까?" )){
			location.href="nbbs_write.do";
			submit();
		}
		alert('취소되었습니다.');
	}

</script>
<hr />
<b>공지 게시판</b>
<hr />

<table width="750px" class = "list_tb">

	<c:if test="${requestScope.listModel.totalPageCount > 0}">
		<tr>
			<td colspan="5" width="750">${listModel.startRow}-${listModel.endRow}
			[${listModel.requestPage}/${listModel.totalPageCount}]</td>
		</tr>
	</c:if>
</table>
<table width="750px" class = "list_tb">
	<tr>
		<td width="10%" align="center">번호</td>
		<td width="60%" align="center">제목</td>
		<td width="10%" align="center">작성자</td>
		<td width="10%" align="center">작성일</td>
		<td width="10%" align="center">조회수</td>
	</tr>
	<c:choose>
		<c:when test="${requestScope.listModel.hasArticle == false}">
			<tr>
				<td colspan="5" align="center">게시글이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="article" items="${listModel.articleList}">
				<tr>
					<td align="center"><c:out value="${rownum}" /></td>
					<c:set var="rownum" value="${rownum-1}" />
					<td align="center">
					<c:set var="query"
						value="artId=${article.notice_artid}&p=${listModel.requestPage}" /> <a
						href="<c:url value="/nbbs_read.do?${query}"/>"> ${article.notice_title} <c:if
						test="${article.newArticleYN}">
						<img src="<c:url value="/images/new.jpg" />" width="35"
							height="15" border="0" />
					</c:if> </a></td>
					<td align="center">${article.admin_id}</td>
					<td align="center">${article.notice_regdate}</td>
					<td align="center">${article.notice_count}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<table width="750px" >
			<tr>
				<td colspan="5"><c:if test="${beginPage > 10}">
					<a href="<c:url value="/nbbs_list.do?p=${beginPage-1}"/>">이전</a>
				</c:if> <c:forEach var="pno" begin="${beginPage}" end="${endPage}">
					<a href="<c:url value="/nbbs_list.do?p=${pno}" />">[${pno}]</a>
				</c:forEach> <c:if test="${endPage < listModel.totalPageCount}">
					<a href="<c:url value="/nbbs_list.do?p=${requestScope.endPage + 1}"/>">다음</a>
				</c:if></td>
			</tr>
</table>
<c:if test="${sessionScope.member.member_type eq 'administrator' }">
<input type = "button" value = "글쓰기" 
				onclick="write_notice('${sessionScope.member.id}');"/>
</c:if>
<form method="POST" action="/peach/nbbs_list.do">
<table  width="750px" >
	<tr>
		<td><select name="searchkind">
			<option value = "total_search">전체</option>
			<option value = "content_search">글 내용</option>
			<option value = "title_search">글제목</option>
		</select> <td><input type="text" name="search" size="50" maxlength="30"
			value="${param.search }">
      <input type="submit" value="검색">
      </td>
   </tr>
</table>
</form>
<br />


</body>
</html>