<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="/include/no_che.jspf"%>
<%@ page import="java.lang.String"%>
<%@ page import="model.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>
<html>
<head>

<title>글 읽기</title>

</head>
<body>
<script type="text/javascript">
	function turnList(page){
		
		if(confirm("다시 돌아가시겠습니까?" )){
			location.href="nbbs_list.do?p="+page;
			submit();
		}
		alert('취소되었습니다.');
	}
	function update(articleId,page,articleCuId,memberId){
		if(confirm("수정 하시겠습니까? " )){
			location.href="nbbs_update.do?articleId="+articleId+"&p="+page+"&articleCuId="+articleCuId+"&memberId="+memberId;
			submit();
		}
		alert('취소되었습니다.');
	}
	
	function deleteArticle(articleId,page){
		if(confirm("삭제 하시겠습니까?" )){
			location.href="nbbs_delete.do?articleId="+articleId+"&p="+page;
			submit();
		}
		alert('취소되었습니다.');
	}

</script>
<table width="750px" class = "list_tb">
	<tr>
		<td width="15%" align="center">제목</td>
		<td>${requestScope.article.notice_title}</td>
	</tr>
	<tr>
		<td width="15%" align="center">작성자</td>
		<td>${article.admin_id}</td>
	</tr>
	<tr>
		<td width="15%" align="center">작성일</td>
		<td>${article.notice_regdate}</td>
	</tr>
	<tr>
		<td width="15%" align="center">내용</td>
		<td><pre><c:out value="${article.notice_content}" /></pre></td>
	</tr>
</table>

<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="60%" align="left">
			<input type = "button" value = "목록보기" onclick="turnList(${param.p});"/>&nbsp;&nbsp;&nbsp;
			<c:if test="${sessionScope.member.member_type eq 'administrator' }">
			<input type = "button" value = "수정하기" onclick="update('${article.notice_artid}','${param.p}','${article.notice_artid}','${sessionScope.member.id }');"/>&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "삭제하기" onclick="deleteArticle('${article.notice_artid}','${param.p}');"/>
			</c:if>
		</td>
		<td width="40%"></td>
	</tr>
</table>



</body>
</html>