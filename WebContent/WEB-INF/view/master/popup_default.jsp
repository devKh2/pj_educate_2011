<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="base_jspf.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>

	var res1 = 1;

	//���� Ȯ�� �˾�â
	function picExpand (picPath){
		window.open('picExpand.do?picPath=' + picPath, 'pop', 'top=300, left=200, width=450, height=550, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=1');
	}
	
	function insert(){
		var res = check();
		
		if(res1 == -1){
			alert('�ð������� �ʿ��մϴ�');
			popup.title.focus();
		}
		else if(res == -1){
			popup.title.focus();
		}
		else{
			var f = document.getElementById("popup");
			var reply = confirm('����Ͻðڽ��ϱ�?');
			if(reply == true){
			f.submit();
			}
		}
	}
	
	//�ð��ߺ�üũ
	function timeCheck() {
		var f = document.getElementById("popup");
		var org_action = f.action;
		var org_target = f.target;
		f.target = "check_iframe";
		f.action = "popup_TimeCheck.do";
		f.submit();
		f.target = org_target;
		f.action = org_action;
	}
	
	function success() {
		res1 = 1;
		alert('����� �� �ֽ��ϴ�');
	}

	function fail() {
		res1 = -1;
		alert('����Ͻ� �� �����ϴ�');
		popup.title.focus();
	}
	
	function popDelete(pop_artid){
		var f = document.getElementById("command1");
		alert(pop_artid);
		var reply = confirm('�����Ͻðڽ��ϱ�?');
		if(reply){
			alert('popup_delete.do?pop_artid=' + pop_artid);
			f.action= 'popup_delete.do?pop_artid=' + pop_artid;
			f.submit();
		}
	}

	function check(){
		var res = 1;
		var f = document.getElementById("popup");
		if(f.title.value == '' || f.startYear.value =='' || f.startMonth.value =='' || f.startDay.value =='' || f.startHour.value =='' || f.startMin.value =='' 
		|| f.endYear.value =='' || f.endMonth.value =='' || f.endDay.value =='' || f.endHour.value =='' || f.endMin.value ==''){
			alert('������ �Է����ֽʽÿ�');
			res = -1;
			return res;
		}
		
		if(f.file.value ==''){
			alert('������ �־��ּ���');
			res = -1;
			return res;
		}
		if(f.position.value ==''){
			alert('��ġ�� �������ּ���');
			res = -1;
			return res;
		}
		if(f.startYear.value > f.endYear.value){
			alert('�Է��� Year�� �߸��Ǿ����ϴ�');
			res = -1;
			return res;
		}
		
		if(f.startYear.value == f.endYear.value){
			if(f.startMonth.value > f.endDay.value){
				alert('�Է��� Month�� �߸��Ǿ����ϴ�');
				res = -1;
				return res;
			}
		}
		
		if(f.startYear.value == f.endYear.value){
			if(f.startMonth.value == f.endMonth.value){
				if(f.startDay.value > f.endDay.value ){
					alert('�Է��� Day�� �߸��Ǿ����ϴ�');
					res = -1;
					return res;
				}
			}
		}
		/*
		if(f.startYear.value <= f.endYear.value){
			if(f.startYear.value <= f.endYear.value){
				if(f.startDay.value > f.endDay.value){
					alert('�Է��� Day�� �߸��Ǿ����ϴ�');
					res = -1;
					return res;
				}
			}
		}
		
		if(f.startYear.value <= f.endYear.value){
			if(f.startYear.value <= f.endYear.value){
				if(f.startDay.value <= f.endDay.value){
					if(f.startHour.value > f.endHour.value){
						alert('�Է��� Hour�� �߸��Ǿ����ϴ�');
						res = -1;
						return res;
					}
				}
			}
		}
		
		if(f.startYear.value <= f.endYear.value){
			if(f.startYear.value <= f.endYear.value){
				if(f.startDay.value <= f.endDay.value){
					if(f.startHour.value <= f.endHour.value){
						if(f.startMin.value >= f.endMin.value){
							alert('�Է��� Min�� �߸��Ǿ����ϴ�');
							res = -1;
							return res;
						}
					}
				}
			}
		}
		*/
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<hr/>
�˾� �����ϱ�
<hr/>
<br/>

<form action = "popup_regist.do" method = "post" id = "popup" name="popup" enctype = "multipart/form-data" >
[�˾� ��� �ϱ�]
<br>
<br>
<table width="750px">
	<tr>
		<td width = "10%" >����</td>
		<td><input type = "text" name = "title" size = 70 maxlength="50">
			��ġ&nbsp;&nbsp;<select name = "position">
					<option>����</option>
					<option value = "first">ù��°</option>
					<option value = "second">�ι�°</option>
				</select> 
		</td>
	</tr>
	<tr>
		<td width = "10%" >����Ⱓ</td>
		<td>
			<input type = "text" name = "startYear" size = 2 maxlength="4"> ��  
			<input type = "text" name = "startMonth" size = 2 maxlength="2"> ��
			<input type = "text" name = "startDay" size = 2 maxlength="2"> ��
			<input type = "text" name = "startHour" size = 2 maxlength="2"> �� 
			<input type = "text" name = "startMin" size = 2 maxlength="2"> �� ���� 
			  ~ 
			<input type = "text" name = "endYear" size = 2 maxlength="4"> ��
			<input type = "text" name = "endMonth" size = 2 maxlength="2"> ��
			<input type = "text" name = "endDay" size = 2 maxlength="2"> ��
			<input type = "text" name = "endHour" size = 2 maxlength="2"> �� 
			<input type = "text" name = "endMin" size = 2 maxlength="2"> �� ����&nbsp;&nbsp;
			<input type="button" value="�ð�üũ" onClick="javascript:timeCheck()"/>
		</td>
	</tr>	
	<tr>
		<td >����̹���</td>
		<td><input type = "file" name = "file" value = "�̹���÷��" size="70"></td>
	</tr>
	
	<tr>
		<td>��ũ�� �ּ�</td>
		<td>
			<input type = "text" name = "linkAddr" size = "70" value = "http://">
			<input type = "button" onClick = "javascript:insert()" value = "����ϱ�">
		</td>
	</tr>
</table>
<table width="650px">
	<tr align="right">
		<td>
		</td>
	</tr>
</table>
<br/>
</form>

<form action = "popup.do" method = "post">
<table width="750px">
	<tr align="right">
		<td width="50%" align="left">
			[��ϵ� �˾�����Ʈ] </td>
		<td align="right">����&nbsp;  
			<input type= "text" name = "search" value = "${param.search }" size = 10>
			<input type = "submit" value = "�˻�">
		</td>
	</tr>
</table>
</form>
<br/>

<form id ="command1" name = "command1">
<table width="750px" >
	<tr align="center" bgcolor="ffcc66">
		<td width = "5%" >No</td>
		<td width = "5%" >��ġ</td>
		<td width = "10%" >����</td>
		<td width = "20%" >����</td>
		<td width = "35%" >����Ⱓ</td>
		<td width = "10%" >����</td>
		<td width = "10%" >�����</td>
		<td width = "5%"  >����</td>
	</tr>
</table>
<table width="750px" >	
	<c:choose>
		<c:when test = "${listModel.hasPopup == false }">
			<tr>
				<td align = "center">�˻��� �˾�����Ʈ�� �����ϴ�</td>
			</tr>
		</c:when>
	<c:otherwise>
		<c:forEach var = "popup" items = "${listModel.list}">
			<tr>
				<td width="5%" align="center">${popup.pop_artid}</td>
				<td width="5%" align="center">${popup.pop_position}</td>
				<td width="10%" align="center">
					<a href = "javascript:picExpand('${popup.pop_picpath}');"><img src = "${popup.pop_picpath}" width = "80px" height="60px"/></a>
				</td>
				<td width="20%" align="center">${popup.pop_title}</td>
				<td width="35%" align="center">${popup.pop_startDate} ~ ${popup.pop_endDate}</td>
				<td width="10%" align="center">${popup.pop_situation}</td>
				<td width="10%" align="center">${popup.pop_registDate}</td>
				<td width="10%" align="center"><a href="javascript:popDelete('${popup.pop_artid}');"><b>��</b></a></td>	                                       
			</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</form>

<br/>
<table width="750px" >
	<tr align="center">
		<td>
			<c:if test = "$beginPage > 10}">
				<a href = "<c:url value = "/master/popup.do?p=${beginPage - 1}"/>">����</a>
			</c:if>
			
			<c:forEach var = "pno" begin="${beginPage}" end = "${endPage}">
				<a href = "<c:url value = "/master/popup.do?p=${pno}&search = ${param.search}"/>">[${pno}]</a>
			</c:forEach>
			<c:if test="${endPage < listModel.totalPageCount}">
				<a href="<c:url value="/master/popup.do?p=${endPage + 1}"/>">����</a>
			</c:if>
		</td>
	</tr>
</table>
<iframe id="check_iframe" name="check_iframe" src="" style="display:none;"></iframe> 
</body>
</html>