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
				<form name="search" method="post" action="search.do"">
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

<!--컨텐츠영역-->

<!--게시판/공지사항 시작-->


<!--게시판/공지사항 끝-->

<!-- 검색 결과  Contents -->
			<div id="searchContainer">
				<div id="searchContent">
					<div id="searchContent_Inner">
					
			
 <c:choose>
 	
 	<c:when test="${searParam.detail eq '음식점'}">
 		<c:choose>
			<c:when test="${requestScope.storelistModel.hasStore == false}">
				<!--검색결과 없을때-->
				<div class="section">
						<dl class="listStyle5">
		                  <dt><span>'${searchSect}'</span>에 대한 검색결과가 없습니다.</dt>
                  		</dl>           
			  	</div>
		  		<!--//검색결과 없을때 끝-->
			</c:when>
			
			
			<c:otherwise>
				<div class="section">
				
		
			<table border="0">
				<tr>
					<td align="left"><h2>${searParam.detail}</h2></td>
		              
		
					<td align="right" style="padding-left: 100px">
						<table cellpadding="0" cellspacing="" border="0" width="710" height="40" background="images/mainChStyle/bar_bg_1.gif" style="padding: 10 5 10 10;">
							<style type="text/css" title=""> 
								.c01_s	{font-size:11px; COLOR:#E3857D; font-family:돋움; TEXT-DECORATION:none; letter-spacing:-1px; }
								a:link {color:#666666; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
								a:visited {color:#666666; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
								a:active {color:#666666; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
								a:hover {color:#333333; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
							</style>	 
							<tr>
							  <td align="center">
							  	<c:set var="endrow" value="${storelistModel.endRow}" />
								<c:set var="startrow" value = "${storelistModel.startRow}" />
								<c:set var ="totalRow" value="${endrow - startrow + 1}"/>
								
							    <B class="c01_s">${storelistModel.totalStoreCount}</B>   item in this category
							  </td>
							  <td align="right" style="padding-right: 15px">
							  <c:choose>
								    <c:when test="${searParam.kw != null && searParam.sc != null}">
								        <a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=음식점&sort_method=sale">판매순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
										<a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=음식점&sort_method=visit">조회순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
								    </c:when>
								    <c:when test="${searParam.menu_sect != null}">
								    	<a href="search_me.do?menu_sect=${searParam.menu_sect}&detail=음식점&sort_method=sale">판매순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
										<a href="search_me.do?menu_sect=${searParam.menu_sect}&detail=음식점&sort_method=visit">조회순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
								    </c:when>
								    <c:otherwise>
								        <a href="search_st.do?st_type=${searParam.st_type}&detail=음식점&sort_method=sale">판매순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
										<a href="search_st.do?st_type=${searParam.st_type}&detail=음식점&sort_method=visit">조회순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
								    </c:otherwise>
								</c:choose>
					
								
							  </td>
							</tr>
						</table>
							
					</td>
				</tr>
			 </table>
					
						  
				
					
				<ul class="listStyle3">
				
					<table border="0">
						<c:if test="${requestScope.storelistModel.totalPageCount > 0}">
						<tr>
							<td colspan="5" >
							<strong style="color: #ff7f50;">
							[Page ${storelistModel.requestPage} of ${storelistModel.totalPageCount} pages ]</strong>
							</td>
						</tr>
						</c:if>
					</table>
					<br/>
				
			
			
				<c:forEach var="store" items="${storelistModel.storeList}" >
					
					<li>
						<div class="imgDiv">
							<a href="/peach/blog.do?stnum=${store.st_num}" target="_blank"><img src="${store.st_picpath}" width="70px" height="70px" class="thumb" border="0"></a><span class="btn"><img src="images/ico_plus.gif" alt="더보기" onMouseOver="imgmore('R106429_imgview',1);" onMouseOut="imgmore('R106429_imgview',0);" style="cursor:hand"/></span>
						</div>
						<dl>
							<dt>
							<a href="/peach/blog.do?stnum=${store.st_num}" target="_blank"><b>${store.st_name}</b></a></dt>
							<dd class="sum3"><span class="part">${store.st_type} |</span> <strong><strong>${menu_sect}</strong></strong></dd>
							<dd class="sum">상세주소  : ${store.st_detailaddr} | 전화번호 : ${store.st_ph} | 영업시간 : ${store.st_optime}</dd>
						</dl>
					</li>
				</c:forEach>
		
				<tr>
					<td colspan="5">
					<c:set var ="path" value=""/>
						<c:if test="${searParam.kw != null}" >
					<c:set var="path" value="&sc=${searParam.sc}&kw=${searParam.kw}&detail=${searParam.detail}"/> 
					</c:if>
					<c:if test="${storelistModel.endPageNumber > 10}">
						<a href="<c:url value="/search.do?p=${storelistModel.beginPageNumber-1}"/>"><img src="images/btn_paging_prev.gif" alt="이전" /></a>
					</c:if>
					
					<c:forEach var="pno" begin="${storelistModel.beginPageNumber}" end="${storelistModel.endPageNumber}">
						<a href="<c:url value="/search.do?p=${pno}${path}" />">[${pno}]</a>
					</c:forEach>
					
					<c:if test="${storelistModel.endPageNumber < storelistModel.totalPageCount}">
						<a href="<c:url value="/search.do?p=${storelistModel.endPageNumber + 1}"/>"><img src="images/btn_paging_next.gif" alt="다음" /></a>
					</c:if>
					</td>
				</tr>
				</ul>
			</div>
			</c:otherwise>
		</c:choose>
	</c:when>
	
	
	<c:when test="${searParam.detail eq '요리' }">
		<c:choose>
			<c:when test="${requestScope.menulistModel.hasMenu == false}">
				<!--검색결과 없을때-->
				<div class="section">
						<dl class="listStyle5">
		                  <dt><span>'${searchSect}'</span>에 대한 검색결과가 없습니다.</dt>
                  		 </dl>           
			  	</div>
		  		<!--//검색결과 없을때 끝-->
			</c:when>
			<c:otherwise>
				<div class="section">
				
				<table border="0">
				<tr>
					<td align="left"><h2>${searParam.detail}</h2></td>
		               
		
					<td align="right" style="padding-left: 100px">
						<table cellpadding="0" cellspacing="" border="0" width="710" height="40" background="images/mainChStyle/bar_bg_1.gif" style="padding: 10 5 10 10;">
							<style type="text/css" title=""> 
								.c01_s	{font-size:11px; COLOR:#E3857D; font-family:돋움; TEXT-DECORATION:none; letter-spacing:-1px; }
								a:link {color:#666666; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
								a:visited {color:#666666; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
								a:active {color:#666666; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
								a:hover {color:#333333; font-family:돋움; font-size:12px; text-decoration:none; line-height:140%;}
							</style>	 
							<tr>
							  <td align="center">
							    <B class="c01_s">${menulistModel.totalMenuCount}</B>   item in this category
							  </td>
							  <td align="right" style="padding-right: 15px">
							    <a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=요리&sort_method=asc">낮은가격순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
								<a href="search.do?sc=${searParam.sc}&kw=${searParam.kw}&detail=요리&sort_method=desc">높은가격순 <img src="images/mainChStyle/arrow_select.gif" border="0" align="absmiddle"></a>
							  </td>
							</tr>
						</table>
							
					</td>
				</tr>
			 </table>
					
				<ul class="listStyle3">
					<table border="0">
						<c:if test="${requestScope.menulistModel.totalPageCount > 0}">
						<tr>
							<td colspan="5">
							<strong style="color: #ff7f50;">
							[Page ${menulistModel.requestPage} of ${menulistModel.totalPageCount} pages]</strong>
							</td>
						</tr>
						</c:if>
					</table>
					<br/>
		
				<c:forEach var="menu" items="${menulistModel.menuList}" >
					<li>
						<div class="imgDiv">
							<a href="/peach/blog.do?stnum=${menu.st_num}" target="_blank"><img src="${menu.menu_picpath}" width="70px" height="70px" class="thumb" border="0"></a><span class="btn"><img src="images/ico_plus.gif" alt="더보기" onMouseOver="imgmore('R106357_imgview',1);" onMouseOut="imgmore('R106357_imgview',0);" style="cursor:hand"/></span>
						</div>
						
						<dl>
							<dt><a href="/peach/blog.do?stnum=${menu.st_num}" target="_blank"><b>${menu.menu_name}</b></a></dt>
							<dd class="sum">${menu.st_name}</dd>
							<dd class="sum3"><span class="part">가격 : ${menu.menu_price} 원|</span> ${menu.menu_comment}</dd>
						</dl>
					</li>
				</c:forEach>
				
				<tr>
					<td colspan="5">
					<c:set var ="path" value=""/>
						<c:if test="${searParam.kw != null}" >
					<c:set var="path" value="&sc=${searParam.sc}&kw=${searParam.kw}"/> 
					</c:if>
					<c:if test="${menulistModel.beginPageNumber > 10}">
						<a href="<c:url value="/search.do?p=${menulistModel.beginPageNumber-1}"/>"><img src="images/btn_paging_prev.gif" alt="이전" /></a>
					</c:if>
					
					<c:forEach var="pno" begin="${menulistModel.beginPageNumber}" end="${menulistModel.endPageNumber}">
						<a href="<c:url value="/search.do?p=${pno}${path}" />">[${pno}]</a>
					</c:forEach>
					
					<c:if test="${menulistModel.endPageNumber < menulistModel.totalPageCount}">
						<a href="<c:url value="/search.do?p=${menulistModel.endPageNumber + 1}"/>"><img src="images/btn_paging_next.gif" alt="다음" /></a>
					</c:if>
					</td>
				</tr>
				
				</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>
	
	
	
	<c:when test="${searParam.detail eq '게시판' }">
		<c:choose>
			<c:when test="${requestScope.mbbs_articleListModel.hasArticle == false}">
				<!--검색결과 없을때-->
				<div class="section">
						<dl class="listStyle5">
		                  <dt><span>'${searchSect}'</span>에 대한 검색결과가 없습니다.</dt>
                  		 </dl>           
			  	</div>
		  		<!--//검색결과 없을때 끝-->
			</c:when>
			<c:otherwise>
				<div class="section">
				
				<table border="0">
				<tr>
					<td align="left"><h2>${searParam.detail}</h2></td>
				</tr>
			 </table>
					
				<ul class="listStyle3">
					<table border="0">
						<c:if test="${requestScope.mbbs_articleListModel.totalPageCount > 0}">
						<tr>
							<td colspan="5">
							<strong style="color: #ff7f50;">
							[Page ${mbbs_articleListModel.requestPage} of ${mbbs_articleListModel.totalPageCount} pages]</strong>
							</td>
						</tr>
						</c:if>
					</table>
					<br/>
		
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
				
				<tr>
					<td colspan="5">
					<c:set var ="path" value=""/>
						<c:if test="${searParam.kw != null}" >
					<c:set var="path" value="&sc=${searParam.sc}&kw=${searParam.kw}"/> 
					</c:if>
					<c:if test="${mbbs_articleListModel.beginPageNumber > 10}">
						<a href="<c:url value="/search.do?p=${mbbs_articleListModel.beginPageNumber-1}"/>"><img src="images/btn_paging_prev.gif" alt="이전" /></a>
					</c:if>
					
					<c:forEach var="pno" begin="${mbbs_articleListModel.beginPageNumber}" end="${mbbs_articleListModel.endPageNumber}">
						<a href="<c:url value="/search.do?p=${pno}${path}" />">[${pno}]</a>
					</c:forEach>
					
					<c:if test="${mbbs_articleListModel.endPageNumber < mbbs_articleListModel.totalPageCount}">
						<a href="<c:url value="/search.do?p=${mbbs_articleListModel.endPageNumber + 1}"/>"><img src="images/btn_paging_next.gif" alt="다음" /></a>
					</c:if>
					</td>
				</tr>
				
				</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>
		
</c:choose>

	

		
						
			</div>
			</div>
			</div>





</div>
<!--  전체 Wrap 끝 -->


</body>
</html>