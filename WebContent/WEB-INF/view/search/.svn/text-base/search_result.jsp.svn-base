<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>군침.. 츄르륵</title>
<!-- Framework CSS -->

<link rel="stylesheet" href="style/basic.css" type="text/css">
<link rel="stylesheet" href="style/layout.css" type="text/css">
<link rel="stylesheet" href="style/search.css" type="text/css">
<script language="javascript" src="/Search/Script/sch_common.js"></script>

<link rel="stylesheet" type="text/css" href="style/droplinebar.css" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<script src="style/droplinemenu.js" type="text/javascript"></script>

<script type="text/javascript">
	//build menu with DIV ID="myslidemenu" on page:
	droplinemenu.buildmenu("mydroplinemenu")
</script>

<script>

	function login(){
		window.open('login_form.do','newwindow', 
				'top=300, left=300, width=120, height=150, toolbar=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0');
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
	
	
	
</script>

</head>

<body>
<!--  전체 Wrap 시작 -->
<div id="wrapper">

<!-- 헤더 영역 시작 -->
<div id="header">
<div class="Htop">
<table border="0" align="center">
	<tr>
		
		<!-- 로고영역 시작 -->
		<td>
		<div class="logo"><a href="/peach/"><img src="images/logo.jpg"
			border="0" width="170px"></a></div>
		</td>
		<!-- 로고영역 끝 -->
		
		
		<!-- 검색영역 시작-->
		<td align="center">
			<div id="searchBox">
				<form id="search" method="post" action="search.do">
					<input type="hidden" name="sc" value="${searParam.sc}">
					<span class="radio"><input type="radio" class="radio" name="sch_type" value="all" <c:if test = "${searParam.sc != '' && searParam.sc eq 'all' }">checked</c:if> onclick="sch_type_check(this.form);"/>통합검색</span> 
					<span class="radio"><input type="radio" class="radio" name="sch_type" value="cook" <c:if test = "${searParam.sc != '' && searParam.sc eq 'cook' }">checked</c:if> onclick="sch_type_check(this.form);"/>메뉴명</span> 
					<input type="text" id="kw" name="kw" value=""  style="width: 200px; border-width: 5px; border-style: solid; border-color: #fea44d" />
					<input type="button" value="검색" style="background-color: #fea44d; color: white; font: bold;" onclick="onSearch(this.form)"/>
				</form>
			</div>
		</td>
		<!-- 검색영역 끝 -->
		
		
		
		
		
		<!--header 상단 오른쪽 영역 시작--> 
		<td valign="top">
			<div class="gnavi">
			<ul>
				<li><a href="join.do" target="_blank">회원가입</a></li>
				<li><a href="mypage.do" target="_blank">마이페이지</a></li>
			</ul>
				<div class="btn">
					<c:if test = "${sessionScope.member == null}">
						<a href="javascript:login()"><img src="images/btn_gnavi_login.jpg" alt="로그인" align="absmiddle" /></a>
					</c:if>
				</div>
			</div>

		</td>
		<!--header 상단 오른쪽 영역 끝--> 
		
</table>
</div>



<!-- 상단 메인 메뉴 시작 -->
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
	<li><a href="mbbs_list.do" target="_blank">게시판</a>
	<li><a href="nbbs_list.do" target="_blank">공지사항</a>
</ul>
</div>
<!-- 상단 메인 메뉴 끝 -->



</div>
<!-- 헤더 영역 끝 -->


<!-- 검색 결과  Contents -->
<!--컨텐츠영역-->
			<div id="searchContainer" >
				<div id="searchContent">
					<div id="searchContent_Inner">
					
					<!--음식점-->
							
			<div class="section">
				<h2>음식점</h2>
					
				<ul class="listStyle4">
 <c:choose>
	<c:when test="${requestScope.storelistModel.hasStore == false}">
	<tr>
		<td colspan="5">
		
			게시글이 없습니다.
		</td>
	</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="store" items="${storelistModel.storeList}" >
			<li>
				<div class="imgDiv">
					<table>
						<tr>
							<td><a href="/peach/blog.do?stnum=${store.st_num}" target="_blank"><img src="${store.st_picpath}" width="100px" height="100px" class="thumb" border="0"></a></td>
						</tr>
					</table>
				</div>
				<dl>
					<dt><a href="/peach/blog.do?stnum=${store.st_num}" target="_blank"><b>${store.st_name}</b></a></dt>
					<dd></dd>
					<dd class="sum">${store.st_sido} ${store.st_gugun} ${store.st_dong}</dd>
					<dd class="sum">${store.st_ph}</dd>
					
				</dl>
			</li>
		</c:forEach>
	</c:otherwise>
</c:choose>
		
			</ul>	
				<div class="moreDiv"><img src="images/bul_arrow2.gif" alt="" /><a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=음식점">음식점 더보기</a></div>
			</div>
					
					
					<!--요리-->
							
	<div class="section">
		<h2>요리</h2>
		<ul class="listStyle4">
	<c:choose>
	<c:when test="${requestScope.menulistModel.hasMenu == false}">
	<tr>
		<td colspan="5">
			게시글이 없습니다.
		</td>
	</tr>
	</c:when>
	<c:otherwise>
	<!-- 시작 번호 = 총 게시물 수 - ((현재페이지 -1) * 페이지당 게시물 수)  -->
	
	<c:forEach var="menu" items="${menulistModel.menuList}" >
		<li>
				<div class="imgDiv">
					<table>
						<tr>
							<td><a href="/peach/blog.do?stnum=${menu.st_num}" target="_blank"><img src="${menu.menu_picpath}"  width=100 border=0></a></td>
						</tr>
					</table>
				</div>
				<dl>
					<dt><a href="/peach/blog.do?stnum=${menu.st_num}" target="_blank"><strong>${menu.menu_name}</strong></a></dt>
					<dd class="sum">가격 : ${menu.menu_price}</dd>
					<dd class="sum">코멘트 : ${menu.menu_comment}</dd>
				</dl>
			</li>
	</c:forEach>
	<!--  <tr>
		<td colspan="5">
		
		</td>
	</tr>-->
	</c:otherwise>
</c:choose>
	
	</ul>
		<div class="moreDiv"><img src="images/bul_arrow2.gif" alt="" /><a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=요리">요리 더보기</a></div>
	</div>
					
					
						<!--게시글-->					
							
	<div class="section">
		<h2>게시글</h2>
	<ul class="listStyle3">
	<c:choose>
	<c:when test="${requestScope.mbbs_articleListModel.hasArticle == false}">
	<tr>
		<td colspan="5">
			게시글이 없습니다.
		</td>
	</tr>
	</c:when>
	<c:otherwise>
	<!-- 시작 번호 = 총 게시물 수 - ((현재페이지 -1) * 페이지당 게시물 수)  -->
	
	<c:forEach var="article" items="${mbbs_articleListModel.articleList}" >
		<li>
			<dl>
				<dt><a href="/peach/mbbs_read.do?artId=${article.mbbs_artid}" target="_blank">${article.mbbs_title}</a></dt>
				<dd class="inline date">${article.mbbs_regdate}</dd>
				<dd class="sum">${article.mbbs_content}</dd>
				<dd class="info"> ${article.mbbs_arttype}</a></span>   | 조회수 :${article.mbbs_count}| 작성자 : ${article.cu_id}</dd>
			</dl>
		</li>	
	</c:forEach>
	</c:otherwise>
</c:choose>
	
	</ul>
		<div class="moreDiv"><img src="images/bul_arrow2.gif" alt="" /><a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=게시판">게시판 더보기</a></div>
	</div>
					
			</div>
			</div>
			</div>





</div>
<!--  전체 Wrap 끝 -->


</body>
</html>