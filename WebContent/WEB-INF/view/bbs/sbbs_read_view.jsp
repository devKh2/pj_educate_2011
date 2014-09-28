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
<script type="text/javascript">
function turnList(page,stnum){
	
	if(confirm("�ٽ� ���ư��ðڽ��ϱ�?" )){
		location.href="sbbs_list.do?p="+page+"&stnum="+stnum;
		submit();
	}
	alert('��ҵǾ����ϴ�.');
}

function reply(parentId,page,stnum){
	if(confirm("�亯�� ���ðڽ��ϱ�?")){
		location.href="sbbs_reply.do?parentId="+parentId+"&p="+page+"&stnum="+stnum;
		submit();
	}
	alert('��ҵǾ����ϴ�.');
}

function update_article(articleId,page,cu_id,userId,stnum){
	alert(userId + cu_id + articleId + page);
	if(confirm("������ �Ͻðڽ��ϱ�?")){
		if(cu_id==userId){
			alert('���� ��ȿ');
			location.href="sbbs_update.do?articleId="+articleId+"&p="+page+"&articleCuId="+cu_id+"&stnum="+stnum;
			submit();
		}else{
			alert('������ �����ϴ�.');
		}
	}else{
		alert('��ҵǾ����ϴ�.');
	}
}

function deleteArticle(articleId,page,cu_id,userId,stnum){
	alert(userId);
	alert(cu_id);
	if(confirm("���� �Ͻðڽ��ϱ�?")){
		if(cu_id==userId){
			alert('���� ��ȿ');
			location.href="sbbs_delete.do?articleId="+articleId+"&p="+page+"&stnum="+stnum;
			submit();
		}else{
			alert('������ �����ϴ�.');
		}
	}else{
		alert('��ҵǾ����ϴ�.');
	}
}

function administrator_deleteArticle(articleId,page,member_type,stnum){
	alert(member_type);
	if(confirm("���� ������ �Ͻðڽ��ϱ�?")){
		location.href="sbbs_delete.do?articleId="+articleId+"&p="+page+"&stnum="+stnum;
		submit();
	}
	alert('��ҵǾ����ϴ�.');
}

function storeMember_deleteArticle(articleId,page,member_type,stnum){
	alert(member_type);
	if(confirm("���� ������ �Ͻðڽ��ϱ�?")){
		location.href="sbbs_delete.do?articleId="+articleId+"&p="+page+"&stnum="+stnum;
		submit();
	}
	alert('��ҵǾ����ϴ�.');
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
		<td colspan="2" height="100px">�ۺ���</td>
	</tr>
	<tr>
		<td width="15%" align="center">����</td>
		<td> ${requestScope.article.sbbs_title}</td>
	</tr>
	<tr>
		<td width="15%" align="center">�ۼ���</td>
		<td> ${article.cu_id}</td>
	</tr>
	<tr>
		<td width="15%" align="center">�ۼ���</td>
		<td> ${article.sbbs_regdate}</td>
	</tr>
		
	<tr>
		<td width="15%" align="center">����</td>
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
		<input type="button" value="��Ϻ���"
			onclick="turnList(${param.p},${stnum});" />&nbsp;&nbsp;&nbsp; 
		<input type="button" value="�亯����"
			onclick="reply(${article.sbbs_artid},${param.p},${stnum});" />&nbsp;&nbsp;&nbsp; 
	<c:if test ="${article.cu_id eq sessionScope.member.id}">
		<input type="button" value="�����ϱ�"
			onclick="update_article(${article.sbbs_artid},${param.p},'${article.cu_id}','${member.id}',${stnum});" />&nbsp;&nbsp;&nbsp;
		<input type="button" value="�����ϱ�"
			onclick="deleteArticle(${article.sbbs_artid},${param.p},'${article.cu_id}','${member.id}',${stnum});" />
	</c:if>
	<c:if test ="${sessionScope.member.member_type eq 'administrator' }">
		<input type = "button" value = "�����ϱ�" 
			onclick="administrator_deleteArticle(${article.sbbs_artid},${param.p},'${sessionScope.member.member_type}',${stnum});"/>
	</c:if>
	<c:if test ="${sessionScope.member.member_type eq 'storeMember'  }">
		<c:if test ="${sessionScope.member.st_num eq article.st_num }">
			<input type = "button" value = "�����ϱ�" 
			onclick="storeMember_deleteArticle(${article.sbbs_artid},${param.p},'${sessionScope.member.member_type}',${stnum});"/>
		</c:if>
	</c:if>
		</td>
	</tr>
</table>
</div>
</body>
</html>