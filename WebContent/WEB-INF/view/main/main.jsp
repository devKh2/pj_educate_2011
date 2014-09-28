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
	function popup(firstPopup, firstPopupLinkAddr, secondPopup, secondPopupLinkAddr){
		if(firstPopup != ''){
			window.open('picExpand.do?picPath=' + firstPopup + '&linkAddr=' + firstPopupLinkAddr , 'pop', 'top=0, left=0, width=200, height=300, toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');		
		}
		if(secondPopup != ''){
			window.open('picExpand.do?picPath=' + secondPopup + '&linkAddr=' + secondPopupLinkAddr , 'pop1', 'top=0, left=265, width=200, height=300, toolbar=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0');
		}
	}
		
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
	droplinemenu.buildmenu("mydroplinemenu");
</script>

</head>
<body onload="popup('${firstPopup.pop_picpath}', '${firstPopup.pop_linkAddr}', '${secondPopup.pop_picpath}', '${secondPopup.pop_linkAddr}')">
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
			<li><a href="join.do" target="contentPage">ȸ������</a></li>
			<li><a href="mypage.do" target="contentPage">����������</a></li>
		</ul>
		</div>
		</td>
</table>
</div>


<!--  ��� ���� �޴� ���� -->
<div id="mydroplinemenu" class="droplinebar">
<ul>
	<li><a href="http://localhost/peach/">Ȩ</a></li>
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
		<li><a href="search_me.do?menu_sect=�н�&detail=������">�н�</a></li>
	</ul>
	</li>
	<li><a href="http://localhost/peach/">��Ÿ �˻�</a>
	<ul>
		<li><a href="#">��õ ����</a></li>
		<li><a href="#">���� ����</a></li>
	</ul>
	</li>
	<li><a href="mbbs_list.do" target="contentPage">�Խ���</a>
	<li><a href="nbbs_list.do" target="contentPage">��������</a>
</ul>
</div>
<!-- ��� ���� �޴� �� -->

</div>
<!-- ��� ���� �� -->




   
  



<div id="content">
<!--���������� ����-->
<iframe name = "contentPage" src='mainContents.do' width='1000' height='800' frameborder='0' scrolling='no' marginwidth='0' marginheight='0'></iframe>
<!--���������� ��-->
</div>





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