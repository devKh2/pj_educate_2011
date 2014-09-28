
		//2010.04.07 생성
		//신규 맛집찾기
		function IsObj(oObj) { return ((typeof(oObj) != 'undefined') && (oObj != null)); }
		function selSort_view(vLayer){
			var	olayer=document.getElementById(vLayer);
			//alert(olayer.style.display);

			if (IsObj(olayer)) {
				if (olayer.style.display == '') {
					olayer.style.display = 'none';
				} else {
					olayer.style.display = '';
				}
			}
		}

		function imgmore(vLayer,vState){
			var	olayer=document.getElementById(vLayer);
			if (IsObj(olayer)) {
				if (vState==1) {
					olayer.style.display = '';
				} else {
					olayer.style.display = 'none';
				}
			}
		}


		function go_PageSch(p_st, p_ac, p_tc, p_sw, p_ln, p_mx, p_my, p_srt, p_pg){

			var p_cp, p_pm, p_re;
			var p_url = '/Restaurant/Search/Search_ResultList.asp';

			p_st = (!!p_st ? p_st : '');
			p_ac = (!!p_ac ? p_ac : '');
			p_tc = (!!p_tc ? p_tc : '');
			p_ln = (!!p_ln ? p_ln : '');
			p_sw = (!!p_sw ? p_sw : '');
			p_mx = (!!p_mx ? p_mx : '');
			p_my = (!!p_my ? p_my : '');
			p_srt = (!!p_srt ? p_srt : '');
			p_pg = (!!p_pg ? p_pg : '');

			f_cp	= document.getElementById("cp");
			f_pm	= document.getElementById("pm");
			f_re	= document.getElementById("re");
			if(f_cp.checked == false){	p_cp	= ''} else {p_cp = '1'}
			if(f_pm.checked == false){	p_pm	= ''} else {p_pm = '1'}
			if(f_re.checked == false){	p_re	= ''} else {p_re = '1'}
			
			p_url += '?st='+p_st ;
			if (p_ac.length>0) {p_url += '&ac='+p_ac;}
			if (p_tc.length>0) {p_url += '&tc='+p_tc;}
			if (p_ln.length>0) {p_url += '&ln='+URLencode(p_ln);}
			if (p_sw.length>0) {p_url += '&sw='+URLencode(p_sw);}
			if (p_srt.length>0) {p_url += '&srt='+p_srt;}
			if (p_mx.length>0) {p_url += '&mx='+p_mx;}
			if (p_my.length>0) {p_url += '&my='+p_my;}
			if (p_cp.length>0) {p_url += '&cp='+p_cp;}
			if (p_pm.length>0) {p_url += '&pm='+p_pm;}
			if (p_re.length>0) {p_url += '&re='+p_re;}
			if (p_pg.length>0) {p_url += '&page='+p_pg;}
			document.location.href = p_url;
		}

		function fn_goMap(url, mx, my, ac, sc){

			mx = (!!mx ? mx : '');
			my = (!!my ? my : '');
			ac = (!!ac ? ac : '');
			sc = (!!sc ? sc : '');

			if ((mx != "")||(my != "") ||(ac!="") ||(sc!=""))
			{
				url	= url+"?";
				if (mx.length>0) {url += '&x='+mx;}
				if (my.length>0) {url += '&y='+my;}
				if (ac.length>0) {url += '&ct_cd='+ac;}
				if (sc.length>0) {url += '&sw_cd='+sc;}
			}else{
				url	= "/map/restmap/map_main.asp";
			}

			var wnd = window.open(url, 'RestMap');
			wnd.window.focus();

		}


		//xmlhttp 호출, layerhtml 설정
		function fn_XmlHttpLayerSet(lname, lurl){
				var xmlhttp = getXmlHttpRequest();
				
				if(lurl){
					xmlhttp.open("GET", lurl, true);
					xmlhttp.onreadystatechange = function() {
						if(xmlhttp.readyState == 4) {
							if(xmlhttp.status == 200) {
								var respTxt = xmlhttp.responseText;
								document.getElementById(lname).innerHTML = respTxt;
							}
							xmlhttp = null; 
						}
					}
					xmlhttp.send(null);
				}
		}

		//파라미터로 함수 만들기
		function MakeFunc(fntxt){
			tmpfn	= fntxt.split("|");
			var fnhtml
			fnhtml	= "fn_"+tmpfn[0]+"('"+tmpfn[1];
			for(i=2;i < tmpfn.length;i++){
				fnhtml = fnhtml+"','"+tmpfn[i];
			}
			fnhtml	= fnhtml+"');"
			return fnhtml;
		}

		//UrlEncode 
		function URLencode(sStr){
			return escape(sStr).replace(/\+/g, '%2C').replace(/\"/g, '%22').replace(/\'/g, '%27');
		}		
