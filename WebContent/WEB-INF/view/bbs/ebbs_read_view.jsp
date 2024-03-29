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
	function turnList(){
		location.href="mbbs_list.do?p=1";
		if(!confirm("다시 돌아가시겠습니까?" )){
			
		}
		submit();
		
		
	}
	
	function reply(){
		alert("수고");
		
		
	}
	
	function update(){
		
	}
	
	function deleteArticle(){
		
	}

</script>
<table class = "list_tb">
	<tr>
		<td>제목</td>
		<td>${requestScope.article.mbbs_title}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${article.cu_id}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${article.mbbs_regdate}</td>
	</tr>
	<tr>
		<td>사진</td>
		<c:if test="${article.mbbs_picnum == 0}">
			<td>${article.mbbs_picnum }</td>
		</c:if>
		<c:if test="${article.mbbs_picnum != 0 }">
			<td><img alt="" src="${article.mbbs_picpath }" width="300" /></td>
		</c:if>
	<tr>
		<td>내용</td>
		<td><pre><c:out value="${article.mbbs_content}" /></pre></td>
	</tr>
	<tr>
		<td colspan="2"><a
			href="<c:url value="/mbbs_list.do?p=${param.p}"/>">목록보기</a> <a
			href="<c:url value="/mbbs_reply.do?parentId=${article.mbbs_artid}&p=${param.p}"/>">답변쓰기</a>
		<c:if test="${(article.cu_id eq member.id)}">
			<a
				href="<c:url value="/mbbs_update.do?articleId=${article.mbbs_artid}&p=${param.p}&articleCuId=${article.mbbs_artid}"/>">수정하기</a>
			<a
				href="<c:url value="/mbbs_delete.do?articleId=${article.mbbs_artid}&p=${param.p}"/>">삭제하기</a>
		</c:if></td>
	</tr>
</table>

<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="20%"></td>
		<td width="60%" align="center">
			<input type = "button" value = "목록보기" onclick="turnList();"/>&nbsp;&nbsp;&nbsp;
		
			<input type = "button" value = "답변쓰기" onclick="reply();"/>&nbsp;&nbsp;&nbsp;
			
			<input type = "button" value = "수정하기" onclick="update();"/>&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "삭제하기" onclick="deleteArticle();"/>
		</td>
		<td width="20%"></td>
	</tr>
</table>
</body>
</html>