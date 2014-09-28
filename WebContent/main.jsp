<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ħ.. �򸣸�</title>
<!-- Framework CSS -->

<link rel="stylesheet" href="style/basic.css" type="text/css">
<link rel="stylesheet" href="style/layout.css" type="text/css">
<link rel="stylesheet" href="style/search.css" type="text/css">

<script>
	
	function sch_type_check(oFrm){
		if (oFrm.sch_type[0].checked) {
			oFrm.sc.value = oFrm.sch_type[0].value;
		} else {
			oFrm.sc.value = oFrm.sch_type[1].value;
		}
	 
	}
	function onSearch(oFrm){//�˻��ϱ�
			var val_search = oFrm.kw.value;
			var val_schtype = oFrm.sc.value;
			sch_type_check(oFrm);
			if (val_search.length==0) {
				alert("�˻�� �Է��� �ֽʽÿ�");
				return false;
			} 
			oFrm.submit();
	}
	
	// ���̵�ã�� �˾�â�� �����Ű�� ���� �Լ�
	function idpwSearch(){
		window.open('member_idsearch.do','newwindow', 
				'top=0, left=0, width=550, height=250, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	// ��й�ȣ���� �˾�â�� �����Ű�� ���� �Լ�
	
	function pwSearch(){
		window.open('member_pwsearch.do','newwindow', 
		'top=0, left=0, width=550, height=250, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	
	//���� ����� �˾�â �ڵ����� ���� ��ũ��Ʈ
	newWin = window.open('popup.do','newwindow','location = 0, top=0, left=0, width=300, height=362, toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
	newWin.creator = self;
	
	newWin = window.open('popup.do','newwindow1','location = 0, top=0, left=310, width=300, height=362, toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
	newWin.creator = self;
	//�˾� â ������ �ٽ� ���� �ʱ�
	/*
	function setCookie(name, value, expriedays){
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) +";path = /; expires = " +todayDate.toGMTString() + ";";
	}
	function getCookie(name){
		var nameOfCookie = name + "=";
		var x = 0;
		while (x <= document.cookie.length){
			var y = (x + nameOfCookie.lenght);
			if(document.cookie.substring(x,y) == nameOfCookie){
				if((endOfCookie = document.cookie.indexOf(";", y)) == -1)
					endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if(x == 0)
				break;
		}
		return "";
	}
	if(getCookie("notice") != "done"){
		noticeWindow = window.open('popup.do', 'notice','top=0, left=0, width=300, height=362, toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
		noticeWindow.creator = self;
	}
	*/
</script>



<link rel="stylesheet" type="text/css" href="style/droplinebar.css" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<script src="style/droplinemenu.js" type="text/javascript"></script>

<script type="text/javascript">
	//build menu with DIV ID="myslidemenu" on page:
	droplinemenu.buildmenu("mydroplinemenu")
</script>

</head>
<body onload="">
<c:forEach var="popup" items="${listModel.list}">
	<input type="hidden" name="pop_id" value="${popup.pop_artid }"/>
</c:forEach>
<!--  ��ü Wrap ���� -->
<div id="wrapper">

<!-- ��� ���� ���� -->
<div id="header">
<div class="Htop">
<table border="0" align="center" >
	<tr>
		<!-- �ΰ��� ����-->
		<td>
		<div class="logo"><a href="/peach/"><img src="images/logo.jpg"
			border="0" width="170px" ></a></div>
		</td>
		<!-- �ΰ��� ��-->
		
		
		<!-- �˻����� ����-->
		<td  align="center">
		<div id="searchBox">
		<form name="search" method="post" action="search.do" >
		<input type="hidden" name="sc" value="all">
		<span class="radio"><input type="radio" name="sch_type" value="all" class="radio" onclick="sch_type_check(this.form);" checked/>���հ˻�</span> 
		<span class="radio"><input type="radio" name="sch_type" value="cook" class="radio" onclick="sch_type_check(this.form);"/>�޴���</span> 
			<input type="text" id="kw" name="kw" value=""  style="width: 200px; border-width: 5px; border-style: solid; border-color: #fea44d" />
		<input type="button" value="�˻�" style="background-color: #fea44d; color: white; font: bold;" onclick="onSearch(this.form);" />
		</form>
		</div>
		</td>
		<!-- �˻����� ��-->

		
		
		<!-- header ��� ������ ����--> 
		<td valign="top">
		<div class="gnavi">
		<ul>
			<li><a href="join.do">ȸ������</a></li>
			<li><a href="CartView.do">��ٱ���</a></li>
			<li><a href="mypage.do">����������</a></li>
			<c:if test = "${sessionScope.member.id eq 'admin' }">
			<li><a href="master/main.do">������������</a></li>
			</c:if>
			
		</ul>
		</div>
		</td>
</table>
</div>


<!--  ��� ���� �޴� ���� -->
<div id="mydroplinemenu" class="droplinebar">
<ul>
	<li><a href="http://localhost/peach">Ȩ</a></li>
	<li><a href="http://localhost/peach/">������ �˻�</a>
	<ul>
		<li><a href="search_st.do?st_type=�ѽ�&detail=������">�ѽ�</a></li>
		<li><a href="search_st.do?st_type=�߽�&detail=������">�߽�</a></li>
		<li><a href="search_st.do?st_type=���&detail=������">���</a></li>
		<li><a href="search_st.do?st_type=�Ͻ�&detail=������">�Ͻ�</a></li>
		<li><a href="search_st.do?st_type=�߽�&detail=������">�߽�</a></li>
		<li><a href="search_st.do?st_type=�н�&detail=������">�н�</a></li>
	</ul>
	</li>
	<li><a href="http://localhost/peach/">�޴��� �˻�</a>
	<ul>
		<li><a href="search_me.do?menu_sect=ġŲ&detail=������">ġŲ</a></li>
		<li><a href="search_me.do?menu_sect=����&detail=������">����</a></li>
		<li><a href="search_me.do?menu_sect=���İ�Ƽ&detail=������">���İ�Ƽ</a></li>
		<li><a href="search_me.do?menu_sect=���&detail=������">���</a></li>
		<li><a href="search_me.do?menu_sect=���ߺ���&detail=������">����&amp;����</a></li>
		<li><a href="search_me.do?menu_sect=���ö�&detail=������">���ö�</a></li>
		<li><a href="search_me.do?menu_sect=���&detail=������">���</a></li>
		<li><a href="search_me.do?menu_sect=ȸ&detail=������">ȸ</a></li>
		<li><a href="search_me.do?menu_sect=�߱��丮&detail=������">�߱��丮</a></li>
		<li><a href="search_me.do?menu_sect=�߽�&detail=������">�߽�</a></li>
	</ul>
	</li>
	<li><a href="http://localhost/peach/">��Ÿ �˻�</a>
	<ul>
		<li><a href="#">��õ ����</a></li>
		<li><a href="#">���� ����</a></li>
	</ul>
	</li>
</ul>
</div>
<!-- ��� ���� �޴� �� -->

</div>
<!-- ��� ���� �� -->




   
  


<!--���������� ����-->
<div id="content">
<table border="1" bordercolor="#fea44d" width="900" height="" cellpadding="0" cellspacing="0">
	<tr>
		  <td width="200" valign="top"> <!--������Left��������-->
			<table width="200"  border="0" cellspacing="0" cellpadding="0">
				<tr>
				  	<td valign="top" style="padding:0 0 5 0">
					<!--�α׾ƿ� ���� ����-->
					<c:if test="${sessionScope.member == null}" >			<!--  ������ member�� null�̸� -->
						
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
							<td height="100" align="center" valign="top" style="padding:15 16 0 16">
								<form id="loginForm" action=<c:url value="login.do"/> method="post">
									<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFACD">
									  <tr align="center">
											<td>
												<table border="0" cellspacing="2" cellpadding="0">
												  <tr>
														<td style="padding:0 0 0 5"><input type="text" name="id" class="input" tabindex="1"></td>
													 	<td>
													 		<select name = "member_type">
													 			<option value ="customer">�Ϲ�ȸ��</option>
													 			<option value ="administrator">������</option>
													 			<option value ="storeMember">����ȸ��</option>
													 		</select>
													 	</td>
												  </tr>
												</table>
											</td>
									  </tr>
									  
									  <tr>
											<td style="padding:1 0 10 0">
												<input type="password" name="pw"  tabindex="2" class="input_psw">
									     		<img src="images/main/login.jpg" alt="�α���" border="0" align="absmiddle" style="border: 0; cursor:pointer;" onClick="loginForm.submit();">
									     	</td>
									  </tr>
									  
									  <tr>
										<td class="Logout_01"><span class="Logout_02"><a href="join.do"><b>ȸ������</b></a></span><span class="sct">|</span><a href="javascript:idpwSearch();">���̵�ã��</a><span class="sct">|</span><a href="javascript:pwSearch();">��й�ȣã��</a></td>
									 </tr>
									</table>
								</form>
							</td>
						  </tr>
						</table>
						</c:if>
						<!--�α׾ƿ� ���� ��-->
						
						<!-- ###�α��� ����#### -->
						
						<!-- �Ϲ�ȸ�� �α��� ���� ���� -->
						<c:if test="${sessionScope.member != null }" >								<!--  ���� ������ member�� ������ -->
						<table width="100%" bgcolor="#FFFACD">
							<tr>
								<td>
								<font color ="blue"><b>${member.id}</b></font> �� ȯ���մϴ�.<br>											<!--  �̰͵��� ��Ÿ����. -->
								<a href = "<c:url value = "/memberModified.do"/>">[ȸ����������]</a><br>
								<a href = "<c:url value = "logout.do"/>">[�α׾ƿ�] </a>
								</td>
							</tr>
						</table>
						</c:if>
						<!-- �Ϲ�ȸ�� �α��� ����  �� -->
						
						<!-- ������(administrator) �α��� ���� ���� -->
						<c:if test="${sessionScope.admin_member != null }" >								<!--  ���� ������ member�� ������ -->
						<table width="100%" bgcolor="#FFFACD">
							<tr>
								<td>
								<font color ="blue"><b>${admin_member.id}</b></font> �� ȯ���մϴ�.<br>											<!--  �̰͵��� ��Ÿ����. -->
								<a href = "<c:url value = "/master/main.do"/>">[������������]</a><br>
								<a href = "<c:url value = "logout.do"/>">[�α׾ƿ�] </a>
								</td>
							</tr>
						</table>
						</c:if>
						<!-- ������(administrator) �α��� ����  �� -->
						
						<!-- ����ȸ��(storeMember) �α��� ���� ���� -->
						<c:if test="${sessionScope.store_member != null }" >								<!--  ���� ������ member�� ������ -->
						<table width="100%" bgcolor="#FFFACD">
							<tr>
								<td>
								<font color ="blue"><b>${store_member.userName}</b></font> �� ȯ���մϴ�.<br>											<!--  �̰͵��� ��Ÿ����. -->
								<a href = "<c:url value = "/memberModified.do"/>">[���Ժ�αװ���]</a><br>
								<a href = "<c:url value = "logout.do"/>">[�α׾ƿ�] </a>
								</td>
							</tr>
						</table>
						</c:if>
						<!-- ����ȸ��(storeMember) �α��� ����  �� -->
					</td>
				</tr>
				
				
				<tr>
		  			<td height="338" align="center" valign="top">
					<!--�ǽð� ���� ����-->
					<div>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td height="26">
									<div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
								<table width="100%" border="2" bordercolor="#fea44d">
									<tr>
										<td>
											�ǽð� ����
										</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</div>
			</td>
			</tr>
		
		</table>
		</td> <!-- ������ Left ���� ��  -->
		
		
		
		
		<td width="5"></td>
		
		<td width="680" valign="top"><!--������Right��������-->
			<table width="680" border="1" cellspacing="0" cellpadding="0" >
				<tr>  
					<td valign="top" style="padding: 0 0 5 0">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<c:import url="testBanner.jsp"></c:import>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td><!-- ������ Right ���� �� -->
	</tr>
</table>
</div>
<!--���������� ��-->





<!--footer����-->
<div id="footer">
<table border="0">
<tr>
<td>
			<div class="fLogo"><a href="/peach/main.jsp"><img src="images/logo.jpg" alt="��ħ����" border="0" /></a></div>
</td>
 <td>
			<div class="fNavi">
				<div class="fNavi01">
					<ul>
						<li><a href="/corporate/main.jsp" target="_blank">ȸ��Ұ�</a></li>
						<li><a href="/corporate/biz/main.asp" target="_blank">����о�</a></li>
						<li><a href="/corporate/recruit/main.asp" target="_blank">�������</a></li>
						<li><a href="/corporate/biz/main.asp" target="_blank">��ħ ���ǻ��</a></li>
						<li><a href="/corporate/partner/works.asp" target="_blank">���� �� ����</a></li>
						<li><a href="/Restaurant/register_guide/" target="_blank">������ ��� �� ����</a></li>
					</ul>
				</div>
 				<br/>
				<div class="fNavi02 clearfix">
					<ul>
						<li><a href="/corporate/partner/contents.asp" target="_blank">������ ���Ź���</a></li>
						<li><a href="/mymenupan/member/member_protect.asp" target="_blank"><b>����������޹�ħ</b></a></li>
					</ul>
				</div>
			</div>
			
</td>
</tr>
</table>
</div>
<!--footer���� ��  -->

</div>

</body>
</html>