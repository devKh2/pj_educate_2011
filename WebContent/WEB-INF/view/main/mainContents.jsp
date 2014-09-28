<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>

<script src="style/test/common.js" type="text/javascript"></script>
<script src="style/test/common_layer.js" type="text/javascript"></script>
<link href="style/test/common.css" rel="stylesheet" type="text/css" />
<link href="style/test/common_layer.css" rel="stylesheet" type="text/css" />
<script src="style/test/SmoothMovingLayer.js" type="text/javascript"></script>
<script src="style/test/SWFObject.js" type="text/javascript"></script>
<script src="style/test/SWFsize.js" type="text/javascript"></script>

<script type="text/javascript" src="style/test/jquery-1.4.4.js"></script>
<script type="text/javascript" src="style/test/navigation.js"></script>


<link href="style/test/sectionMain.css" rel="stylesheet" type="text/css" />
<script src="style/test/movie.js" type="text/javascript"></script>





<script type="text/javascript"> 
$jq('.bestList').ready(function(){
	var liWidth = $jq('.bestList .bestIn ul li:first').outerWidth()
	var btnA = $jq('.bestList .bestBtn a img');
	$jq('.bestList .bestIn ul').each(function(){
		$jq(this).css({
			'width' : $jq(this).contents('li').length * liWidth+liWidth
		});

	})

	
	$jq('.bestList .bestBtn a').eq(0).trigger('click');

	/* 식당가 소식 */
	$jq('.newsTab').ready(function() {
		$jq('.newsList').hide()
		$jq('.newsList:first').show();


		$jq('.newsTab li a').click(function() {
			var tabId1 = $jq(this).attr('href');

			$jq('.newsList').hide();
			$jq(tabId1).show();
			$jq('.newsTab li img').each(function(movIndex) {
				$jq('.newsTab li a img').eq(movIndex).attr('src', $jq('.newsTab li a img').eq(movIndex).attr('src').replace('_on.gif', '.gif'));
			});
			$jq(this).find('img').attr('src', $jq(this).find('img').attr('src').replace('.gif', '_on.gif'));
			return false;
		});
	});

	/* 인기 top5 */
	$jq(document).ready(function() {
		$jq('.topList').hide()
		$jq('.topList:first').show();
		var selId='#topList1';

		$jq('.topLiTab li a').click(function() {
			var topId = $jq(this).attr('href');
			selId = topId;
			$jq('.topList').hide();
			$jq(topId).show();

			$jq('.topLiTab li a img[src*="_on.gif"]').attr('src', $jq('.topLiTab li a img[src*="_on.gif"]').attr('src').replace('_on.gif', '.gif'));
			$jq(this).find('img').attr('src', $jq(this).find('img').attr('src').replace('.gif', '_on.gif'));
			over();
			return false;
		});

		$jq('.topList li').hover(
			function() {
				if($jq(selId+' li').index($jq(this))==0){
					$jq(this).find('img:first').attr('src', $jq(this).find('img:first').attr('src').replace('ic_top_1', 'ic_top_o1'));
				}else{
					$jq(selId+' li').eq(0).find('img:first').attr('src', $jq(selId+' li').eq(0).find('img:first').attr('src').replace('ic_top_o1', 'ic_top_1'));
					$jq(this).find('img:first').attr('src', $jq(this).find('img:first').attr('src').replace('ic_top_', 'ic_top_o'));
					$jq(this).find('a').css('color', '#de1a22');
				}
			},
			function() {
				$jq(this).find('img:first').attr('src', $jq(this).find('img:first').attr('src').replace('ic_top_o', 'ic_top_'));
				$jq(selId+' li').eq(0).find('a').css('color', '');
				$jq(this).find('a').css('color', '');
			}
		);

		$jq('.topList').hover(
			function() {},
			function() {over();}
		);

		function over() {
			$jq(selId+' li:eq(0)').trigger('mouseover');
			$jq(selId+' li:eq(0) a').css('color', '#de1a22');
		}

		over();
	});
});


</script>
</head>

<BODY> 

<div id="container">
	<div id="bodyWrapper">
		<!-- Contents Body -->

<!-- 섹션메인 // -->
			<div id="sectionMain_Movie">
			
			<!-- 공통배너// -->
			<div class="movieBigBanner">
				<c:choose>
					<c:when test = "${centerBanner.ban_picpath == null }">
						<a href = ""><img src='/peach/images/banner/bannerdefault1.jpg' width='760px' height='150' border="0"></a>
					</c:when>
					<c:otherwise>
						<a href = "${centerBanner.ban_linkAddr}" target="_blank"><img src='${centerBanner.ban_picpath}' width='760px' height='150' ></a>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- //공통배너 -->
				

				<div class="movieLogin" style="width:200px; height:151px;"  >
					<iframe src='main_login_form.do' style="width:200px; height:151px;" frameborder='0' scrolling='no'></iframe>
				</div>
 
			 	<!-- 배달가소식// -->
				<div class="movieNews">
					<p><img src="images/main/dil_stit1.jpg" alt="배달가 소식" /></p>
 
					<script type="text/javascript">
					</script>
 
					<ul class="newsTab">
						<li><a href="#dilStore"><img src="images/main/dil_news_tab1_on.gif" alt="배달맛집" /></a></li>
						<li><a href="#dilCook"><img src="images/main/cook_news_tab2.gif" alt="배달요리" /></a></li>
					</ul>
					
				<ul class="newsList" id="dilStore">
				<c:forEach var="store" items="${randomStoreList}" >
					<li>
						<a href="/peach/blog.do?stnum=${store.st_num}"  target="_blank"><img src="${store.st_picpath}" alt="" /></a>
						<span><strong><a href="/peach/blog.do?stnum=${store.st_num}">${store.st_name}</a></strong></span>
						<em>${store.st_sido} ${store.st_gugun} ${store.st_dong}</em>
					</li>
				</c:forEach>
				</ul>
				
				<ul class="newsList" id="dilCook">
				<c:forEach var="menu" items="${randomMenuList}" >
					<li>
						<a href="/peach/blog.do?stnum=${menu.st_num}"  target="_blank"><img src="${menu.menu_picpath}" alt="" /></a>
						<span><strong><a href="/peach/blog.do?stnum=${menu.st_num}">${menu.menu_name}</a></strong></span>
						<em>${menu.menu_comment}</em>
					</li>
				</c:forEach>
				</ul>		
				</div>
				<!-- //배달가소식 -->
			
 
				<!-- 공통배너// -->
				<div class="movieBanner">
					<c:choose>
						<c:when test = "${rightBanner.ban_picpath == null }">
							<a href = ""><img src='/peach/images/banner/bannerdefault2.jpg' width='220px' height='150' border="0"></a>
						</c:when>
						<c:otherwise>
							<a href = "${rightBanner.ban_linkAddr}" target="_blank"><img src='${rightBanner.ban_picpath}' width='220px' height='150' ></a>
					</c:otherwise>
				</c:choose>
				</div>
				<!-- //공통배너 -->
 
				<script type="text/javascript">
				</script>
 
				<style type="text/css">
					.topList {overflow: hidden}
				</style>
 
				<!-- 인기TOP5// -->
				<div class="movieTop5"><div class="inbox">
					<p><img src="images/main/dil_stit2.gif" alt="인기 TOP 5" /></p>
					<ul class="topLiTab">
						<li><a href="#topList1"><img src="images/main/dil_news_tab1_on.gif" alt="배달맛집" /></a></li>
						<li><a href="#topList2"><img src="images/main/cook_news_tab2.gif" alt="배달요리" /></a></li>
					</ul>
					<!-- 배달맛집top5리스트 -->
					<ul id="topList1" class="topList">
					
			<c:forEach var="store" items="${topStoreList}" varStatus = "level">
				<li class="first-child">
					<span class="num"><img src="http://mzimg.megapass.net/images/contentszone/comic/ic_top_${level.count}.gif" alt="${level.count}" /></span>
					<span class="state new">new</span>
					<span class="thumImg"><a href="/peach/blog.do?stnum=${store.st_num}"  target="_blank"><img src="${store.st_picpath}" alt="" /></a></span>
					<strong><a href="/peach/blog.do?stnum=${store.st_num}"  target="_blank">${store.st_name}</a></strong>
					<em class="runningTime">${store.st_sido} ${store.st_gugun}</em>
					<em class="grade"> ${store.st_type}</em>
				</li>
			</c:forEach>
			</ul>
 
					<!-- 배달요리 top5리스트 -->
		<ul id="topList2"class="topList">
			<c:forEach var="menu" items="${topMenuList}" varStatus = "level">
				<li class="first-child">
					<span class="num"><img src="http://mzimg.megapass.net/images/contentszone/comic/ic_top_${level.count}.gif" alt="${level.count}" /></span>
					<span class="state keep"></span>
					<span class="thumImg"><a href="/peach/blog.do?stnum=${menu.st_num}" target="_blank"><img src="${menu.menu_picpath }" alt="" /></a></span>
					<strong><a href="/peach/blog.do?stnum=${menu.st_num}" target="_blank">${menu.menu_name}</a></strong>
					<em class="runningTime">${menu.st_sido} ${menu.st_gugun} </em>
					<em class="grade">${menu.st_name}</em>
				</li>
			</c:forEach>
		</ul>
				</div></div>
				<!-- //인기TOP5 -->
				
				
 
				<div class="movieCnt">
					<!-- 오늘의 추천맛집!// -->
<div id="mega_markavg6" class="movieVod"><div class="inbox">
<p><img src="images/main/dil_stit3.gif" alt="오늘의 추천!" /></p>
<dl>
<c:set var = "flag" value = "1"/>
<c:forEach var = "list" items = "${randombbsList}">
<c:choose>
<c:when test = "${flag eq '1' }">
<c:set var = "flag" value = "2"/>
<dt><a href="/peach/blog.do?stnum=${list.st_num}" target="_blank">${list.st_name}</a></dt>
<dd class="thumImg"><a href="/peach/blog.do?stnum=${list.st_num}" target="_blank"><img src="${list.picpath}" alt="" /></a></dd>
<dd class="grade"><img src="images/main/starico/ic_star_${list.ebbs_score}.gif" alt="평점" /> <em>${list.ebbs_score}</em></dd>
<dd class="desc">${list.ebbs_title}</dd>
</dl>
</c:when>
<c:otherwise>
<ul>
<li style="white-space: normal;">
<img src="images/main/starico/ic_star_${list.ebbs_score}.gif" alt="평점" /> <em>${list.ebbs_score}</em><span class="desc">${list.ebbs_title }</span>
</li>
</ul>
</c:otherwise>
</c:choose>
</c:forEach>
</div></div>					<!-- //오늘의 추천맛집! -->
 
					<!-- 맛집 Q&A// -->
					<div class="movieDownload"><div class="inbox">
						<p><img src="images/main/dil_stit4.gif" alt="맛집 QnA 궁금해요" /></p>
						<ul>
						<c:forEach var="qna" items="${randomQnAList}" varStatus = "level">
							<li class="first-chlid"><a href="/peach/mbbs_read.do?artId=${qna.mbbs_artid}" ><img src="images/main/ic_q.gif" alt="" />${qna.mbbs_title}</a><span>| ${qna.mbbs_content}</span></li>
						</c:forEach>
						</ul>
					</div></div>
					<!--  맛집 Q&A-->
				</div>
				
				
				<!-- 배달 맛집 지도 영역// -->
				<div class="movieCine21" style="width:220px; height:361px; background:#eee;">
					<iframe class="cpIframe" src="${storeMap}" style="width:220px;height:361px;" title="씨네21" id="cpIframe3" name="cpIframe3" frameborder="0" scrolling="no" ></iframe>
				</div>
				<!-- //배달 맛집 지도 영역 -->
				
			</div>
			<!-- //섹션메인-->





</div>
</div>


</body>
</html>

