<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/include/no_che.jspf" %>
<%@ include file = "base_jspf.jspf" %>


<html>
	<head>
		<title>�۾���</title>
	</head>
<body>

	<form:form commandName="command">	
	<form:hidden path="parent_mbbs_artid" name="parent_mbbs_artid" value="${param.parentId }"/>
	<form:hidden path="cu_id" value="${member.id}"/>
		<fieldset>
			<legend>�۾��� </legend>
			<p>
				<form:label path="mbbs_title">����:</form:label><br/>
				<form:input path="mbbs_title"  size="50" maxlength="50" value="re:" /> 
			</p>
			<p>
				<select name = "mbbs_arttype">
					<option value = "����" selected>����</option>
					<option value = "����">����</option>
					<option value = "����">����</option>
				</select>
			</p>
			<p>
			<input type = "file" name = "file" value = "${mbbs_Article.mbbs_picpath}" style="height: 20px; width: 350px"/>
			</p>
			<p>
				<form:label path="mbbs_content">����:</form:label><br/>
				<form:textarea path="mbbs_content" cols="40" rows="3"/>
			</p>
			<p>
				<input type="submit" value="  ���   " />
		    </p>
		</fieldset>
	</form:form>

</body>

