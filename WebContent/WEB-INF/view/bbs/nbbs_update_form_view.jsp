<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/include/no_che.jspf" %>
<%@ include file = "base_jspf.jspf" %>
<html>
	<head>
		<title>�����ϱ�</title>
	</head>
<body>

	<form:form commandName="command">	
		<fieldset>
			<legend>�� �����ϱ� </legend>
			<form:hidden path="admin_id" value="${member.id}"/>
			<p>
				<form:label path="notice_title">����:</form:label><br/>
				<form:input path="notice_title"  size="85" maxlength="50" /> 
			</p>
			<p>
				<form:label path="notice_content">����:</form:label><br/>
				<form:textarea path="notice_content"  cols="85" rows="15"/>
			</p>
			<p>
				<input type="submit" value="  ����   " />
			</p>
		</fieldset>
	</form:form>
	
</body>
</html>
