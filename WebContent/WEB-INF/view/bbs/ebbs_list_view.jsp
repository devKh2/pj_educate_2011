<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/no_che.jspf"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>

<html>
<head>
<title>평가 게시글 목록</title>

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
	function del(articleId,stnum) {
		if (confirm("관리자님 삭제하시겠습니까?")) {
			location.href = "ebbs_delete.do?p=1&articleId=" + articleId+"&stnum="+stnum;
			alert('삭제하였습니다.');
		} else {
			alert('취소되었습니다.');
		}
	}
	
	function write_evaluation(user_id,user_name,member_type,stnum){
		if(confirm(user_name+"님 평가를 하시겠습니까?")){
			location.href="ebbs_write.do?stnum="+stnum;
		}else{
			alert('취소 하셨습니다.');
		}
	}
</script>
<body onload="resize()" bgcolor="${blog_des.bgcolor }">
<div id="content">
<form id="article">
<table align="center" frame="void" width="100%"  class = "list_tb" style="border-collapse:collapse;">
	<tr bgcolor="${blog_des.layout_color}">
		<td width="5%" align="center">번호</td>
		<td width="40%" align="center">평가글</td>
		<td width="10%" align="center">작성자</td>
		<td width="10%" align="center">작성일</td>
		<td width="30%" align="center">점수</td>
		<c:if test="${sessionScope.member.member_type eq 'administrator' }">
			<td width="5%" align="center">삭제</td>
		</c:if>

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
					<td align="center">${article.ebbs_title} <c:if
						test="${article.newArticleYN}">
						<img src="<c:url value="/images/new.jpg" />" width="35"
							height="15" border="0" />
					</c:if></td>
					<td align="center">${article.cu_id}</td>
					<td align="center">${article.ebbs_regdate}</td>
					<td align="left"><c:if test="${(article.ebbs_score/2)>0}">
						<c:forEach begin="1" end="${article.ebbs_score/2}">
							<img src="<c:url value="/images/star11.jpg" />" width="17"
								height="15" border="0" />
						</c:forEach>
						<c:if test="${(article.ebbs_score%2)>0}">
							<img src="<c:url value="/images/star10.jpg" />" width="17"
								height="15" border="0" />
						</c:if>
					</c:if></td>
					<c:if test ="${sessionScope.member.member_type eq 'administrator' }">
						<td align="center"><input type="button" value="삭제"
							onclick="del('${article.ebbs_artid}',${stnum})"></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</form>
<table align="center" frame="void" width="100%"  border="" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
	<tr>
		<td colspan="5"><c:if test="${beginPage > 10}">
			<a href="<c:url value="/ebbs_list.do?p=${beginPage-1}"/>">이전</a>
		</c:if> <c:forEach var="pno" begin="${beginPage}" end="${endPage}">
			<a href="<c:url value="/ebbs_list.do?p=${pno}" />">[${pno}]</a>
		</c:forEach> <c:if test="${endPage < listModel.totalPageCount}">
			<a
				href="<c:url value="/ebbs_list.do?p=${requestScope.endPage + 1}"/>">다음</a>
		</c:if>
		<input type="button" value="글쓰기" onclick="write_evaluation('${sessionScope.member.id}','${sessionScope.member.userName}','${sessionScope.member.member_type }',${stnum});"/></td>
	</tr>
</table>
</div>
</body>
</html>