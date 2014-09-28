<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix = "form" uri ="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>회원가입</title>

<script type="text/javascript">

	var residentCheck ;
	//preResident, tailResident
	//주민번호 체계 검사
	function ssnConfirm(){
		var preResident = command.preResident.value;
		var tailResident = command.tailResident.value
	
		//if(preResident == '' || tailResident == ''){
			//alert('주민등록번호를  입력해주세요.');
			//command.preResident.focus();
		//}
		if(preResident.length!=6 || tailResident.length != 7){
			alert ('입력한 자릿수가 일치하지 않습니다');
			command.preResident.focus();
			residentCheck = -1;
		}
	
	 
	 	if((preResident.length == 6) &&(tailResident.length == 7)){
	 		var residentNum = preResident + tailResident;
	 		a = new Array(13);
	 		for (var i=0; i < 13; i++) {
	 			a[i] = parseInt(residentNum.charAt(i));
	 		}
	 		var k = 11 - (((a[0] * 2) + (a[1] * 3) + (a[2] * 4) + (a[3] * 5) + (a[4] * 6) + (a[5] * 7) + (a[6] * 8) + (a[7] * 9) + (a[8] * 2) + (a[9] * 3) + (a[10] * 4) + (a[11] * 5)) % 11);
	 		if (k > 9){
	 			k -= 10;
	 		}
	 		if (k == a[12]){
	 			alert("주민등록번호가 유효합니다.");
	 			command.userPW.focus();
	 			residentCheck = 1;
	 		} else{
	 			alert ("잘못된 주민등록번호 입니다.\n\n다시 입력해 주세요.");
	 			command.preResident.value = "";
	 			command.tailResident.value = "";
	 			command.preResident.focus();
	 			residentCheck = -1;
	 		}
	 		
	 	}
	}

	//통합체크 (완료버튼 이벤트)
	function totalCheck(){
		var f = document.getElementById("command");
		contract();	//이용약관 체크되었는지
		auth();	//인증처리 되었는지 체크
		ssnConfirm();
		if((command.clCheck.checked == true) && (f.authCheck.value == '인증됨') && (residentCheck == 1)){
			f.submit();
		}
	}
	
	//이용약관 체크 
	function contract(){
		var f = document.getElementById("command");
		if(command.clCheck.checked == false){
			alert("이용약관을 읽고 체크를 해주세요");
			command.clCheck.focus();
			return -1;
		}
		return 1;
	}
	
	
	// 인증 처리 했는지 확인
	function auth(){
		var f = document.getElementById("command");
		if(f.authCheck.value != '인증됨'){
			alert('인증 확인을 하십시오');
			return 1;
		}
		return -1;
	}

	
	//아이디중복체크(아이디체크버튼 이벤트)
	function jsCheck() {
		var f = document.getElementById("command");
		
		isEmpty();		// 빈칸인지 체크
		var org_action = f.action;
		var org_target = f.target;
		f.target = "check_iframe";
		f.action = "id_check.do";
		f.submit();
		f.target = org_target;
		f.action = org_action;
	}
	
	//아이디값 없는지 체크
	function isEmpty(){
		
		if(command.userID.value == ""){
			alert("아이디를 입력해 주세요");
			command.uerID.value = "";
			command.userID.focus();
			return;
		}
	}
	
	function success() {
		alert('사용할 수 있습니다');
	}

	function fail() {
		alert('사용하실 수 없습니다');
		var f = document.getElementById("command");
		f.userID.value = "";
		f.userID.focus();
	}
	function email(){
		var email =command.selectTailEmail.value;
		command.tailEmail.value= email;
	}

	
	// 우편번호 버튼 이벤트
	function post(){
		window.open('member/post.do','newwindow', 
				'top=0, left=0, width=550, height=500, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	// 인증번호버튼 이벤트
	function check(){	
		
		var f = document.getElementById("command");
		var preEmail = f.preEmail.value;
		var tailEmail = f.tailEmail.value;
		if(preEmail == '' || tailEmail == '' ){
			alert('인증번호를 받을 수 있는 email주소를 쓰세요');
			command.preEmail.focus();
		}else{
			var email = preEmail + '@' + tailEmail;
			window.open('authentication.do?email=' + email ,'newwindow', 
			'top=0, left=0, width=550, height=200, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
		}	
	}

</script>
<style type="text/css">
input {
	border-style:solid; border-color: orange;
	background-color: white;
}
table {
	font-family: 돋움체;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<link rel="stylesheet" href="style/layout.css" type="text/css">
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form:form commandName = "command" id="command" name="command">
<table id="Table_01" align="center"  bordercolor="orange" width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
	<tr>
		<td width="20%"></td>
		<!--회원 가입 메인시작-->
		<td>
		<table width = "704px" >
			<tr>
				<td align="left"><b>&nbsp;&nbsp;&nbsp;회원가입</b></td>
				
			</tr>
			<tr>
				
				<td align = "center">
					<textarea cols="50" style="width: 557px;" rows="6" readonly="readonly" >수집하는 개인정보의 항목가. 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다. 
<일반 회원가입 시> 
- 필수항목 : 성명, 주민등록번호, 외국인등록번호 또는 여권번호(외국인에 한함), 아이디, 비밀번호, 본인확인문답, 이메일 주소, 만14세 미만인 경우 법정대리인 정보 
- 선택사항 : 휴대폰 번호 
<아이핀(i-Pin) 회원가입 시> 
- 필수항목 : 성명, 생년월일, 성별, 아이핀 번호, 아이디, 비밀번호, 본인확인문답, 이메일 주소, 만14세 미만인 경우 법정대리인 정보 
- 선택사항 : 휴대폰 번호 
<단체아이디 회원가입 시> 
- 필수항목 : 단체아이디, 회사명, 업종, 대표자명, 대표 전화번호, 대표 팩스, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위 
- 선택사항 : 창립일, 대표 홈페이지 
나. 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. 
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록 
다. 부가 서비스 및 맞춤식 서비스 이용 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다. 
- 주소, 연락처, 사용 이동통신사, 계좌번호 등 
라. 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등 
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등 
- 계좌이체시 : 은행명, 계좌번호 등 
- 상품권 이용시 : 상품권 번호 
					</textarea> <br>
					<input type="checkbox" name = "clCheck">약관에 동의 합니다.
					<br><br><br>
			</tr>
			<tr height="10%">
				
				<td style="height: 80px;">
				
				<table width="580" cellspacing = "5" cellpadding="5">
					<tr>
						<td>아이디</td>
						<td>
							<form:input path = "userID" size="20"  style="ime-mode: disabled" />
							&nbsp;&nbsp;&nbsp;<input type="button" value="아이디 중복확인" onClick="javascript:jsCheck()" style="width: 140px;" />
							<form:errors path = "userID"/>
						</td>
					</tr>
					<tr>
						<td>주민번호</td>
						<td>
							<form:input path = "preResident" size="7" maxlength='6' style="ime-mode: disabled" />- 
							<form:password path = "tailResident" size="12" maxlength='7' style="ime-mode: disabled" />
							<a href="javascript:ssnConfirm();">주민등록번호검증</a>
				
							
							<form:errors path = "preResident"/>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<form:password path = "userPW" size="20" style="ime-mode: disabled" />
							<form:errors path = "userPW"/>
						</td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td>
							<form:password path = "userPWCheck" size="20" style="ime-mode: disabled" />
							<form:errors path = "userPWCheck"/>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<form:input path = "userName" size="20"  />
							<form:errors path = "userName"/>
						</td>
					</tr>
					
					<tr>
						<td>e-mail</td>
						<td>
							<form:input path = "preEmail" size="12" style="ime-mode: disabled"/>&nbsp;@
							<form:input path = "tailEmail" size="12" value = "직접입력하기" onFocus = "this.value = '';return true;"style="ime-mode: disabled"/>
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
							&nbsp;&nbsp;<a href="javascript:check();">인증번호 받기</a>
							<input type = "hidden" name = "authCheck" >
							<form:errors path = "preEmail"/>
						</td>
					</tr>
					
					<tr>
						<td>핸드폰번호</td>
						<td>
							<form:input path = "cellNumber" size="20"  style="ime-mode: disabled"/>
							<form:errors path = "cellNumber"/>
						</td>
					</tr>
					<tr>
						<td>기본주소</td>
						<td>
							<form:input path = "preAddress" value = "${post.zipcode }" size="20" readonly="true" style="ime-mode: disabled; width: 216px"/>
							<input type="button" value="우편번호 찾기" onClick="javascript:post()"/>
							<form:errors path = "preAddress"/>
						</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td>
							<form:input path = "tailAddress" size="40" />
							<form:errors path = "tailAddress" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align = "center">
							<input type="button" value="회원가입" onClick="javascript:totalCheck()"/> 
							<input type="button" value="취소" style="width: 83px;" onclick = "top.location.href = 'main.do'" />
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form:form>
<!-- End ImageReady Slices -->
<iframe id="check_iframe" name="check_iframe" src="" style="display:none;"></iframe> 
</body>
</html>