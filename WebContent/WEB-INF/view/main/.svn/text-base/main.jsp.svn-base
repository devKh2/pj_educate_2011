<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>군침.. 츄르륵</title>
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
	function onSearch(oFrm){//검색하기
			var val_search = oFrm.kw.value;
			var val_schtype = oFrm.sc.value;
			sch_type_check(oFrm);
			if (val_search.length==0) {
				alert("검색어를 입력해 주십시요");
				return false;
			} 
			oFrm.submit();
	}
	
	// 아이디찾기 팝업창을 실행시키기 위한 함수
	function idpwSearch(){
		window.open('member_idsearch.do','newwindow', 
				'top=0, left=0, width=550, height=250, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	// 비밀번호착기 팝업창을 실행시키기 위한 함수
	
	function pwSearch(){
		window.open('member_pwsearch.do','newwindow', 
		'top=0, left=0, width=550, height=250, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
	}
	
	//팝업 창 오늘은 다시 열지 않기
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
<!--  전체 Wrap 시작 -->
<div id="wrapper">

<!-- 헤더 영역 시작 -->
<div id="header">
<div class="Htop">
<table border="0" align="center" >
	<tr>
		<!-- 로고영역 시작-->
		<td>
		<div class="logo"><a href="/peach/"><img src="images/logo.jpg"
			border="0" width="170px" ></a></div>
		</td>
		<!-- 로고영역 끝-->
		
		
		<!-- 검색영역 시작-->
		<td  align="center">
		<div id="searchBox">
		<form name="search" method="post" action="search.do" >
		<input type="hidden" name="sc" value="all">
		<span class="radio"><input type="radio" name="sch_type" value="all" class="radio" onclick="sch_type_check(this.form);" checked/>통합검색</span> 
		<span class="radio"><input type="radio" name="sch_type" value="cook" class="radio" onclick="sch_type_check(this.form);"/>메뉴명</span> 
			<input type="text" id="kw" name="kw" value=""  style="width: 200px; border-width: 5px; border-style: solid; border-color: #fea44d" />
		<input type="button" value="검색" style="background-color: #fea44d; color: white; font: bold;" onclick="onSearch(this.form);" />
		</form>
		</div>
		</td>
		<!-- 검색영역 끝-->

		
		
		<!-- header 상단 오른쪽 영역--> 
		<td valign="top">
		<div class="gnavi">
		<ul>
			<li><a href="join.do" target="contentPage">회원가입</a></li>
			<li><a href="mypage.do" target="contentPage">마이페이지</a></li>
		</ul>
		</div>
		</td>
</table>
</div>


<!--  상단 메인 메뉴 시작 -->
<div id="mydroplinemenu" class="droplinebar">
<ul>
	<li><a href="http://localhost/peach/">홈</a></li>
	<li><a href="http://localhost/peach/">업종별 검색</a>
	<ul>
		<li><a href="search_st.do?st_type=한식&detail=음식점">한식</a></li>
		<li><a href="search_st.do?st_type=중식&detail=음식점">중식</a></li>
		<li><a href="search_st.do?st_type=양식&detail=음식점">양식</a></li>
		<li><a href="search_st.do?st_type=일식&detail=음식점">일식</a></li>
		<li><a href="search_st.do?st_type=야식&detail=음식점">야식</a></li>
		<li><a href="search_st.do?st_type=분식&detail=음식점">분식</a></li>
	</ul>
	</li>
	<li><a href="http://localhost/peach/">메뉴별 검색</a>
	<ul>
		<li><a href="search_me.do?menu_sect=치킨&detail=음식점">치킨</a></li>
		<li><a href="search_me.do?menu_sect=피자&detail=음식점">피자</a></li>
		<li><a href="search_me.do?menu_sect=스파게티&detail=음식점">스파게티</a></li>
		<li><a href="search_me.do?menu_sect=돈까스&detail=음식점">돈까스</a></li>
		<li><a href="search_me.do?menu_sect=족발보쌈&detail=음식점">족발&amp;보쌈</a></li>
		<li><a href="search_me.do?menu_sect=도시락&detail=음식점">도시락</a></li>
		<li><a href="search_me.do?menu_sect=백반&detail=음식점">백반</a></li>
		<li><a href="search_me.do?menu_sect=회&detail=음식점">회</a></li>
		<li><a href="search_me.do?menu_sect=중국요리&detail=음식점">중국요리</a></li>
		<li><a href="search_me.do?menu_sect=야식&detail=음식점">야식</a></li>
		<li><a href="search_me.do?menu_sect=분식&detail=음식점">분식</a></li>
	</ul>
	</li>
	<li><a href="http://localhost/peach/">기타 검색</a>
	<ul>
		<li><a href="#">추천 맛집</a></li>
		<li><a href="#">지역 선정</a></li>
	</ul>
	</li>
	<li><a href="mbbs_list.do" target="contentPage">게시판</a>
	<li><a href="nbbs_list.do" target="contentPage">공지사항</a>
</ul>
</div>
<!-- 상단 메인 메뉴 끝 -->

</div>
<!-- 헤더 영역 끝 -->




   
  



<div id="content">
<!--컨텐츠영역 시작-->
<iframe name = "contentPage" src='mainContents.do' width='1000' height='800' frameborder='0' scrolling='no' marginwidth='0' marginheight='0'></iframe>
<!--컨텐츠영역 끝-->
</div>





<!--footer영역-->
<div id="footer">
<table border="0">
<tr>
<td>
			<div class="fLogo"><a href="/peach/main.jsp"><img src="images/logo.jpg" alt="군침닷컴" border="0" /></a></div>
</td>

 <td>
			<div class="fNavi">
				<div class="fNavi01">
					<ul>
						<li><a href="/corporate/main.jsp" target="_blank">회사소개</a></li>
						<li><a href="/corporate/biz/main.asp" target="_blank">사업분야</a></li>
						<li><a href="/corporate/recruit/main.asp" target="_blank">사원모집</a></li>
						<li><a href="/corporate/biz/main.asp" target="_blank">군침 출판사업</a></li>
						<li><a href="/corporate/partner/works.asp" target="_blank">광고 및 제휴</a></li>
						<li><a href="/Restaurant/register_guide/" target="_blank">음식점 등록 및 광고</a></li>
					</ul>
				</div>
 				<br/>
				<div class="fNavi02 clearfix">
					<ul>
						<li><a href="/corporate/partner/contents.asp" target="_blank">컨텐츠 구매문의</a></li>
						<li><a href="/mymenupan/member/member_protect.asp" target="_blank"><b>개인정보취급방침</b></a></li>
					</ul>
				</div>
			</div>
			
</td>
</tr>
</table>
</div>
<!--footer영역 끝  -->

</div>

</body>
</html>