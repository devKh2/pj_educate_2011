<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/include/no_che.jspf" %>
<%@ include file = "base_jspf.jspf" %>


<html>
	<head>
		<title>글쓰기</title>
	</head>
<body>

	<form:form commandName="command">	
	<form:hidden path="parent_mbbs_artid" name="parent_mbbs_artid" value="${param.parentId }"/>
	<form:hidden path="cu_id" value="${member.id}"/>
		<fieldset>
			<legend>글쓰기 </legend>
			<p>
				<form:label path="mbbs_title">제목:</form:label><br/>
				<form:input path="mbbs_title"  size="50" maxlength="50" value="re:" /> 
			</p>
			<p>
				<select name = "mbbs_arttype">
					<option value = "감상" selected>감상</option>
					<option value = "문의">문의</option>
					<option value = "항의">항의</option>
				</select>
			</p>
			<p>
			<input type = "file" name = "file" value = "${mbbs_Article.mbbs_picpath}" style="height: 20px; width: 350px"/>
			</p>
			<p>
				<form:label path="mbbs_content">내용:</form:label><br/>
				<form:textarea path="mbbs_content" cols="40" rows="3"/>
			</p>
			<p>
				<input type="submit" value="  등록   " />
		    </p>
		</fieldset>
	</form:form>

</body>


