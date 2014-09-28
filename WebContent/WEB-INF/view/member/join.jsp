<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix = "form" uri ="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ȸ������</title>

<script type="text/javascript">

	var residentCheck ;
	//preResident, tailResident
	//�ֹι�ȣ ü�� �˻�
	function ssnConfirm(){
		var preResident = command.preResident.value;
		var tailResident = command.tailResident.value
	
		//if(preResident == '' || tailResident == ''){
			//alert('�ֹε�Ϲ�ȣ��  �Է����ּ���.');
			//command.preResident.focus();
		//}
		if(preResident.length!=6 || tailResident.length != 7){
			alert ('�Է��� �ڸ����� ��ġ���� �ʽ��ϴ�');
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
	 			alert("�ֹε�Ϲ�ȣ�� ��ȿ�մϴ�.");
	 			command.userPW.focus();
	 			residentCheck = 1;
	 		} else{
	 			alert ("�߸��� �ֹε�Ϲ�ȣ �Դϴ�.\n\n�ٽ� �Է��� �ּ���.");
	 			command.preResident.value = "";
	 			command.tailResident.value = "";
	 			command.preResident.focus();
	 			residentCheck = -1;
	 		}
	 		
	 	}
	}

	//����üũ (�Ϸ��ư �̺�Ʈ)
	function totalCheck(){
		var f = document.getElementById("command");
		contract();	//�̿��� üũ�Ǿ�����
		auth();	//����ó�� �Ǿ����� üũ
		ssnConfirm();
		if((command.clCheck.checked == true) && (f.authCheck.value == '������') && (residentCheck == 1)){
			f.submit();
		}
	}
	
	//�̿��� üũ 
	function contract(){
		var f = document.getElementById("command");
		if(command.clCheck.checked == false){
			alert("�̿����� �а� üũ�� ���ּ���");
			command.clCheck.focus();
			return -1;
		}
		return 1;
	}
	
	
	// ���� ó�� �ߴ��� Ȯ��
	function auth(){
		var f = document.getElementById("command");
		if(f.authCheck.value != '������'){
			alert('���� Ȯ���� �Ͻʽÿ�');
			return 1;
		}
		return -1;
	}

	
	//���̵��ߺ�üũ(���̵�üũ��ư �̺�Ʈ)
	function jsCheck() {
		var f = document.getElementById("command");
		
		isEmpty();		// ��ĭ���� üũ
		var org_action = f.action;
		var org_target = f.target;
		f.target = "check_iframe";
		f.action = "id_check.do";
		f.submit();
		f.target = org_target;
		f.action = org_action;
	}
	
	//���̵� ������ üũ
	function isEmpty(){
		
		if(command.userID.value == ""){
			alert("���̵� �Է��� �ּ���");
			command.uerID.value = "";
			command.userID.focus();
			return;
		}
	}
	
	function success() {
		alert('����� �� �ֽ��ϴ�');
	}

	function fail() {
		alert('����Ͻ� �� �����ϴ�');
		var f = document.getElementById("command");
		f.userID.value = "";
		f.userID.focus();
	}
	function email(){
		var email =command.selectTailEmail.value;
		command.tailEmail.value= email;
	}

	
	// �����ȣ ��ư �̺�Ʈ
	function post(){
		window.open('member/post.do','newwindow', 
				'top=0, left=0, width=550, height=500, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	// ������ȣ��ư �̺�Ʈ
	function check(){	
		
		var f = document.getElementById("command");
		var preEmail = f.preEmail.value;
		var tailEmail = f.tailEmail.value;
		if(preEmail == '' || tailEmail == '' ){
			alert('������ȣ�� ���� �� �ִ� email�ּҸ� ������');
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
	font-family: ����ü;
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
		<!--ȸ�� ���� ���ν���-->
		<td>
		<table width = "704px" >
			<tr>
				<td align="left"><b>&nbsp;&nbsp;&nbsp;ȸ������</b></td>
				
			</tr>
			<tr>
				
				<td align = "center">
					<textarea cols="50" style="width: 557px;" rows="6" readonly="readonly" >�����ϴ� ���������� �׸�. ȸ��� ȸ������, ��Ȱ�� �����, ���� ������ ������ ���� ���� ȸ������ ��� �Ʒ��� ���� ���������� �����ϰ� �ֽ��ϴ�. 
<�Ϲ� ȸ������ ��> 
- �ʼ��׸� : ����, �ֹε�Ϲ�ȣ, �ܱ��ε�Ϲ�ȣ �Ǵ� ���ǹ�ȣ(�ܱ��ο� ����), ���̵�, ��й�ȣ, ����Ȯ�ι���, �̸��� �ּ�, ��14�� �̸��� ��� �����븮�� ���� 
- ���û��� : �޴��� ��ȣ 
<������(i-Pin) ȸ������ ��> 
- �ʼ��׸� : ����, �������, ����, ������ ��ȣ, ���̵�, ��й�ȣ, ����Ȯ�ι���, �̸��� �ּ�, ��14�� �̸��� ��� �����븮�� ���� 
- ���û��� : �޴��� ��ȣ 
<��ü���̵� ȸ������ ��> 
- �ʼ��׸� : ��ü���̵�, ȸ���, ����, ��ǥ�ڸ�, ��ǥ ��ȭ��ȣ, ��ǥ �ѽ�, ��ǥ �̸��� �ּ�, ��ü�ּ�, ������ ���̵�, ������ ����ó, ������ �μ�/���� 
- ���û��� : â����, ��ǥ Ȩ������ 
��. ���� �̿�������� �Ʒ��� ���� �������� �ڵ����� �����Ǿ� ������ �� �ֽ��ϴ�. 
- IP Address, ��Ű, �湮 �Ͻ�, ���� �̿� ���, �ҷ� �̿� ��� 
��. �ΰ� ���� �� ����� ���� �̿� �������� �ش� ������ �̿��ڿ� ���ؼ��� �Ʒ��� ���� �������� ������ �� �ֽ��ϴ�. 
- �ּ�, ����ó, ��� �̵���Ż�, ���¹�ȣ �� 
��. ���� ���� �̿� �������� �Ʒ��� ���� ���� �������� ������ �� �ֽ��ϴ�. 
- �ſ�ī�� ������ : ī����, ī���ȣ �� 
- �޴���ȭ ������ : �̵���ȭ��ȣ, ��Ż�, �������ι�ȣ �� 
- ������ü�� : �����, ���¹�ȣ �� 
- ��ǰ�� �̿�� : ��ǰ�� ��ȣ 
					</textarea> <br>
					<input type="checkbox" name = "clCheck">����� ���� �մϴ�.
					<br><br><br>
			</tr>
			<tr height="10%">
				
				<td style="height: 80px;">
				
				<table width="580" cellspacing = "5" cellpadding="5">
					<tr>
						<td>���̵�</td>
						<td>
							<form:input path = "userID" size="20"  style="ime-mode: disabled" />
							&nbsp;&nbsp;&nbsp;<input type="button" value="���̵� �ߺ�Ȯ��" onClick="javascript:jsCheck()" style="width: 140px;" />
							<form:errors path = "userID"/>
						</td>
					</tr>
					<tr>
						<td>�ֹι�ȣ</td>
						<td>
							<form:input path = "preResident" size="7" maxlength='6' style="ime-mode: disabled" />- 
							<form:password path = "tailResident" size="12" maxlength='7' style="ime-mode: disabled" />
							<a href="javascript:ssnConfirm();">�ֹε�Ϲ�ȣ����</a>
				
							
							<form:errors path = "preResident"/>
						</td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td>
							<form:password path = "userPW" size="20" style="ime-mode: disabled" />
							<form:errors path = "userPW"/>
						</td>
					</tr>
					<tr>
						<td>��й�ȣȮ��</td>
						<td>
							<form:password path = "userPWCheck" size="20" style="ime-mode: disabled" />
							<form:errors path = "userPWCheck"/>
						</td>
					</tr>
					<tr>
						<td>�̸�</td>
						<td>
							<form:input path = "userName" size="20"  />
							<form:errors path = "userName"/>
						</td>
					</tr>
					
					<tr>
						<td>e-mail</td>
						<td>
							<form:input path = "preEmail" size="12" style="ime-mode: disabled"/>&nbsp;@
							<form:input path = "tailEmail" size="12" value = "�����Է��ϱ�" onFocus = "this.value = '';return true;"style="ime-mode: disabled"/>
							<select name = "selectTailEmail"  onclick="javascript:email()" onkeyup="javascript:email()" >
								<option value = "�����Է�">�����Է�</option>  
								<option value = "naver.com">���̹�</option>  
								<option value = "hanmail.net">����</option>  
								<option value = "google.com">����</option> 
								<option value = "nate.com">����Ʈ</option> 
								<option value = "yahoo.com">����</option>  
								<option value = "freechal.com">����ç</option> 
								<option value = "dreamwiz.com">�帲����</option> 
							</select>
							&nbsp;&nbsp;<a href="javascript:check();">������ȣ �ޱ�</a>
							<input type = "hidden" name = "authCheck" >
							<form:errors path = "preEmail"/>
						</td>
					</tr>
					
					<tr>
						<td>�ڵ�����ȣ</td>
						<td>
							<form:input path = "cellNumber" size="20"  style="ime-mode: disabled"/>
							<form:errors path = "cellNumber"/>
						</td>
					</tr>
					<tr>
						<td>�⺻�ּ�</td>
						<td>
							<form:input path = "preAddress" value = "${post.zipcode }" size="20" readonly="true" style="ime-mode: disabled; width: 216px"/>
							<input type="button" value="�����ȣ ã��" onClick="javascript:post()"/>
							<form:errors path = "preAddress"/>
						</td>
					</tr>
					<tr>
						<td>���ּ�</td>
						<td>
							<form:input path = "tailAddress" size="40" />
							<form:errors path = "tailAddress" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align = "center">
							<input type="button" value="ȸ������" onClick="javascript:totalCheck()"/> 
							<input type="button" value="���" style="width: 83px;" onclick = "top.location.href = 'main.do'" />
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