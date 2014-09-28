<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <script language='javascript'>

	function CntRC_Display_Tab(vID) {
		if (vID=='c'){
			document.getElementById('cnt_rc_title').innerHTML='<a href="cook"><img src="images/main/title_conts_02.gif" border="0"></a>';
			document.getElementById('cnt_rc_div1').style.display='none';
			document.getElementById('cnt_rc_div2').style.display='';
			document.getElementById('cnt_rc_text').innerHTML='<a href="javascript:CntRC_Display_Tab(\'r\')"><font color="#adb7be">맛집정보</font></a><span class="sct">|</span><b>요리정보</b>';
		} else {
			document.getElementById('cnt_rc_title').innerHTML='<a href="/restaurant/"><img src="images/main/title_conts_01.gif" border="0"></a>';
			document.getElementById('cnt_rc_div1').style.display='';
			document.getElementById('cnt_rc_div2').style.display='none';
			document.getElementById('cnt_rc_text').innerHTML='<b>맛집정보</b><span class="sct">|</span><a href="javascript:CntRC_Display_Tab(\'c\')"><font color="#adb7be">요리정보</font></a>';
		}
	}
	var cur_rc_tab = (Math.round(Math.random() * 1));
	//alert(cur_rc_tab);
	if (cur_rc_tab==0){cur_rc_tab = 'r';} 
	else {cur_rc_tab = 'c';}
	CntRC_Display_Tab(cur_rc_tab);

	

			var cur_c_id = 1;
			var tot_c_cnt = 3;
			cur_c_id = (Math.round(Math.random() * (tot_c_cnt-1))+ cur_c_id );//랜덤
			
			function cnt_c_PreNext(mty) {
				if (mty=='p'){
					cur_c_id = cur_c_id-1;
				} else {
					cur_c_id = cur_c_id+1;
				}
				
				if (cur_c_id<=0) { cur_c_id = tot_c_cnt;}
				else if (cur_c_id>tot_c_cnt){ cur_c_id = 1;}
				Cnt_C_Display(cur_c_id);
			}
			
			function Cnt_C_Display(vID) {
				var c_cntitem = {
	'1' : {img : 'images/food/sp.jpg', link : '/peach/blog.do?stnum=3' , title : '조개토마토 스파게티!', content : '즐겨볼까?'},
	'2' : {img : 'images/food/don.jpg', link : '/peach/blog.do?stnum=4' , title : '돈까스 정식!', content : '든든하게 채워봐~'},
	'3' : {img : 'images/food/lunchbox.jpg', link : '/peach/blog.do?stnum=5' , title : '도시락!!', content : '추억이 방울방울~ 즐거움이 새록새록'},
	'4' : {img : '', link : '' , title : '', content : ''},
	'5' : {img : '', link : '' , title : '', content : ''},
	'6' : {img : '', link : '' , title : '', content : ''},
	'7' : {img : '', link : '' , title : '', content : ''},
	'8' : {img : '', link : '' , title : '', content : ''},
	'9' : {img : '', link : '' , title : '', content : ''},
	'10' : {img : '', link : '' , title : '', content : ''},
	'11' : {img : '', link : '' , title : '', content : ''},
	'12' : {img : '', link : '' , title : '', content : ''}
				}
				document.getElementById('cnt_c_img').innerHTML = '<a href="'+c_cntitem[vID]['link']+'" target="_blank"><img id="cnt_c_img" src="'+c_cntitem[vID]['img']+'" width="210" height="140" border="0" class="img_01"></a>';
				document.getElementById('cnt_c_item').innerHTML = '<a href="'+c_cntitem[vID]['link']+'" target="_blank"><b>'+c_cntitem[vID]['title']+'</b><br>'+c_cntitem[vID]['content']+'</a>';
				 
				for (var i=1;i<=tot_c_cnt;i++){
					if (i==vID){
							document.getElementById('cnt_c_icon'+i).src = '/Image/main/btn_bnr_on.gif';
					} else {
							document.getElementById('cnt_c_icon'+i).src = '/Image/main/btn_bnr_off.gif';
					}
			  }
			}
			Cnt_C_Display(cur_c_id);
	
		
					var cur_r_id = 1;
					var tot_r_cnt = 3;
					cur_r_id = (Math.round(Math.random() * (tot_r_cnt-1))+ cur_r_id );//랜덤
			 
					function Cnt_R_PreNext(mty) {
						if (mty=='p'){
							cur_r_id = cur_r_id-1;
						} else {
							cur_r_id = cur_r_id+1;
						}
						
						if (cur_r_id<=0) { cur_r_id = tot_r_cnt;}
						else if (cur_r_id>tot_r_cnt){ cur_r_id = 1;}
						Cnt_R_Display(cur_r_id);
					}
					
					function Cnt_R_Display(vID) {
						var r_cntitem = {
			'1' : {img : 'images/store/storesample.jpg', link : '/peach/blog.do?stnum=2' , title : '냠냠쩝쩝', content : '먹쟈먹쟈'},
			'2' : {img : 'images/store/night.jpg', link : '/peach/blog.do?stnum=1' , title : '야식대박..!', content : '매콤매콤 야식먹쟈'},
			'3' : {img : 'images/store/s_sp.jpg', link : '/peach/blog.do?stnum=3' , title : '스파게티~~ !', content : '꼬불꼬불 맛나지'},
			'4' : {img : '', link : '' , title : '', content : ''},
			'5' : {img : '', link : '' , title : '', content : ''},
			'6' : {img : '', link : '' , title : '', content : ''},
			'7' : {img : '', link : '' , title : '', content : ''},
			'8' : {img : '', link : '' , title : '', content : ''},
			'9' : {img : '', link : '' , title : '', content : ''},
			'10' : {img : '', link : '' , title : '', content : ''},
			'11' : {img : '', link : '' , title : '', content : ''},
			'12' : {img : '', link : '' , title : '', content : ''}
						}
						document.getElementById('cnt_r_img').innerHTML = '<a href="'+r_cntitem[vID]['link']+'" target="_blank"><img id="cnt_r_img" src="'+r_cntitem[vID]['img']+'" width="210" height="140" border="0" class="img_01"></a>';
						document.getElementById('cnt_r_item').innerHTML = '<a href="'+r_cntitem[vID]['link']+'" target="_blank"><b>'+r_cntitem[vID]['title']+'</b><br>'+r_cntitem[vID]['content']+'</a>';
						 
						for (var i=1;i<=tot_r_cnt;i++){
							if (i==vID){
									document.getElementById('cnt_r_icon'+i).src = 'images/main/btn_bnr_on.gif';
							} else {
									document.getElementById('cnt_r_icon'+i).src = 'images/main/btn_bnr_off.gif';
							}
					  }
					}
					Cnt_R_Display(cur_r_id);
				
	</script>
</head>
<body>


<table width="600"  border="0" cellspacing="0" cellpadding="0">
	<tr>
		  <td valign="top" style="padding:0 0 5 0">
				<!-- 맛집정보/요리정보-->
      			<div id="conts">
					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
		    				<td height="1" colspan="3" background="/Image/main/tb_02.gif"></td>
		  				</tr>
		  				<tr>
		    				<td width="1" background="/Image/main/tb_02.gif"></td>
		    				<td style="padding:15 20 4 20">
			  					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		      						<tr>
		           						<td><div id="cnt_rc_title"></div></td>
		           						<td align="right" class="Logout_02"><span id="cnt_rc_text"><b>맛집정보</b><span class="sct">|</span><a href="javascript:CntRC_Display_Tab('c')"><font color="#adb7be">요리정보</font></a></span></td>
		        					</tr>
		     					</table>
		      					
		      					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		        					<tr>
		         						 <td height="21" bordercolor="#FFD187"></td>
		       						</tr>
		      					</table>
		     				 
		     				 <!--맛집레이어-->
		      					<div id="cnt_rc_div1">
									<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	            						<tr>
								            <td width="223" valign="top">
												<div class="conts_btn">
													  <table border="0" cellspacing="1" cellpadding="0">
															<tr>
															 	 <td><img id="cnt_r_icon1" src="images/main/btn_bnr_on.gif" border="0" style="cursor:hand" onmouseover="Cnt_R_Display('1');"></td>
															</tr>
															<tr>
																  <td><img id="cnt_r_icon2" src="images/main/btn_bnr_off.gif" border="0" style="cursor:hand" onmouseover="Cnt_R_Display('2');"></td>
															</tr>
															<tr>
																  <td><img id="cnt_r_icon3" src="images/main/btn_bnr_off.gif" border="0" style="cursor:hand" onmouseover="Cnt_R_Display('3');"></td>
															</tr>
													  </table>
												</div>
													  <table  border="0" cellspacing="0" cellpadding="0">
													    	<tr>
													      		 <td><div id="cnt_r_img"></div></td>
													    	</tr>
													    	<tr>
													       		<td style="padding:7 0 0 0">
															         <table width="100%"  border="0" cellspacing="0" cellpadding="0">
																          <tr>
																	            <td align="center" class="txt12_03">
																		            <span id="cnt_r_item"></span>
																		          </td>
																	            <td width="25" align="right" style="padding:12 0 0 0">
																	            	<img src="images/main/btn_bpre.gif" alt="이전" border="0" style="cursor:hand" onclick="Cnt_R_PreNext('p');"><img src="images/main/btn_bnext.gif" alt="다음" border="0" style="cursor:hand" onclick="Cnt_R_PreNext('n');">
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
		      
		      
		      <!--레이어-->
		      <div id="cnt_rc_div2" style="display:none">
		      		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	            		<tr>
	              			<td width="223" valign="top">
								<div class="conts_btn">
									  <table border="0" cellspacing="1" cellpadding="0">
											<tr>
											  <td><img id="cnt_c_icon1" src="images/main/btn_bnr_on.gif" border="0" style="cursor:hand" onmouseover="Cnt_C_Display('1');"></td>
											</tr>
											<tr>
											  <td><img id="cnt_c_icon2" src="images/main/btn_bnr_off.gif" border="0" style="cursor:hand" onmouseover="Cnt_C_Display('2');"></td>
											</tr>
											<tr>
											  <td><img id="cnt_c_icon3" src="images/main/btn_bnr_off.gif" border="0" style="cursor:hand" onmouseover="Cnt_C_Display('3');"></td>
											</tr>
									  </table>
								</div>
								
								<table  border="0" cellspacing="0" cellpadding="0">
								    <tr><span id="cnt_c_img"></span></td>
									</tr>
								    <tr>
								       <td style="padding:7 0 0 0">
								         <table width="100%"  border="0" cellspacing="0" cellpadding="0">
								          <tr>
								            <td align="center" class="txt12_03">
									            <span id="cnt_c_item"></span>
									         </td>
								            <td width="25" align="right" style="padding:11 0 0 0">
								            	<img src="images/main/btn_bpre.gif" alt="이전" border="0" style="cursor:hand" onclick="cnt_c_PreNext('p');"><img src="images/main/btn_bnext.gif" alt="다음" border="0" style="cursor:hand" onclick="cnt_c_PreNext('n');">
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
		     
		     
		     
		     <td width="1" bgcolor="#FFFAF0"></td>
		   </tr>
	    <tr>
	      <td height="1" colspan="3" bgcolor="#FFE641"></td>
	    </tr>
		</table>
	</div>


<!--  스크립트  -->
		  </td>
		</tr>
	</table>
	

</body>
</html>