<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%> 

<c:if test = "${result}">
	<script>
		parent.success();
	</script>
</c:if>

<c:if test = "${!result}">
	<script>
		parent.fail();
	</script>
</c:if>