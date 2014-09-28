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
			<form:hidden path="member_id" value="${member.id}"/>
			<p>
				<form:label path="mbbs_title">����:</form:label><br/>
				<form:input path="mbbs_title"  size="85" maxlength="50" /> 
			</p>
			<p>
				<form:label path="mbbs_content">����:</form:label><br/>
				<form:textarea path="mbbs_content"  cols="85" rows="15"/>
			</p>
			<p>
				<input type="submit" value="  ����   " />
			</p>
		</fieldset>
	</form:form>
	
</body>
</html>