
var $jq = jQuery.noConflict();

/* 인클루드 방식인 경우 스크립트 */
selectMenuFN=function(menuid){
	dep3View();
	fnRollover('#ollehDepth2Menu ul li ul li img');
	if($jq('#ollehDepth3Menu').length==1){
		fnRollover('#ollehDepth3Menu ul a img');
		$jq('img.menuMore').unbind('mouseover')
	}
	ollehLeftMenu(menuid);
}


/* load 방식인 경우 스크립트 
selectMenuFN=function(menuid){
	$jq('#ollehDepth2Menu').load('gnb.html', function(){
		dep3View();
		fnRollover('#ollehDepth2Menu ul li ul li img');

		if($jq('#ollehDepth3Menu').length==1){
			$jq('#ollehDepth3Menu').load('lnb.html', function(){
				fnRollover('#ollehDepth3Menu ul a img');
				$jq('img.menuMore').unbind('mouseover')
				ollehLeftMenu(menuid); // 메뉴아이디 하나만 넘기면 됨.
			})
		}else{
			ollehLeftMenu(menuid); //lnb 가 없는경우 호출..
		}
	});
}
*/

dep3View = function(){
	var currentImg;
	// 2dep메뉴 오버 스크립트
	$jq('#ollehDepth2Menu>ul>li').hover(
		function(){
//			alert($jq(this).find('a img').eq(0).attr('src'))
			$jq(this).contents('div').show();
			$jq(this).contents('div').css('z-index','100')
			if($jq(this).find('a img').eq(0).hasClass('menuOver')!=true){
				currentImg =$jq(this).find('a img').eq(0).attr('src').replace('.gif','_on.gif' );
				$jq(this).find('a img').eq(0).attr('src', currentImg);
			}
		},
		function(){
			$jq(this).contents('div').hide();
			$jq(this).contents('div').css('z-index','1')
			currentImg = $jq(this).find('a img').eq(0).attr('src').replace('_on.gif','.gif' );
			$jq(this).find('a img').eq(0).attr('src', currentImg);
		}
	)
}

/*
	Function Name : fnRollover
	attr : rollover가 되어야할 이미지 그룹 엘리먼트 dom
	ex ) fnRollover('#ollehDepth2Menu img') : id가 ollehDepth2Menu 영역의 모든 이미지에 롤오버
*/

fnRollover = function(overElement){
	$jq(overElement).bind({
		mouseover : function() {
			var currentImg = $jq(this).attr('src');
			if ($jq(this).attr('src').indexOf('_on.gif') > 0){
				$jq(this).addClass ('menuOver');
			}else{
				currentImg = $jq(this).attr('src').replace('.gif','_on.gif' );
			}
			$jq(this).attr('src', currentImg);
		},
		mouseout : function() {
			if($jq(this).hasClass('menuThis')!=true || $jq(this).hasClass('menuOver')!=true){
				var currentImg = $jq(this).attr('src').replace('_on.gif','.gif' );
				$jq(this).attr('src', currentImg);
			}
		}
	})
}

ollehLeftMenu=function(menuid){
	if(menuid==null||menuid=='') return false;
	var selBlock =$jq('#ollehDepth2Menu > ul').find('[id$="'+menuid+'"]')
	if(selBlock.length>0){
		depthOn(selBlock.attr('id'))
	}else{
		selBlock =$jq('#ollehDepth3Menu > ul').find('[id$="'+menuid+'"]')
		if(selBlock.length==0){
			selBlock=$jq('#ollehDepth3Menu > ul').find('[class*="'+menuid+'"]');
			if(selBlock.length==0) selBlock=$jq('#ollehDepth3Menu > ul').find('[id*="'+menuid.substring(0,4)+'"]');	  
			if(selBlock.length==0) return false;
		}

		//4depth 숨기기

		var selId =selBlock.eq(0).attr('id');
		var dep2id = 0;

		if(selId.indexOf('C')==0){
			selBlock.parents('div.dep4bg').show()
			depthOn(selBlock.parents('li').attr('id')); // 3dep on
			dep2id = 1; // 2dep id
			selBlock.parents('li').find('img.menuMore').attr('src', 'http://mzimg.megapass.net/images/contentszone/common_zone/navi/minus.gif')
		}

		// left title 이미지 체크
		var titleImg = $jq('#'+selBlock.parents('ul').eq(dep2id).attr('class')+' >a img:first').attr('src');
		var titleAlt = $jq('#'+selBlock.parents('ul').eq(dep2id).attr('class')+' >a img:first').attr('alt');
		titleImg =  titleImg.replace('gnb_', 'lnb_')
		$jq('.title a img').attr('src', titleImg).attr('alt', titleAlt); // 이미지 텍스트 바꾸기


		depthOn(selId) //현재 메뉴on
		depthOn(selBlock.parents('ul').eq(dep2id).attr('class')); //lnb
	}

	function depthOn(imgEl){
		var onText = '_on.gif';
		if(imgEl.indexOf('A')==0){
			onText = '_s.gif';
		}
		var thisImg =$jq('#'+imgEl+'> a img:first').attr('src').replace('.gif',onText)
		$jq('#'+imgEl+'> a img:first').attr('src',thisImg);
		$jq('#'+imgEl+'> a img:first').unbind('mouseout').addClass('menuOver'); //
	}
}


/* 개인화영역 보기/닫기  2010-12-03
$jq('.memberMore').ready(function(){
	$jq('#container').append($jq('.personal .memberMore').clone(true))
	$jq('.personal .memberMore').remove()
	$jq('.memberMore').show()
	$jq('.memberMore span:first').toggle(
		function(){
			$jq('.memberMore .loginMember').hide()
			$jq(this).removeClass('close').addClass('view')
		},
		function(){
			$jq('.memberMore .loginMember').show()
			$jq(this).removeClass('view').addClass('close')
		}
	)
	//닫기버튼 클릭 2010-12-23수정
	$jq('.memberMore .close2').click(function(){
		$jq('.memberMore span:first').trigger('click');
	})
});
*/

