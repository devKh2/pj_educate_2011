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
			location.href="mbbs_list.do?p="+page;
			submit();
		}
		alert('취소되었습니다.');
	}
	
	function reply(parentId,page){
		if(confirm("답변을 쓰시겠습니까?")){
			location.href="mbbs_reply.do?parentId="+parentId+"&p="+page;
			submit();
		}
		alert('취소되었습니다.');
	}
	
	function update(articleId,page,userId,cu_id){
		if(confirm("수정을 하시겠습니까?")){
			if(cu_id==userId){
				
				location.href="mbbs_update.do?articleId="+articleId+"&p="+page+"&cu_id="+cu_id;
				submit();
			}else{
				alert('권한이 없습니다.');
			}
		}else{
			alert('취소되었습니다.');
		}
		
	}
	
	function deleteArticle(articleId,page,userId,cu_id){
		if(confirm("삭제 하시겠습니까?")){
			if(cu_id==userId){
				location.href="mbbs_delete.do?articleId="+articleId+"&p="+page;
				submit();
			}else{
				alert('권한이 없습니다.');
			}
		}else{
			alert('취소되었습니다.');
		}
	}
	
	function administrator_deleteArticle(articleId,page,member_type){
		alert(member_type);
		if(confirm("관리 삭제를 하시겠습니까?")){
			location.href="mbbs_delete.do?articleId="+articleId+"&p="+page;
			submit();
		}
		alert('취소되었습니다.');
	}

</script>


<table width="750px"  class = "list_tb">
	<tr>
		<td width="15%" align="center">제목</td>
		<td>${requestScope.article.mbbs_title}</td>
	</tr>
	<tr>
		<td width="15%" align="center">작성자</td>
		<td>${article.cu_id}</td>
	</tr>
	<tr>
		<td width="15%" align="center">작성일</td>
		<td>${article.mbbs_regdate}</td>
	</tr>
	<tr>
		<c:if test="${article.mbbs_picnum != 0 }">
		<td width="15%" align="center">사진</td>
			<td><img alt="" src="${article.mbbs_picpath }" width="300" /></td>
		</c:if>
	<tr>
		<td width="15%" align="center">내용</td>
		<td><pre><c:out value="${article.mbbs_content}" /></pre></td>
	</tr>
	
</table>

<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="60%" align="left">
			<input type = "button" value = "목록보기" onclick="turnList(${param.p});"/>&nbsp;&nbsp;&nbsp;
		
			<input type = "button" value = "답변쓰기" onclick="reply(${article.mbbs_artid},${param.p});"/>
			&nbsp;&nbsp;&nbsp;
		<c:if test ="${article.cu_id eq sessionScope.member.id}">
			<input type = "button" value = "수정하기" 
				onclick="update(${article.mbbs_artid},${param.p},'${sessionScope.member.id}','${article.cu_id}');"/>
			&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "삭제하기" onclick="deleteArticle(${article.mbbs_artid},${param.p},'${sessionScope.member.id}','${article.cu_id}');"/>
			&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test ="${sessionScope.member.member_type eq 'administrator' }">
			<input type = "button" value = "삭제하기" onclick="administrator_deleteArticle(${article.mbbs_artid},${param.p},'${sessionScope.member.member_type}');"/>
		</c:if>
		</td>
		<td width="40%"></td>
	</tr>
</table>
</body>
</html>