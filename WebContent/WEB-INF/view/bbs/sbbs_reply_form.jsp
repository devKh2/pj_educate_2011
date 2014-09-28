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
	<form:hidden path="parent_sbbs_artid" name="parent_sbbs_artid" value="${param.parentId }"/>
	<form:hidden path="cu_id" value="${member.id}"/>
	<form:hidden path="st_type" value="�н�"/>
	<form:hidden path="st_num" value="1"/>
		<fieldset>
			<legend>�۾��� </legend>
			<p>
				<form:label path="sbbs_title">����:</form:label><br/>
				<form:input path="sbbs_title"  size="85" maxlength="50" value="re:" /> 
			</p>
			<p>
				<select name = "sbbs_arttype">
					<option value = "����" selected>����</option>
					<option value = "����">����</option>
					<option value = "����">����</option>
				</select>
			</p>
			<p>
			<input type = "file" name = "file" value = "${sbbs_Article.mbbs_picpath}" style="height: 20px; width: 350px"/>
			</p>
			<p>
				<form:label path="sbbs_content">����:</form:label><br/>
				<form:textarea path="sbbs_content" cols="85" rows="15"/>
			</p>
			<p>
				<input type="submit" value="  ���   " />
		    </p>
		</fieldset>
	</form:form>

</body>


