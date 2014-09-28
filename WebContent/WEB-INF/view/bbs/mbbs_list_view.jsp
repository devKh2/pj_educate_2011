<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/no_che.jspf"%>
<%@ include file = "base_jspf.jspf" %>

<html>
<head>
<title>main �Խñ� ���</title>
</head>
<body>
<hr />
<b>���� �Խ���</b>
<hr />

<table width="750px" border="0">

	<c:if test="${requestScope.listModel.totalPageCount > 0}">
		<tr>
			<td colspan="5" width="750">${listModel.startRow}-${listModel.endRow}
			[${listModel.requestPage}/${listModel.totalPageCount}]</td>
		</tr>
	</c:if>
</table>
<table width="750px" class = "list_tb">
	<tr>
		<td width="7%" align="center">��ȣ</td>
		<td width="10%" align="center">������</td>
		<td width="15%" align="center">����</td>
		<td width="40%" align="center">����</td>
		<td width="10%" align="center">�ۼ���</td>
		<td width="10%" align="center">�ۼ���</td>
		<td width="8%" align="center">��ȸ��</td>
	</tr>

			<c:forEach var="article" items="${listModel.articleList}">
				<tr>
					<td align="center"><c:out value="${rownum}" /></td>
					<c:set var="rownum" value="${rownum-1}" />
					<td align="center"><c:out value="${article.mbbs_arttype}"/></td>
					<c:if test="${article.mbbs_picnum == 0}">
					<td><img src="<c:url value="/images/NO_PHOTO.jpg" />" width="100" /></td>
					</c:if>
					<c:if test="${article.mbbs_picnum != 0}">
					<td><img alt="" src="${article.mbbs_picpath}" width="100" /></td>
					</c:if>
					<td align="center"><c:if test="${article.level > 0}">
						<c:forEach begin="1" end="${article.level}">-</c:forEach>&gt;
						</c:if> 
					<c:set var="query"
						value="artId=${article.mbbs_artid}&p=${listModel.requestPage}" /> <a
						href="<c:url value="/mbbs_read.do?${query}"/>"> ${article.mbbs_title} <c:if
						test="${article.newArticleYN}">
						<img src="<c:url value="/images/new.jpg" />" width="35"
							height="15" border="0" />
					</c:if> </a></td>
					<td align="center">${article.cu_id}</td>
					<td align="center">${article.mbbs_regdate}</td>
					<td align="center">${article.mbbs_count}</td>
				</tr>
			</c:forEach>

</table>
<table width="750px" border="0">
			<tr>
				<td colspan="5"><c:if test="${beginPage > 10}">
					<a href="<c:url value="/mbbs_list.do?p=${beginPage-1}"/>">����</a>
				</c:if> <c:forEach var="pno" begin="${beginPage}" end="${endPage}">
					<a href="<c:url value="/mbbs_list.do?p=${pno}" />">[${pno}]</a>
				</c:forEach> <c:if test="${endPage < listModel.totalPageCount}">
					<a href="<c:url value="/mbbs_list.do?p=${requestScope.endPage + 1}"/>">����</a>
				</c:if></td>
			</tr>
		
	<tr>
		<td colspan="5"><a href="<c:url value="/mbbs_write.do"/>">�۾���</a></td>
	</tr>
</table>
<form method="POST" action="/peach/mbbs_list.do">
<table  width="750px" >
	<tr>
		<td><select name="searchkind">
			<option value = "total_search">��ü</option>
			<option value = "writer_search">�ۼ���</option>
			<option value = "content_search">�� ����</option>
			<option value = "title_search">������</option>
		</select> <td><input type="text" name="search" size="50" maxlength="30"
			value="${param.search }">
      <input type="submit" value="�˻�">
      </td>
   </tr>
</table>
</form>
<br />
</body>
</html>