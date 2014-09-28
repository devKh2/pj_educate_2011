<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "base_jspf.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	function post(){
		var f = document.getElementById("storeModel");
		var winopts = "width=200px,height=450px,toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes";
		window.open('', 'viewer', 'winopts');
		f.target = "viewer";
		f.action = "post.do";
		f.method = "get";
		f.submit();
	}
	
	function ack(){
		var f = document.getElementById("storeModel");
		f.target = "_content";
		f.method = "post";
		f.action = "add_store.do";
		f.submit();
	}
	
	function cancle(){
		var f = document.getElementById("storeModel");
		f.target = "_content";
		f.method = "get";
		f.action = "store.do?content=list";
		f.submit();
	}
	
	function idSearch(){
		var f = document.getElementById("storeModel");
		var winopts = "width=200px,height=450px,toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes";
		window.open('', 'viewer', 'winopts');
		f.target = "viewer";
		f.action = "idSearch.do";
		f.method = "post";
		f.submit();
	}

</script>

<hr />
<b>���� ���</b>
<hr />
<br />
<f:form commandName = "storeModel" enctype = "multipart/form-data">
<table width="750px" class="list2_tb">
	<tr>
		<th>��ǥ�� ID</th>
		<td width = "83%"><f:input path = "owner_id" style="height: 20px; width: 150px" readonly="true" value = "${storeModel.owner_id }"/>
		<input type = "button" class = "b_style4" value = "ID�˻�" onclick = "idSearch();"/>
		<f:errors path="owner_id" /></td>
	</tr>
	<tr>
		<th>�� ȣ ��</th>
		<f:hidden path = "st_num" value = "${storeModel.st_num }"/>
		<td width = "83%">
		<f:input id="st_name" path = "st_name" style="height: 20px; width: 250px" value = "${storeModel.st_name }"/>
		<f:errors path="st_name" />
		</td>
	</tr>
	<tr>
		<th>����ڵ�Ϲ�ȣ</th>
		<td width = "83%">
			<f:input path = "biz01" style="height: 20px; width: 40px"/> - 
			<f:input path = "biz02" style="height: 20px; width: 30px"/> -
			<f:input path = "biz03" style="height: 20px; width: 80px"/>
			<f:errors path="biz03" />
		</td>
	</tr>
	<tr>
		<th>�� ��</th>
		<td width = "83%">
			<select name = "st_type" class="select_d">
				<option value = "�ѽ�" selected>�ѽ�</option>
				<option value = "�߽�">�߽�</option>
				<option value = "�Ͻ�">�Ͻ�</option>
				<option value = "�н�">�н�</option>
				<option value = "�߽�">�߽�</option>
			</select>
		</td>
	</tr>
		<tr>
		<th>��ǥ�丮</th>
		<td width = "83%">
			<select name = "st_food" class="select_d">
				<option value = "ġŲ" selected>ġŲ</option>
				<option value = "����">����</option>
				<option value = "���İ�Ƽ">���İ�Ƽ</option>
				<option value = "���ߺ���">���ߺ���</option>
				<option value = "���ö�">���ö�</option>
				<option value = "���">���</option>
				<option value = "���">���</option>
				<option value = "ȸ">ȸ</option>
				<option value = "���ö�">���ö�</option>
				<option value = "�߽�">�߽�</option>
				<option value = "�н�">�н�</option>
				<option value = "�߱��丮">�߱��丮</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>��ǰ �̹���</th>
		<td width = "83%"><input type = "file" name = "file" value = "${storeModel.st_picpath }" style="height: 20px; width: 350px"/></td>
	</tr>
	<tr>
		<th>�� ǥ �� ��</th>
		<td width = "83%"><f:input path = "st_owner" style="height: 20px; width: 250px"/>
		<f:errors path="st_owner" /></td>
	</tr>
	<tr>
		<th>�� ��</th>
		<td width = "83%">
			<f:input path = "st_post" value = "${storeModel.st_post }" style="height: 20px; width: 80px" readonly="true"/> 
			<input type = "button" class = "b_style4" value = "�����ȣ�˻�" onclick = "post();"/>
			<f:errors path="st_post" /><br/>
			<f:input path = "st_detailaddr" value = "${storeModel.st_detailaddr }" style="height: 20px; width: 300px" readonly="true"/>
			<br/>
			<f:input path = "st_addr" value = "${storeModel.st_addr }" style="height: 20px; width: 300px"/>
			<f:errors path="st_addr" />
			<f:hidden path = "st_sido" value = "${storeModel.st_sido }"/>
			<f:hidden path = "st_gugun" value = "${storeModel.st_gugun }"/>
			<f:hidden path = "st_dong" value = "${storeModel.st_dong }"/>
		</td>
	</tr>
	<tr>
		<th>���� ��ȭ��ȣ</th>
		<td width = "83%"><f:input path = "st_ph" style="height: 20px; width: 250px"/>
		<f:errors path="st_ph" /></td>
	</tr>
	<tr>
		<th>��ǥ�� �ڵ���</th>
		<td width = "83%"><f:input path = "st_ownerph" style="height: 20px; width: 250px"/>
		<f:errors path="st_ownerph" /></td>
	</tr>
</table>

<br/>
<table width="750px" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle" height="30px">
		<td width="30%"></td>
		<td width="40%" align="center">
			<input type = "button" value = "���" onclick="ack();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "���" onclick="cancle();"/>
		</td>
		<td width="30%"></td>
	</tr>
</table>
</f:form>
</body>
</html>