<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix = "form" uri ="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>회원정보수정</title>

<script type="text/javascript">
	//통합체크 (완료버튼 이벤트)
	function totalCheck(){
		var f = document.getElementById("command");
		f.submit();
	}

	function resize(){
		var doc = document.getElementById('content');
  	  if(doc.offsetHeight == 0){
  	  } else {
  		 pageheight = doc.offsetHeight;
  		 parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
  	  }
	}
	// 우편번호 버튼 이벤트
	function post(){
		window.open('member/post.do','newwindow', 
				'top=0, left=0, width=550, height=500, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	function email(){
		var email =command.selectTailEmail.value;
		command.tailEmail.value= email;
	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<link rel="stylesheet" href="style/layout.css" type="text/css">
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resize()">

<form:form commandName = "command">
<div id="content">
<table id="Table_01" width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td align="left"><b>&nbsp;&nbsp;&nbsp;회원정보수정</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font color = "red">(*)은 변경불가</font></td>
			</tr>
			<tr height="10%">
				
				<td style="height: 80px;">
				
				<table width="580" cellspacing = "5" cellpadding="5">
					<tr>
						<td>아이디<font color = "red">*</font></td>
						<td>
							<form:input path = "userID" readonly ="true" value ="${member.id}"  size="20"  style="ime-mode: disabled" />

						</td>
					</tr>
					<tr>
						<td>주민번호<font color = "red">*</font></td>
						<td>
							<form:input path = "preResident" size="7" maxlength='6' readonly ="true" value = "${member.preResident}" style="ime-mode: disabled" />- 
							<form:password path = "tailResident" size="12" maxlength='7' readonly ="true" value = "${member.tailResident}"  style="ime-mode: disabled" />
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<form:password path = "userPW" value = "${member.pw}"  onFocus = "this.value = '';return true;" size="20" style="ime-mode: disabled" />
							<form:errors path = "userPW"/>
						</td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td>
							<form:password path = "userPWCheck" value = "${member.pw}" onFocus = "this.value = '';return true;" size="20" style="ime-mode: disabled" />
							<form:errors path = "userPWCheck"/>
						</td>
					</tr>
					<tr>
						<td>이름<font color = "red">*</font></td>
						<td>
							<form:input path = "userName" size="20"  readonly="true" value ="${member.userName}"/>
						</td>
					</tr>
					
					<tr>
						<td>e-mail</td>
						<td>
							<form:input path = "preEmail" size="12" value = "${member.preEmail}" onFocus = "this.value = '';return true;" style="ime-mode: disabled"/>&nbsp;@
							<form:input path = "tailEmail" size="12" value = "${member.tailEmail}" onFocus = "this.value = '';return true;" style="ime-mode: disabled"/>
							<select name = "selectTailEmail"  onclick="javascript:email()" onkeyup="javascript:email()" >
								<option value = "직접입력">직접입력</option>  
								<option value = "naver.com">네이버</option>  
								<option value = "hanmail.net">다음</option>  
								<option value = "google.com">구글</option> 
								<option value = "nate.com">네이트</option> 
								<option value = "yahoo.com">야후</option>  
								<option value = "freechal.com">프리챌</option> 
								<option value = "dreamwiz.com">드림위즈</option> 
							</select>
							<form:errors path = "preEmail"/>
						</td>
					</tr>
					
					<tr>
						<td>핸드폰번호</td>
						<td>
							<form:input path = "cellNumber" value = "${member.phone}" size="20"  onFocus = "this.value = '';return true;" style="ime-mode: disabled"/>
							<form:errors path = "cellNumber"/>
						</td>
					</tr>
					<tr>
						<td>기본주소</td>
						<td>
							<form:input path = "preAddress" value = "${member.preAddress }" size="20" readonly="true" style="ime-mode: disabled; width: 216px"/>
							<input type="button" value="우편번호 찾기" onClick="javascript:post()"/>
							<form:errors path = "preAddress"/>
						</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td>
							<form:input path = "tailAddress" value = "${member.tailAddress}" size="40" onFocus = "this.value = '';return true;" />
							<form:errors path = "tailAddress" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align = "center">
							<input type="button" value="수정완료" onClick="javascript:totalCheck()"/> 
							<input type="button" value="취소" style="width: 83px;" onclick = "top.location.href = 'main.do'" />
						</td>
					</tr>
				</table>
			</tr>
		</table>
</div>
</form:form>
<!-- End ImageReady Slices -->
<iframe id="check_iframe" name="check_iframe" src="" style="display:none;"></iframe> 
</body>
</html>