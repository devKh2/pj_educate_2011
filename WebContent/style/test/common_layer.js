//메세지창 열기
function show_message_box(msg, img, callback){
	
	var str_div = "\n";
	str_div += "<div class=\"cLH\">\n";
	str_div += "	<img src=\""+img+"\"/>\n";
	str_div += "	<div><a href=\"javascript:close_message_box("+callback+")\" id=\"msg_button\"><span>닫기</span></a></div>\n";
	str_div += "</div>\n";
	str_div += "<div class=\"cLC\">\n";
	str_div += "	<div class=\"pEvent\">\n";
	str_div += "		<div class=\"cLMsg\">\n";
	str_div += 			msg;
	str_div += "		</div>\n";
	str_div += "	</div>\n";
	str_div += "</div>\n";
	str_div += "<div class=\"cLF\">\n";
	str_div += "	<a href=\"javascript:close_message_box("+callback+");\"><img src=\"http://mzimg.megapass.net/images/contentszone/event/bt_confirm.gif\" alt=\"확인\" /></a>\n";
	str_div += "</div>\n";
	
	var movie_event_id = document.getElementById("movie_event_id");
	
	if(movie_event_id == "11610"){
		open_layer("common_msg", -135, -400);
	}else{
		open_layer("common_msg", -135, -100);
	}
		
	document.getElementById("common_msg").innerHTML = str_div;
	document.getElementById("msg_button").focus();
}

//메세지창 닫기

	function close_message_box(callback){
		document.getElementById("common_msg").innerHTML = "";
		close_layer("common_msg");
		if((document.getElementById('hiddenmenuid') != null && document.getElementById('hiddenmenuid').value.substring(0,2) == '19') && getCookie('prlayer_close') != 'yes'){
			if(document.getElementById('prlayeropenyn') != null && document.getElementById('prlayeropenyn').value == 'block'){
				open_layer('prlayer', -250, -150);
			}else{
				document.location.reload();
			}
		}
		try{callback();}catch(e){}
	}


//새로고침
	function my_reload(){
		if((document.getElementById('hiddenmenuid') != null && document.getElementById('hiddenmenuid').value.substring(0,2) == '19') && getCookie('prlayer_close') != 'yes'){
			if(document.getElementById('prlayeropenyn') != null && document.getElementById('prlayeropenyn').value == 'block'){
				open_layer('prlayer', -250, -150);
			}else{
				document.location.reload();
			}
		}else{
		document.location.reload();
		}
	}

function open_common_member_msg(num){
	switch (num){
	case 0:
		document.getElementById("common_member_type").innerHTML = "혜택존 VIP";
		document.getElementById("common_member_type2").innerHTML = "일반고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
		break;
	case 1:
		document.getElementById("common_member_type").innerHTML = "혜택존 전화 상품 가입고객 전용";
		document.getElementById("common_member_type2").innerHTML = "";
		document.getElementById("common_member_type3").innerHTML = "";
		document.getElementById("common_member_type4").innerHTML = "으로 <br /> 고객님은 해당 서비스 이용이 제한됩니다.";
		document.getElementById("common_member_box").style.display = "none";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "block";
		document.getElementById("common_member_btn1").style.display = "none";
		document.getElementById("common_member_btn2").style.display = "block";
		open_layer("common_member_msg", -133, -150);
		break;
	case 2:
//		document.getElementById("common_member_type").innerHTML = "혜택존 인터넷 상품 가입고객 전용";
//		document.getElementById("common_member_type2").innerHTML = "";
//		document.getElementById("common_member_type3").innerHTML = "";
//		document.getElementById("common_member_type4").innerHTML = "으로 <br /> 고객님은 해당 서비스 이용이 제한됩니다.";
//		document.getElementById("common_member_box").style.display = "none";
//		document.getElementById("common_member_etc_msg1").style.display = "none";
//		document.getElementById("common_member_etc_msg2").style.display = "none";
//		document.getElementById("common_member_etc_msg3").style.display = "none";
//		document.getElementById("common_member_etc_msg4").style.display = "block";
//		document.getElementById("common_member_btn1").style.display = "none";
//		document.getElementById("common_member_btn2").style.display = "block";
		open_layer("webtype_warning_layer", -133, -150);
	break;
	case 3:
		document.getElementById("common_member_type").innerHTML = "혜택존 인터넷/전화 상품 가입고객 전용";
		document.getElementById("common_member_type2").innerHTML = "";
		document.getElementById("common_member_type3").innerHTML = "";
		document.getElementById("common_member_type4").innerHTML = "으로 <br /> 고객님은 해당 서비스 이용이 제한됩니다.";
		document.getElementById("common_member_box").style.display = "none";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "block";
		document.getElementById("common_member_btn1").style.display = "none";
		document.getElementById("common_member_btn2").style.display = "block";
		open_layer("common_member_msg", -133, -150);
	break;
	case 4:
		open_layer("showCheckMsg", -133, -150);
	break;
	case 5:
		document.getElementById("common_member_type").innerHTML = "혜택존 모바일 고객";
		document.getElementById("common_member_type2").innerHTML = "VIP고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
	break;
	case 6:
		document.getElementById("common_member_type").innerHTML = "혜택존 모바일 고객";
		document.getElementById("common_member_type2").innerHTML = "일반고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
	break;
	case 7:
		document.getElementById("common_member_type").innerHTML = "혜택존 모바일 고객";
		document.getElementById("common_member_type2").innerHTML = "전화&웹 고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
	break;
	case 8:
		document.getElementById("common_member_type").innerHTML = "혜택존 전화&웹 고객";
		document.getElementById("common_member_type2").innerHTML = "VIP고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
	break;
	case 9:
		document.getElementById("common_member_type").innerHTML = "혜택존 전화&웹 고객";
		document.getElementById("common_member_type2").innerHTML = "일반고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
	break;
	case 10:
		document.getElementById("common_member_type").innerHTML = "혜택존 전화&웹 고객";
		document.getElementById("common_member_type2").innerHTML = "모바일 고객";
		document.getElementById("common_member_box").style.display = "block";
		document.getElementById("common_member_etc_msg1").style.display = "none";
		document.getElementById("common_member_etc_msg2").style.display = "none";
		document.getElementById("common_member_etc_msg3").style.display = "none";
		document.getElementById("common_member_etc_msg4").style.display = "none";
		document.getElementById("common_member_btn1").style.display = "block";
		document.getElementById("common_member_btn2").style.display = "none";
		open_layer("common_member_msg", -133, -150);
	break;
	}
}