<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/include/no_che.jspf" %>
<%@ include file = "base_jspf.jspf" %>
<html>
	<head>
		<title>수정하기</title>
	</head>
<body>

	<form:form commandName="command">	
		<fieldset>
			<legend>글 수정하기 </legend>
			<form:hidden path="member_id" value="${member.id}"/>
			<p>
				<form:label path="mbbs_title">제목:</form:label><br/>
				<form:input path="mbbs_title"  size="85" maxlength="50" /> 
			</p>
			<p>
				<form:label path="mbbs_content">내용:</form:label><br/>
				<form:textarea path="mbbs_content"  cols="85" rows="15"/>
			</p>
			<p>
				<input type="submit" value="  수정   " />
			</p>
		</fieldset>
	</form:form>
	
</body>
</html>
