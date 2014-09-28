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
<script type="text/javascript">
function turnList(page,stnum){
	
	if(confirm("다시 돌아가시겠습니까?" )){
		location.href="sbbs_list.do?p="+page+"&stnum="+stnum;
		submit();
	}
	alert('취소되었습니다.');
}

function reply(parentId,page,stnum){
	if(confirm("답변을 쓰시겠습니까?")){
		location.href="sbbs_reply.do?parentId="+parentId+"&p="+page+"&stnum="+stnum;
		submit();
	}
	alert('취소되었습니다.');
}

function update_article(articleId,page,cu_id,userId,stnum){
	alert(userId + cu_id + articleId + page);
	if(confirm("수정을 하시겠습니까?")){
		if(cu_id==userId){
			alert('권한 유효');
			location.href="sbbs_update.do?articleId="+articleId+"&p="+page+"&articleCuId="+cu_id+"&stnum="+stnum;
			submit();
		}else{
			alert('권한이 없습니다.');
		}
	}else{
		alert('취소되었습니다.');
	}
}

function deleteArticle(articleId,page,cu_id,userId,stnum){
	alert(userId);
	alert(cu_id);
	if(confirm("삭제 하시겠습니까?")){
		if(cu_id==userId){
			alert('권한 유효');
			location.href="sbbs_delete.do?articleId="+articleId+"&p="+page+"&stnum="+stnum;
			submit();
		}else{
			alert('권한이 없습니다.');
		}
	}else{
		alert('취소되었습니다.');
	}
}

function administrator_deleteArticle(articleId,page,member_type,stnum){
	alert(member_type);
	if(confirm("관리 삭제를 하시겠습니까?")){
		location.href="sbbs_delete.do?articleId="+articleId+"&p="+page+"&stnum="+stnum;
		submit();
	}
	alert('취소되었습니다.');
}

function storeMember_deleteArticle(articleId,page,member_type,stnum){
	alert(member_type);
	if(confirm("관리 삭제를 하시겠습니까?")){
		location.href="sbbs_delete.do?articleId="+articleId+"&p="+page+"&stnum="+stnum;
		submit();
	}
	alert('취소되었습니다.');
}
function resize(){
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
	  }
}
</script>
</head>
<body onload="resize()">
<div id="content">
<table   frame="void" width="100%" class = "list_tb" style="border-collapse:collapse; ">
	<tr>
		<td colspan="2" height="100px">글보기</td>
	</tr>
	<tr>
		<td width="15%" align="center">제목</td>
		<td> ${requestScope.article.sbbs_title}</td>
	</tr>
	<tr>
		<td width="15%" align="center">작성자</td>
		<td> ${article.cu_id}</td>
	</tr>
	<tr>
		<td width="15%" align="center">작성일</td>
		<td> ${article.sbbs_regdate}</td>
	</tr>
		
	<tr>
		<td width="15%" align="center">내용</td>
		<td valign="top">
			<c:if test="${article.sbbs_picnum != 0 }">
			<img alt="" src="${article.sbbs_picpath }" width="300" />
			</c:if><br><c:out value="${article.sbbs_content}"/>
			</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="60%" align="left">
		<input type="button" value="목록보기"
			onclick="turnList(${param.p},${stnum});" />&nbsp;&nbsp;&nbsp; 
		<input type="button" value="답변쓰기"
			onclick="reply(${article.sbbs_artid},${param.p},${stnum});" />&nbsp;&nbsp;&nbsp; 
	<c:if test ="${article.cu_id eq sessionScope.member.id}">
		<input type="button" value="수정하기"
			onclick="update_article(${article.sbbs_artid},${param.p},'${article.cu_id}','${member.id}',${stnum});" />&nbsp;&nbsp;&nbsp;
		<input type="button" value="삭제하기"
			onclick="deleteArticle(${article.sbbs_artid},${param.p},'${article.cu_id}','${member.id}',${stnum});" />
	</c:if>
	<c:if test ="${sessionScope.member.member_type eq 'administrator' }">
		<input type = "button" value = "삭제하기" 
			onclick="administrator_deleteArticle(${article.sbbs_artid},${param.p},'${sessionScope.member.member_type}',${stnum});"/>
	</c:if>
	<c:if test ="${sessionScope.member.member_type eq 'storeMember'  }">
		<c:if test ="${sessionScope.member.st_num eq article.st_num }">
			<input type = "button" value = "삭제하기" 
			onclick="storeMember_deleteArticle(${article.sbbs_artid},${param.p},'${sessionScope.member.member_type}',${stnum});"/>
		</c:if>
	</c:if>
		</td>
	</tr>
</table>
</div>
</body>
</html>