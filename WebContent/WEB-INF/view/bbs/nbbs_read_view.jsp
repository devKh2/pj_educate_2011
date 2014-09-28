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
	function turnList(page){
		
		if(confirm("�ٽ� ���ư��ðڽ��ϱ�?" )){
			location.href="nbbs_list.do?p="+page;
			submit();
		}
		alert('��ҵǾ����ϴ�.');
	}
	function update(articleId,page,articleCuId,memberId){
		if(confirm("���� �Ͻðڽ��ϱ�? " )){
			location.href="nbbs_update.do?articleId="+articleId+"&p="+page+"&articleCuId="+articleCuId+"&memberId="+memberId;
			submit();
		}
		alert('��ҵǾ����ϴ�.');
	}
	
	function deleteArticle(articleId,page){
		if(confirm("���� �Ͻðڽ��ϱ�?" )){
			location.href="nbbs_delete.do?articleId="+articleId+"&p="+page;
			submit();
		}
		alert('��ҵǾ����ϴ�.');
	}

</script>
<table width="750px" class = "list_tb">
	<tr>
		<td width="15%" align="center">����</td>
		<td>${requestScope.article.notice_title}</td>
	</tr>
	<tr>
		<td width="15%" align="center">�ۼ���</td>
		<td>${article.admin_id}</td>
	</tr>
	<tr>
		<td width="15%" align="center">�ۼ���</td>
		<td>${article.notice_regdate}</td>
	</tr>
	<tr>
		<td width="15%" align="center">����</td>
		<td><pre><c:out value="${article.notice_content}" /></pre></td>
	</tr>
</table>

<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="60%" align="left">
			<input type = "button" value = "��Ϻ���" onclick="turnList(${param.p});"/>&nbsp;&nbsp;&nbsp;
			<c:if test="${sessionScope.member.member_type eq 'administrator' }">
			<input type = "button" value = "�����ϱ�" onclick="update('${article.notice_artid}','${param.p}','${article.notice_artid}','${sessionScope.member.id }');"/>&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "�����ϱ�" onclick="deleteArticle('${article.notice_artid}','${param.p}');"/>
			</c:if>
		</td>
		<td width="40%"></td>
	</tr>
</table>



</body>
</html>