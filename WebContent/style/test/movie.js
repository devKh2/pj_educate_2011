
var movie = {
    domain : 'http://mzimg.megapass.net/images/contentszone/movie/'
};

movie.search = {

    tabChange : function(type){
        var url = movie.domain;
        var tab1 = {off:'bt2_5t_29_1.gif',on:'bt2_5t_29_1on.gif'};
        var tab2 = {off:'bt2_5t_29_2.gif',on:'bt2_5t_29_2on.gif'};
        var tab3 = {off:'bt2_5t_29_4.gif',on:'bt2_5t_29_4on.gif'};
        var tab4 = {off:'bt2_5t_29_3.gif',on:'bt2_5t_29_3on.gif'};
        
        if(type.id == 'tab1'){
            $('tab1').src = url + tab1.on;
            $('tab2').src = url + tab2.off;
            $('tab3').src = url + tab3.off;
            if($F('payYn') == 'Y'){
            $('tab4').src = url + tab4.off;
            $('downInfo').style.display = 'inline';
            document.getElementById("downList").innerHTML = '';
            }
            $('type').value='all';
            $('isAjax').value='true';
			document.getElementById("vodList").innerHTML = '';
			document.getElementById("movieList").innerHTML = '';
			$('vodScreening').style.display = 'inline';
			$('movieInfo').style.display = 'inline';
            megazone.ajax.submit('/movie/common/movieSearch.zone?mvkeyword='+$F('keyword2') + '&payYn=' + $F('payYn'),'mainBlock','frmPaging');
        }else if(type.id == 'tab2'){
            $('tab2').src = url + tab2.on;
            $('tab1').src = url + tab1.off;
            $('tab3').src = url + tab3.off;
            if($F('payYn') == 'Y'){
            $('tab4').src = url + tab4.off;
            $('downInfo').style.display = 'none';
            }
            $('pagenum').value=1;
            $('isAjax').value='true';
			document.getElementById("vodList").innerHTML = '';
            $('type').value='vod';
			$('vodScreening').style.display = 'inline';
			$('movieInfo').style.display = 'none';
            megazone.ajax.submit('/movie/common/movieSearch.zone?mvkeyword='+$F('keyword2') + '&payYn=' + $F('payYn'),'mainBlock','frmPaging');
        }else if(type.id == 'tab3'){
            $('tab3').src = url + tab3.on;
            $('tab1').src = url + tab1.off;
            $('tab2').src = url + tab2.off;
            if($F('payYn') == 'Y'){
            $('tab4').src = url + tab4.off;
            $('downInfo').style.display = 'none';
            }
            $('isAjax').value='true';
            $('pagenum').value=1;
			document.getElementById("movieList").innerHTML = '';
            $('type').value='movie';
			$('vodScreening').style.display = 'none';
			$('movieInfo').style.display = 'inline';
            megazone.ajax.submit('/movie/common/movieSearch.zone?mvkeyword='+$F('keyword2') + '&payYn=' + $F('payYn'),'mainBlock','frmPaging');
        }else if(type.id == 'tab4'){
        	//	tab4 down
        	if($F('payYn') == 'Y'){
            $('tab4').src = url + tab4.on;
            $('downInfo').style.display = 'inline';
            document.getElementById("downList").innerHTML = '';
        	}
            $('tab1').src = url + tab1.off;
            $('tab2').src = url + tab2.off;
            $('tab3').src = url + tab3.off;
            $('isAjax').value='true';
            $('pagenum').value=1;
            $('type').value='down';
			$('vodScreening').style.display = 'none';
			$('movieInfo').style.display = 'none';
            megazone.ajax.submit('/movie/common/movieSearch.zone?mvkeyword='+$F('keyword2') + '&payYn=' + $F('payYn'),'mainBlock','frmPaging');
        }
        
	},
    vodMore : function(){
			movie.search.tabChange($('tab2'));          
    },
    movieMore : function(){
            movie.search.tabChange($('tab3'));
    },
    downMore : function(){
        movie.search.tabChange($('tab4'));
    },
    focus : function(){
    	$('mvkeyword').style.backgroundColor='#efefef';
    	
        if($('mvkeyword').value == '검색어를 입력하세요.'){
        	
            $('mvkeyword').value = '';
        }
    },
    blur : function(){
        $('mvkeyword').style.backgroundColor='#ffffff'
        if($('mvkeyword').value == ''){
            $('mvkeyword').value = '검색어를 입력하세요.';
        }
    },
	find : function(){
		var keyword = $('mvkeyword').value;
		if (keyword == '검색어를 입력하세요.' || keyword.length < 2) {
            var img = 'http://mzimg.megapass.net/images/contentszone/movie/ti_p_2.gif';
            show_message_box('검색어는 최소 2자리입니다.', img);
            return;
        }else{
        	document.forms['searchForm'].action = '/movie/common/movieSearch.zone';
		    document.forms['searchForm'].submit();       
        }
	}
}

movie.detail = {
    tabChange : function(type){
        var url = movie.domain;
        var tab1 = {on:'bt_view_1_on.gif', off:'bt_view_1.gif'};
        var tab2 = {on:'bt_view_2_on.gif', off:'bt_view_2.gif'};
        var tab3 = {on:'bt_view_3_on.gif', off:'bt_view_3.gif'};
        var tab4 = {on:'bt_view_4_on.gif', off:'bt_view_4.gif'};
        var tab5 = {on:'bt_view_5_on.gif', off:'bt_view_5.gif'};
        
        if (type.id == 'tab1') {
            $('tab1').src = url + tab1.on;
            $('tab2').src = url + tab2.off;
            $('tab3').src = url + tab3.off;
            $('tab4').src = url + tab4.off;
            $('tab5').src = url + tab5.off;
            $('tabArea1').style.display = 'block';
            $('tabArea2').style.display = 'none';
            $('tabArea3').style.display = 'none';
            $('tabArea4').style.display = 'none';
            $('tabArea5').style.display = 'none';
            getListForMarkListShot();
        }
        else if (type.id == 'tab2') {
                $('tab1').src = url + tab1.off;
                $('tab2').src = url + tab2.on;
                $('tab3').src = url + tab3.off;
                $('tab4').src = url + tab4.off;
                $('tab5').src = url + tab5.off;
                $('tabArea1').style.display = 'none';
                $('tabArea2').style.display = 'block';
                $('tabArea3').style.display = 'none';
                $('tabArea4').style.display = 'none';
                $('tabArea5').style.display = 'none';
        }
        else if(type.id == 'tab3') {
                $('tab1').src = url + tab1.off;
                $('tab2').src = url + tab2.off;
                $('tab3').src = url + tab3.on;
                $('tab4').src = url + tab4.off;
                $('tab5').src = url + tab5.off;
                $('tabArea1').style.display = 'none';
                $('tabArea2').style.display = 'none';
                $('tabArea3').style.display = 'block';
                $('tabArea4').style.display = 'none';
                $('tabArea5').style.display = 'none';
        }
        else if(type.id == 'tab4') {
                $('tab1').src = url + tab1.off;
                $('tab2').src = url + tab2.off;
                $('tab3').src = url + tab3.off;
                $('tab4').src = url + tab4.on;
                $('tab5').src = url + tab5.off;
                $('tabArea1').style.display = 'none';
                $('tabArea2').style.display = 'none';
                $('tabArea3').style.display = 'none';
                $('tabArea4').style.display = 'block';
                $('tabArea5').style.display = 'none';
                getListForMarkList();
        }
        else if(type.id == 'tab5') {
                $('tab1').src = url + tab1.off;
                $('tab2').src = url + tab2.off;
                $('tab3').src = url + tab3.off;
                $('tab4').src = url + tab4.off;
                $('tab5').src = url + tab5.on;
                $('tabArea1').style.display = 'none';
                $('tabArea2').style.display = 'none';
                $('tabArea3').style.display = 'none';
                $('tabArea4').style.display = 'none';
                $('tabArea5').style.display = 'block';
        }
    }
}

movie.cinemaEvent = {
    tabChange: function(type){
        var url = movie.domain;
        var tab1 = {on:'bt_ev_1_on.gif', off:'bt_ev_1.gif'};
        var tab2 = {on:'bt_ev_2_on.gif', off:'bt_ev_2.gif'};

        if(type.id == 'tab1'){
            $('tab1').src = url + tab1.on;
            $('tab2').src = url + tab2.off;
            $('isAjax').value = 'true';
            $('type').value = 'cinema';
            megazone.ajax.submit('/movie/event/cinemaEventlist.zone','mainBlock', 'frmPaging');

        }else if(type.id == 'tab2'){
            $('tab1').src = url + tab1.off;
            $('tab2').src = url + tab2.on;
            $('isAjax').value = 'true';
            $('type').value = 'theme';
            megazone.ajax.submit('/movie/event/cinemaEventlist.zone','mainBlock', 'frmPaging');

        }
    }
}

/*
 * 영화 > vod 상영관
 */
movie.vod = {
    namespace : function(controllerName){
        if(controllerName.indexOf('newVodList')>-1){
            return 'new'
        }
        else{
            return 'vod';
        }
    },
    orderBy : function(controllerName,type){
    	$('orderby').value = type;
        $('isAjax').value='true';
        megazone.ajax.submit('/movie/'+this.namespace(controllerName)+'/'+controllerName+'.zone','mainBlock','frmPaging');
        $('isAjax').value='false';
    },
    
	imageList : function(controllerName){
		$('pageType').value="image";
        $('isAjax').value="true";
		megazone.ajax.submit('/movie/'+this.namespace(controllerName)+'/'+controllerName+'.zone','mainBlock','frmPaging');
	},
	textList : function(controllerName){
		$('pageType').value="text";
		$('isAjax').value="true";
		megazone.ajax.submit('/movie/'+this.namespace(controllerName)+'/'+controllerName+'.zone','mainBlock','frmPaging');
	}
}

/*
 * 영화 > tv 다시보기
 */
movie.tvreplay = {
    orderBy : function(controllerName,type){
    	$('orderby').value = type;
        $('isAjax').value='true';
        megazone.ajax.submit('/movie/tvreplay/'+controllerName+'.zone','mainBlock','frmPaging');
        $('isAjax').value='false';
    }
}

/*
 * 영화 > 결제내역
 */
movie.mypayment = {
    orderBy : function(controllerName,type,menuid){
    	$('orderby').value = type;
    	$('menuid').value = menuid;
        $('isAjax').value='true';
        megazone.ajax.submit('/movie/mypayment/'+controllerName+'.zone','mainBlock','frmPaging');
        $('isAjax').value='false';
    }
}


/*
 * 최초 상영관
 */
movie.firstShowing = {
    tabChange : function(obj){
        
        if(obj.id == 'movieTab1'){
            $('movieTab1').className = 'cTon';
            $('movieTab2').className = '';
            $('contents1').style.display = 'inline';
            $('contents2').style.display = 'none';
            listForMark(2);
        }else{
            $('movieTab1').className = '';
            $('movieTab2').className = 'cTon';
            $('contents1').style.display = 'none';
            $('contents2').style.display = 'inline';
            listForMark(1);
        }

    }
}

/*
 * 현재상영작
 */
movie.showingList = {
    
    orderBy : function(type){       
    	$('orderby').value = type;
        $('isAjax').value='true';
        megazone.ajax.submit('/movie/info/ShowingList.zone','mainBlock','frmPaging');
        $('isAjax').value='false';
    },
    
	imageList : function(controllerName){
		$('pageType').value="image";
        $('isAjax').value="true";
		megazone.ajax.submit('/movie/info/ShowingList.zone','mainBlock','frmPaging');
	},
	textList : function(controllerName){
		$('pageType').value="text";
		$('isAjax').value="true";
		megazone.ajax.submit('/movie/info/ShowingList.zone','mainBlock','frmPaging');
	}
}
/*
 * 상영작예정작
 */
movie.commingList = {
    
    changeMonth : function(comming){       
    	$('comming').value = comming;
    	$('pagenum').value = 1;
        $('isAjax').value='true';
        megazone.ajax.submit('/movie/info/CommingList.zone','mainBlock','frmPaging');
    },
    
	imageList : function(){
		$('pageType').value="image";
        $('isAjax').value="true";
		megazone.ajax.submit('/movie/info/CommingList.zone','mainBlock','frmPaging');
	},
	textList : function(){
		$('pageType').value="text";
		$('isAjax').value="true";
		megazone.ajax.submit('/movie/info/CommingList.zone','mainBlock','frmPaging');
	}
}
