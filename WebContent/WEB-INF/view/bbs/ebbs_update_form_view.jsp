<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/include/no_che.jspf" %>
<%@ include file = "base_jspf.jspf" %>
<html>
	<head>
		<title>�����ϱ�</title>
		<link rel="stylesheet" href="<c:url value="/blueprint/screen.css"/>">
	</head>
<body>

	<form:form commandName="command">	
		<fieldset>
			<legend>�� �����ϱ� </legend>
			<form:hidden path="member_id" value="${member.id}"/>
			<p>
				<form:label path="mbbs_title">����:</form:label><br/>
				<form:input path="mbbs_title"  size="50" maxlength="50" /> 
			</p>
			<p>
				<form:label path="mbbs_content">����:</form:label><br/>
				<form:textarea path="mbbs_content"  cols="40" rows="3"/>
			</p>
			<p>
				<input type="submit" value="  ����   " />
			</p>
		</fieldset>
	</form:form>
	
</body>
</html>