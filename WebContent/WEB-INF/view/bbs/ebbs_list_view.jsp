<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/no_che.jspf"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>

<html>
<head>
<title>�� �Խñ� ���</title>

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
		if (confirm("�����ڴ� �����Ͻðڽ��ϱ�?")) {
			location.href = "ebbs_delete.do?p=1&articleId=" + articleId+"&stnum="+stnum;
			alert('�����Ͽ����ϴ�.');
		} else {
			alert('��ҵǾ����ϴ�.');
		}
	}
	
	function write_evaluation(user_id,user_name,member_type,stnum){
		if(confirm(user_name+"�� �򰡸� �Ͻðڽ��ϱ�?")){
			location.href="ebbs_write.do?stnum="+stnum;
		}else{
			alert('��� �ϼ̽��ϴ�.');
		}
	}
</script>
<body onload="resize()" bgcolor="${blog_des.bgcolor }">
<div id="content">
<form id="article">
<table align="center" frame="void" width="100%"  class = "list_tb" style="border-collapse:collapse;">
	<tr bgcolor="${blog_des.layout_color}">
		<td width="5%" align="center">��ȣ</td>
		<td width="40%" align="center">�򰡱�</td>
		<td width="10%" align="center">�ۼ���</td>
		<td width="10%" align="center">�ۼ���</td>
		<td width="30%" align="center">����</td>
		<c:if test="${sessionScope.member.member_type eq 'administrator' }">
			<td width="5%" align="center">����</td>
		</c:if>

	</tr>
	<c:choose>
		<c:when test="${requestScope.listModel.hasArticle == false}">
			<tr>
				<td colspan="5" align="center">�Խñ��� �����ϴ�.</td>
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
						<td align="center"><input type="button" value="����"
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
			<a href="<c:url value="/ebbs_list.do?p=${beginPage-1}"/>">����</a>
		</c:if> <c:forEach var="pno" begin="${beginPage}" end="${endPage}">
			<a href="<c:url value="/ebbs_list.do?p=${pno}" />">[${pno}]</a>
		</c:forEach> <c:if test="${endPage < listModel.totalPageCount}">
			<a
				href="<c:url value="/ebbs_list.do?p=${requestScope.endPage + 1}"/>">����</a>
		</c:if>
		<input type="button" value="�۾���" onclick="write_evaluation('${sessionScope.member.id}','${sessionScope.member.userName}','${sessionScope.member.member_type }',${stnum});"/></td>
	</tr>
</table>
</div>
</body>
</html>