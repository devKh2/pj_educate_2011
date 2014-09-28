<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>군침.. 츄르륵</title>
<link rel="stylesheet" href="style/basic.css" type="text/css">
<link rel="stylesheet" href="style/layout.css" type="text/css">
<script>
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
	
	function loginFail(){
		alert("login 실패 ID와 Password를 확인해 주세요.");
	}
	
	function loginSeccess(){
		window.close();
	}
	
	function goUrl(values){
		window.open('blog.do?stnum='+values,'newwindow', 
		'top=0, left=0, width=550, height=250, toolbar=0, directories=0, status=1, menubar=1, scrollbars=1, resizable=1');
	}
	function toggle(text){
		if(text.value!=""){
			text.value="";
		}
	}
</script>
<style type="text/css">
body,select {font-family: "돋움", "sans-serif"; font-size: 12px; color: #2f3743; letter-spacing: -1px}
	#movieLogin{overflow:hidden; width:190px; height:141px; background:url(images/main/bg_login_frame.gif) no-repeat left top; padding:8px 5px 5px 5px;}
	#movieLogin p{border-bottom:1px solid #d3d3d3; padding:0 0 0 0;}
</style>

<style type="text/css">
a { text-decoration:none; cursor:auto;}
</style>
</head>
<body <c:if test = "${loginFail eq 'fail' }">onload="loginFail();"</c:if>
	  <c:if test = "${success eq 'success' }">onload="loginSeccess();"</c:if>	>
<div id="movieLogin">
	<table align="center" width="190" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  	<td valign="top" style="padding:0 0 0 0">
					<!--로그아웃 상태 시작-->
					<c:if test="${sessionScope.member == null}" >			<!--  세션의 member가 null이면 -->
						
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
						  	<td>
						  		<p><img src="images/main/login_logo.jpg" alt="군침로그인"/><b>로그인</b></p>
						  	</td>
						  </tr>
						  <tr>
							<td height="100" align="center" valign="top" style="padding:0 16 0 16">
								<form id="loginForm" action=<c:url value="login_from_result.do"/> method="post">
									<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
							  			<tr>
								  			<table width="100%"  border="0" cellspacing="2" cellpadding="0" >	
								  			<tr>
												<td><input type="text" name="id" class="input" tabindex="1"></td>
												<td><select name = "member_type" >
							                 <option value ="customer">일반회원</option>
							                 <option value ="storeMember">가게회원</option>
							                 <option value ="administrator">관리자</option> </select></td>
											  
											
										     </tr>
										     <tr>
										     	<td><input type="password" name="pw"  tabindex="2" class="input_psw"></td>
										     	<td><img src="images/main/login.jpg" alt="로그인" border="0" align="absmiddle" style="border: 0; cursor:pointer;" onClick="loginForm.submit();"></td>
										     </tr>
										     
										     <tr>
									     			<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
														<tr align="center">
														<td class="Logout_01"><span class="Logout_02"><a href="join.do" target="_parent"><b>회원가입</b></a></span><span class="sct">|</span><a href="javascript:idpwSearch();">아이디찾기</a><span class="sct">|</span><a href="javascript:pwSearch();">비밀번호찾기</a></td>
											</tr>
											<tr>
											</tr>
													</table>
												</tr>
							     			</table>
						     			</tr>
						     			
						     		
						     		</table>

								</form>
							</td>
						  </tr>
						</table>
						</c:if>
						<!--로그아웃 상태 끝-->
						
						<!-- 일반회원 로그인 상태 시작 -->
						<c:if test="${sessionScope.member.member_type eq 'customer' }" >								<!--  만약 세션의 member가 있으면 -->
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							 <tr>
							  	<td>
							  		<p><img src="images/main/login_logo.jpg" alt="군침로그인"/><b><font color="">환영합니다</font></b><img src="images/icon/icon_welcom.jpg"/></p>
							  	</td>
							  </tr>
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td height="18" class="Login_02"><b>${sessionScope.member.userName}</b>님(${sessionScope.member.id})<span class="sct_01">|</span><span class="Logout_02">${sessionScope.member.member_type}</span></td>
													</tr>
													<tr>
														<td height="16" class="Logout_02"><a href = "<c:url value = "/mypage.do"/>" target = "_parent"><img src='images/icon/icon_cart.jpg' border="0">마이카트</a><span class="sct_01">|</span><a href = "<c:url value = "/mypage.do"/>" target = "_parent"><img src='images/icon/icon_mypage.jpg' border="0">정보수정</a></td>
													</tr>
													<tr>
														<td height="16" class="Logout_02"><img src='images/icon/icon_favorite.jpg' border="0">
															<select onchange="goUrl(this.value)">
																<option selected="selected">즐겨찾는맛집</option>
																<c:forEach var="it" items="${sessionScope.member.favoritesite.storemodel}">
																	<option value="${it.st_num}">${it.st_name}</option>
																</c:forEach>
															</select></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding:7 0 0 0">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td align="right" style="padding:1 0 0 0"><a href = "<c:url value = "logout.do"/>"><img src="images/icon/icon_logout.jpg" alt="로그아웃" border="0">로그아웃</a></td>
										</tr>
									</table>
								</td>
							</tr>
							</table>	
						</c:if>
						<!-- 일반회원 로그인 상태  끝 -->
						
						<!-- 관리자(administrator) 로그인 상태 시작 -->
						<c:if test="${sessionScope.member.member_type eq 'administrator'}" > <!--  만약 세션의 member가 있으면 -->
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							 <tr>
							  	<td>
							  		<p><img src="images/main/login_logo.jpg" alt="군침로그인"/><b><font color="">환영합니다</font></b><img src="images/icon/icon_welcom.jpg"/></p>
							  	</td>
							  </tr>
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td height="18" class="Login_02"><b>${sessionScope.member.userName}</b>님(${sessionScope.member.id})<span class="sct_01">|</span><span class="Logout_02">${sessionScope.member.member_type}</span></td>
													</tr>
													<tr>
														<td height="16" class="Logout_02"><a href = "<c:url value = "/master/main.do"/>" target = "_blank"><img src='images/icon/icon_admin.jpg' border="0">[관리자페이지]</a></td>
													</tr>
													
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding:7 0 0 0">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td align="right" style="padding:1 0 0 0"><a href = "<c:url value = "logout.do"/>"><img src="images/icon/icon_logout.jpg" alt="로그아웃" border="0">로그아웃</a></td>
										</tr>
									</table>
								</td>
							</tr>
							</table>	
						
						</c:if>
						<!-- 관리자(administrator) 로그인 상태  끝 -->
						
						<!-- 가게회원(storeMember) 로그인 상태 시작 -->
						<c:if test="${sessionScope.member.member_type eq 'storeMember'}" >								<!--  만약 세션의 member가 있으면 -->
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							 <tr>
							  	<td>
							  		<p><img src="images/main/login_logo.jpg" alt="군침로그인"/><b><font color="">환영합니다</font></b><img src="images/icon/icon_welcom.jpg"/></p>
							  	</td>
							  </tr>
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td height="18" class="Login_02"><b>${sessionScope.member.userName}</b>님(${sessionScope.member.id})<span class="sct_01">|</span><span class="Logout_02">${sessionScope.member.member_type}</span></td>
													</tr>
													<tr>
														<td height="16" class="Logout_02"><a href = "<c:url value = "/blog.do?stnum=${sessionScope.member.st_num }"/>" target = "_blank"><img src='images/icon/icon_store.jpg' border="0">MyStore</a><span class="sct_01">|</span><a href = "<c:url value = "/mypage.do"/>" target = "_parent"><img src='images/icon/icon_mypage.jpg' border="0">정보수정</a></td>
													</tr>
													<tr>
														<td height="16" class="Logout_02"><img src='images/icon/icon_favorite.jpg' border="0">
															<select onchange="goUrl(this.value)">
																<option selected="selected">즐겨찾는맛집</option>
																<c:forEach var="it" items="${sessionScope.member.favoritesite.storemodel}">
																	<option value="${it.st_num}">${it.st_name}</option>
																</c:forEach>
															</select></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding:7 0 0 0">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td align="right" style="padding:1 0 0 0"><a href = "<c:url value = "logout.do"/>"><img src="images/icon/icon_logout.jpg" alt="로그아웃" border="0">로그아웃</a></td>
										</tr>
									</table>
								</td>
							</tr>
							</table>	
						
						</c:if>
						<!-- 가게회원(storeMember) 로그인 상태  끝 -->
			
					</td>
				</tr>
		</table>
</div>
				
</body>
</html>
