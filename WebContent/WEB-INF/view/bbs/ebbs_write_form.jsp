<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "base_jspf.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	 function addvalue(cnt){
	    	var ordercnt=document.ebbs_Article.ebbs_score;
	    	if(ordercnt.value<10){
	    		ordercnt.value=Number(1)+Number(ordercnt.value);
	    	}else{
	    		alert("10점이 최고점 입니다.");
	    	}
	 }
    function minusvalue(cnt){
	   	var ordercnt=document.ebbs_Article.ebbs_score;
   		if(ordercnt.value>0){
   	    	ordercnt.value=Number(ordercnt.value)-Number(1);
   		}else{
   			alert("0점 이하는 주실 수 없습니다.");
   		}
	 }
</script>
<f:form commandName="ebbs_Article" name="ebbs_Article" >
	<table width="100%" class = "list_tb">
		<tr>
			<td align="center" >글 제목 :</td>
			<td width = "85%">
			<f:input path = "ebbs_title" style="height: 19px; width: 615px" value = "${ebbs_Article.ebbs_title}"/>
			<f:errors path="ebbs_title"/>
			</td >
		</tr>
		<tr>
			<td align="center">평점주기 : </td>
			<td width = "85%">
				<input type="text" value="0" size="2" name="ebbs_score" />
				<input type="button" size="1" value="+" onclick="addvalue(${ch})">
				<input type="button" size="1" value="-" onclick="minusvalue(${ch})">
		    </td>
		</tr>
</table>

<br/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			<input type="submit" value="전송">
		</td>
		<td width="30%"></td>
	</tr>
</table>
</f:form>



</body>
</html>