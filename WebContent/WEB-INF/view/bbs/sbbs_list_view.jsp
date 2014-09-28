<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/no_che.jspf"%>
<%@ include file = "base_jspf.jspf" %>

<html>
<head>
<title>가게 게시글 목록</title>
<style type="text/css">
table {
	font-family:굴림체;
}
</style>
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
<style type="text/css">
a {
	text-decoration:none; cursor:auto;
}
</style>
</head>
<body onload="resize()">
<div id="content">
<table width="100%" border="1">
	<c:if test="${requestScope.listModel.totalPageCount > 0}">
		<tr>
			<td colspan="5" width="750"></td>
		</tr>
	</c:if>
</table>
<table frame="void" width="100%" class = "list_tb" style="border-collapse:collapse; ">
	<tr height="100px">
		<td colspan="7">
			가게 게시판
		</td>
	</tr>
	<tr>
		<td bgcolor="${blog_des.layout_color}" width="7%" align="center">번호</td>
		<td bgcolor="${blog_des.layout_color}" width="10%" align="center">글종류</td>
		<td bgcolor="${blog_des.layout_color}" width="15%" align="center">사진</td>
		<td bgcolor="${blog_des.layout_color}" width="40%" align="center">제목</td>
		<td bgcolor="${blog_des.layout_color}" width="10%" align="center">작성자</td>
		<td bgcolor="${blog_des.layout_color}" width="10%" align="center">작성일</td>
		<td bgcolor="${blog_des.layout_color}" width="8%" align="center">조회수</td>
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
					<td align="center"><c:out value="${article.sbbs_arttype}"/></td>
					<c:if test="${article.sbbs_picnum == 0}">
					<td><img src="<c:url value="/images/NO_PHOTO.jpg" />" width="100" /></td>
					</c:if>
					<c:if test="${article.sbbs_picnum != 0}">
					<td><img alt="" src="${article.sbbs_picpath}" width="100" height="100" /></td>
					</c:if>
					<td align="center"><c:if test="${article.level > 0}">
						<c:forEach begin="1" end="${article.level}">-</c:forEach>&gt;
						</c:if> 
					<c:set var="query"
						value="artId=${article.sbbs_artid}&p=${listModel.requestPage}&stnum=${stnum}" /> <a
						href="<c:url value="/sbbs_read.do?${query}"/>"> ${article.sbbs_title} <c:if
						test="${article.newArticleYN}">
						<img src="<c:url value="/images/new.jpg" />" width="35"
							height="15" border="0" />
					</c:if> </a></td>
					<td align="center">${article.cu_id}</td>
					<td align="center">${article.sbbs_regdate}</td>
					<td align="center">${article.sbbs_count}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<form method="POST" action="/peach/sbbs_list.do">
<table border="0" frame="void" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
			<tr>
				<td colspan="5"><c:if test="${beginPage > 10}">
					<a href="<c:url value="/sbbs_list.do?p=${beginPage-1}"/>">이전</a>
				</c:if> <c:forEach var="pno" begin="${beginPage}" end="${endPage}">
					<a href="<c:url value="/sbbs_list.do?p=${pno}" />">[${pno}]</a>
				</c:forEach> <c:if test="${endPage < listModel.totalPageCount}">
					<a href="<c:url value="/sbbs_list.do?p=${requestScope.endPage + 1}"/>">다음</a>
				</c:if></td>
			</tr>
	<tr>
		<td colspan="5" align="center"><select name="searchkind">
			<option value = "total_search">전체</option>
			<option value = "writer_search">작성자</option>
			<option value = "content_search">글 내용</option>
			<option value = "title_search">글제목</option>
		</select><input type="text" name="search" size="50" maxlength="30" value="${param.search }">
		  <input type="submit" value="검색"> <a href="<c:url value="/sbbs_write.do?stnum=${stnum}"/>">글쓰기</a></td>
	</tr>
</table>
</form>
</div>
</body>
</html>