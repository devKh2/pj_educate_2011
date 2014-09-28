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
			location.href="mbbs_list.do?p="+page;
			submit();
		}
		alert('��ҵǾ����ϴ�.');
	}
	
	function reply(parentId,page){
		if(confirm("�亯�� ���ðڽ��ϱ�?")){
			location.href="mbbs_reply.do?parentId="+parentId+"&p="+page;
			submit();
		}
		alert('��ҵǾ����ϴ�.');
	}
	
	function update(articleId,page,userId,cu_id){
		if(confirm("������ �Ͻðڽ��ϱ�?")){
			if(cu_id==userId){
				
				location.href="mbbs_update.do?articleId="+articleId+"&p="+page+"&cu_id="+cu_id;
				submit();
			}else{
				alert('������ �����ϴ�.');
			}
		}else{
			alert('��ҵǾ����ϴ�.');
		}
		
	}
	
	function deleteArticle(articleId,page,userId,cu_id){
		if(confirm("���� �Ͻðڽ��ϱ�?")){
			if(cu_id==userId){
				location.href="mbbs_delete.do?articleId="+articleId+"&p="+page;
				submit();
			}else{
				alert('������ �����ϴ�.');
			}
		}else{
			alert('��ҵǾ����ϴ�.');
		}
	}
	
	function administrator_deleteArticle(articleId,page,member_type){
		alert(member_type);
		if(confirm("���� ������ �Ͻðڽ��ϱ�?")){
			location.href="mbbs_delete.do?articleId="+articleId+"&p="+page;
			submit();
		}
		alert('��ҵǾ����ϴ�.');
	}

</script>


<table width="750px"  class = "list_tb">
	<tr>
		<td width="15%" align="center">����</td>
		<td>${requestScope.article.mbbs_title}</td>
	</tr>
	<tr>
		<td width="15%" align="center">�ۼ���</td>
		<td>${article.cu_id}</td>
	</tr>
	<tr>
		<td width="15%" align="center">�ۼ���</td>
		<td>${article.mbbs_regdate}</td>
	</tr>
	<tr>
		<c:if test="${article.mbbs_picnum != 0 }">
		<td width="15%" align="center">����</td>
			<td><img alt="" src="${article.mbbs_picpath }" width="300" /></td>
		</c:if>
	<tr>
		<td width="15%" align="center">����</td>
		<td><pre><c:out value="${article.mbbs_content}" /></pre></td>
	</tr>
	
</table>

<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="60%" align="left">
			<input type = "button" value = "��Ϻ���" onclick="turnList(${param.p});"/>&nbsp;&nbsp;&nbsp;
		
			<input type = "button" value = "�亯����" onclick="reply(${article.mbbs_artid},${param.p});"/>
			&nbsp;&nbsp;&nbsp;
		<c:if test ="${article.cu_id eq sessionScope.member.id}">
			<input type = "button" value = "�����ϱ�" 
				onclick="update(${article.mbbs_artid},${param.p},'${sessionScope.member.id}','${article.cu_id}');"/>
			&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "�����ϱ�" onclick="deleteArticle(${article.mbbs_artid},${param.p},'${sessionScope.member.id}','${article.cu_id}');"/>
			&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:if test ="${sessionScope.member.member_type eq 'administrator' }">
			<input type = "button" value = "�����ϱ�" onclick="administrator_deleteArticle(${article.mbbs_artid},${param.p},'${sessionScope.member.member_type}');"/>
		</c:if>
		</td>
		<td width="40%"></td>
	</tr>
</table>
</body>
</html>