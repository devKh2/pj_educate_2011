<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="/include/no_che.jspf"%>
<%@ page import="java.lang.String"%>
<%@ page import="model.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>
<html>
<head>

<title>�� �б�</title>

</head>
<body>
<script type="text/javascript">
	function turnList(){
		location.href="mbbs_list.do?p=1";
		if(!confirm("�ٽ� ���ư��ðڽ��ϱ�?" )){
			
		}
		submit();
		
		
	}
	
	function reply(){
		alert("����");
		
		
	}
	
	function update(){
		
	}
	
	function deleteArticle(){
		
	}

</script>
<table class = "list_tb">
	<tr>
		<td>����</td>
		<td>${requestScope.article.mbbs_title}</td>
	</tr>
	<tr>
		<td>�ۼ���</td>
		<td>${article.cu_id}</td>
	</tr>
	<tr>
		<td>�ۼ���</td>
		<td>${article.mbbs_regdate}</td>
	</tr>
	<tr>
		<td>����</td>
		<c:if test="${article.mbbs_picnum == 0}">
			<td>${article.mbbs_picnum }</td>
		</c:if>
		<c:if test="${article.mbbs_picnum != 0 }">
			<td><img alt="" src="${article.mbbs_picpath }" width="300" /></td>
		</c:if>
	<tr>
		<td>����</td>
		<td><pre><c:out value="${article.mbbs_content}" /></pre></td>
	</tr>
	<tr>
		<td colspan="2"><a
			href="<c:url value="/mbbs_list.do?p=${param.p}"/>">��Ϻ���</a> <a
			href="<c:url value="/mbbs_reply.do?parentId=${article.mbbs_artid}&p=${param.p}"/>">�亯����</a>
		<c:if test="${(article.cu_id eq member.id)}">
			<a
				href="<c:url value="/mbbs_update.do?articleId=${article.mbbs_artid}&p=${param.p}&articleCuId=${article.mbbs_artid}"/>">�����ϱ�</a>
			<a
				href="<c:url value="/mbbs_delete.do?articleId=${article.mbbs_artid}&p=${param.p}"/>">�����ϱ�</a>
		</c:if></td>
	</tr>
</table>

<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="20%"></td>
		<td width="60%" align="center">
			<input type = "button" value = "��Ϻ���" onclick="turnList();"/>&nbsp;&nbsp;&nbsp;
		
			<input type = "button" value = "�亯����" onclick="reply();"/>&nbsp;&nbsp;&nbsp;
			
			<input type = "button" value = "�����ϱ�" onclick="update();"/>&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "�����ϱ�" onclick="deleteArticle();"/>
		</td>
		<td width="20%"></td>
	</tr>
</table>
</body>
</html>