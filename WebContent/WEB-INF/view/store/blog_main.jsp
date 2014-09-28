<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${st.st_name} 블로그 입니다.</title>
<script
	src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAK4TKV0NF4V4VyWXbcCkw5RRjnEEg1WKiJQ4c--MUyKWypgOizxR_jS6n0hM2n_ShbkYijBX5eyICQw"
	type="text/javascript"></script>
<script type="text/javascript">
    var map = null;
    var geocoder = null;
    var cnt=0;
    var gcnt=0;
    var menu_cnt=0;
    var st_cnt=0;
	var count=null;
	var chk=null;
	var menulist=null;
	var stnumList=null;
	var priceList=null;
	var nameList=null;
	var size=null;
	var deslat="";
	var sorlat="";
	
	function resize(){
		var doc = document.getElementById('content');
  	  if(doc.offsetHeight == 0){
  	  } else {
  		 pageheight = doc.offsetHeight;
  		parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
  	  }
	}

    function initialize(path) {
    size=document.formOrder.size.value;
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map"));
        var title=document.getElementById("title");
        geocoder = new GClientGeocoder();
        if (geocoder) {
            var addr=document.getElementById("addr");
            geocoder.getLatLng(addr.value,function(point) {
            	if (!point) {
                  alert(addr.value + " not found");
                } else {
                  map.setCenter(point, 19);
                  map.addControl(new GSmallMapControl()); 
                  var marker = new GMarker(point,addr);
                  map.addOverlay(marker);
                  marker.openInfoWindowHtml("<table><tr><td><img src='"+path+"' width='30' height='30' border='0'/></td><td><b><font color=blue size=2>"+title.value+"</font></b></tr></td><tr>"+"<td><font size=1>주소</font></td><td><font size=1>"+addr.value+"</font></td></tr><table>");
                }
              }
            );
          }
      }
  	resize();
    }
    function checkedsubmit(st_num,length,mode){
    	// Name이 chk인것들의 배열
    	var count=document.formOrder.orderCount;
    	var chk=document.formOrder.chk;
    	var menulist=document.formOrder.menunum;
    	var stnumList=document.formOrder.stnumList;
    	var menustr="";
    	var ststr="";
    	var countlist="";
    	if(length==0 && mode==false){
    		alert("메뉴가 없습니다.");return;
    	}
    	
    	if(size>1){
    		var cnt=0;
    		for (var i =0;i<stnumList.length;i++){
       			if(chk[i].checked){
       				cnt++;
       			}
       		}
    		if(cnt==0){alert("체크해주세요");return;}
    	}else{
    		if(chk.checked==false){
    			alert("체크해주세요");	
    		}
    	}
   		
    	if(!((mode)? confirm("장바구니에 담으시겠습니까?"):confirm("주문 하시겠습니까?"))){
    		return;
    	}
    	if(size>1){
    		for (var i =0;i<chk.length;i++)
        	{
        		if(chk[i].checked){
        			menustr+=menulist[i].value+",";
        			countlist+=count[i].value+",";
        			ststr+=stnumList[i].value+",";
        		}
        	}	
    	}else{
    		menustr+=menulist.value+",";
			countlist+=count.value+",";
			ststr+=stnumList.value+",";
    		
    	}
    	if(mode==true){
    		location.href="addCart.do?menunum="+menustr+"&stnum="+ststr+"&count="+countlist;
    	}else{
    		location.href="order.do?menunum="+menustr+"&stnum="+ststr+"&count="+countlist;	
    	}
    	
    }
	
    function moneyChange(v){
            v = v.toString();
            if (v.length > 3) {
                    var mod = v.length % 3;
                    var retval = (mod > 0 ? (v.substring(0,mod)) : "");
                    for (i=0 ; i < Math.floor(v.length / 3); i++) {
                            if ((mod == 0) && (i == 0)) {
                                    retval += v.substring(mod+ 3 * i, mod + 3 * i + 3);
                            } else {
                                    retval+= "," + v.substring(mod + 3 * i, mod + 3 * i + 3);
                            }
                    }
                    return retval;
            } else {
                    return v;
            }
    }
    
    function addvalue(cnt){
    	var ordercnt=document.formOrder.orderCount;
    	if(size>1){
    		ordercnt[cnt].value=Number(1)+Number(ordercnt[cnt].value);	
    	}else{
    		ordercnt.value=Number(1)+Number(ordercnt.value);
    	}
    	result();
    }
    
    function minusvalue(cnt){
    	var ordercnt=document.formOrder.orderCount;
    	if(size>1){
    		if(ordercnt[cnt].value>0){
    	    	ordercnt[cnt].value=Number(ordercnt[cnt].value)-Number(1);
    	    	}	
    	}else{
    		if(ordercnt.value>0){
    	    	ordercnt.value=Number(ordercnt.value)-Number(1);
    	    	}
    	}
    	result();
    }
    
    function result(){
    	count=document.formOrder.orderCount;
    	chk=document.formOrder.chk;
    	menulist=document.formOrder.menunum;
    	stnumList=document.formOrder.stnumList;
    	priceList=document.formOrder.pricelist;
    	nameList=document.formOrder.namelist;
        var tableStr="<table width=\"50%\" align=\"right\" frame=\"void\" width=\"100%\"  border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse; \>";
        var inStr='<tr bgcolor=\"${blog_des.layout_color}\" align=\"center\"><td >제품명</td><td>가격</td><td>소계</td></tr>';
        var total=0;
        if(size==1){
            	if(chk.checked==true){
            		inStr+="<tr align=\"center\" style=\"cursor:pointer;\" onMouseOver=\"this.style.backgroundColor='#FFFBD7'\" onMouseOut=\"this.style.backgroundColor=''\"><td>"+nameList.value+"\</td>\<td>￦"+moneyChange(priceList.value)+" 원</td><td>"+moneyChange(Number(priceList.value)*Number(count.value))+"원</td></tr>";
            		total+=(Number(priceList.value)*Number(count.value));
            }
        }else{
        	for(var i=0;i<chk.length;i++){
            	if(chk[i].checked==true){
            		inStr+="<tr align=\"center\" style=\"cursor:pointer;\" onMouseOver=\"this.style.backgroundColor='#FFFBD7'\" onMouseOut=\"this.style.backgroundColor=''\"><td>"+nameList[i].value+"\</td>\<td>￦"+moneyChange(priceList[i].value)+" 원</td><td>"+moneyChange(Number(priceList[i].value)*Number(count[i].value))+"원</td></tr>";
            		total+=(Number(priceList[i].value)*Number(count[i].value));
            	}
            }	
        }
        document.getElementById("orders").innerHTML = tableStr+inStr+"<tr><td colspan=\"3\">합계:￦<font color=blue>"+moneyChange(total)+"원</font></td></tr>"+"</table>";
        resize();
      }
    

	
</script>
 <style>
table {
	border: 0;
}
</style>
</head>
<body onload="initialize('${st.st_picpath}')" onunload="GUnload()" bgcolor="${blog_des.bgcolor}">
<input type="hidden" id="uaddr" name="uaddr" value="${sessionScope.member.preAddress}${sessionScope.member.tailAddress}" />
<input type="hidden" id="addr" name="addr" value="${st.st_detailaddr} " />
<input type="hidden" id="title" value="${st.st_name}" />
<div id="content" align="right">
	<form name="resultcal" action="/result.do" target="check_iframe" method="post"></form>
	<table width="100%" align="center">
		<!-- 블로그 탑 시작 -->
		<tr height="100px" valign="middle">
			<td colspan="6"align="left">
			<c:if test="${blog_des.main_top_logo != 0 }">
				<img src="${blog_des.main_top_logo_path}" width="740px" height="100px" border="0" />
			</c:if>
			<c:if test="${blog_des.left_top_logo == 0 }">
				<img src="./images/toplogosample.jpg" border="0" width="740px" height="100px"/>
			</c:if>
			</td>
		</tr>
		<!-- 블로그 탑 끝-->
		<!-- 가게 소개 페이지 시작-->
		<tr>
			<td rowspan="5" width="30%" colspan="4" align="center"><img
				src="${st.st_picpath}" width="250" height="250" border="0" /><br>
			<font color="green">${st.st_name}</font></td>
			<td width="20%" align="center" bgcolor="${blog_des.layout_color}">업체명</td>
			<td width="50%" align="center">${st.st_name}</td>
		</tr>
		<tr>
			<td width="20%" align="center" bgcolor="${blog_des.layout_color}">업종</td>
			<td width="50%" align="center">${st.st_type }</td>
		</tr>
		<tr>
			<td width="20%" align="center" bgcolor="${blog_des.layout_color}">전화번호</td>
			<td width="50%" align="center">${st.st_ownerph}</td>
		</tr>
		<tr>
			<td width="20%" align="center" bgcolor="${blog_des.layout_color}">위치정보</td>
			<td width="50%" align="left">
			<div id="map" title="위치 정보"  style="width:300px; height:300px;"/>
			</td>
		</tr>
		<tr>
			<td width="20%" align="center" bgcolor="${blog_des.layout_color}">영업시간</td>
			<td width="50%" align="center">${st.st_optime}</td>
		</tr>
		<tr>
			<!-- 메뉴판 시작 -->
		</tr>
	</table>
		<table align="center" frame="void" width="100%"  border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse; ">
				<tr>
			<td colspan="6" align="left" bgcolor="${blog_des.layout_color}"><b><font color="white">Menu List</font></b></td>
		</tr>
		<tr align="center" bgcolor="${blog_des.layout_color}">
			<td>사진</td>
			<td>음식명</td>
			<td>음식설명</td>
			<td >가격</td>
			<td >주문</td>
			<td>선택</td>
		</tr>
		<!-- 메뉴 반복문 시작 -->
		<c:set var="ch" value="0" />
		<form method="get" name="formOrder">
		<input type="hidden" id="size" name = "size" value="${size}"/>
		<c:forEach var="menu" items="${menulist}">
			<tr align="center"  style=" cursor:pointer;"  onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
				<td align="center" style="width: 10%">
				<img src="${menu.menu_picpath}" width="70px" height="60px" border="0" /></td>
				<td>${menu.menu_name}</td>
				<td>${menu.menu_comment}</td>
				<td>${menu.menu_price}원</td>
				<td align="center">
				<input type="text" value="1" size="2" name="orderCount" id="count${ch}"/>
				<input type="button" size="1" value="+" onclick="addvalue(${ch})">
				<input type="button" size="1" value="-" onclick="minusvalue(${ch})"></td>
				<td><input id="ch${ch}" type="checkbox" name="chk" value="${menu.menu_num}" onclick="result()"/>
					<input type="hidden" id="menum${ch}" name="menunum" value="${menu.menu_num}"/> 
					<input type="hidden" id="stnum${ch}" name="stnumList" value="${st.st_num}" />
					<input type="hidden" name="namelist" id="namecount${ch}" value="${menu.menu_name}"/>
					<input type="hidden" name="pricelist" id="pricecount${cn}" value="${menu.menu_price}"/>
					<c:set var="ch" value="${ch+1}" /></td>
			</tr>
		</c:forEach>
		</form>
		</table>
		<table align="center" width="100%">
		<tr><td colspan="6"><font color=blue>주문내역</font><br>
		<div id="orders" align="right" style="margin-bottom: 0;"></div></td>
		</tr>
		<tr>
			<td colspan="6" align="right">
			<input type="button" value="장바구니" onclick="checkedsubmit('${st.st_num}','${ch}',true)" />
			<input type="button" value="주문하기" onclick="checkedsubmit('${st.st_num}','${ch}',false)" />
		</tr>
		<!-- 메뉴 반복문 끝 -->
		<!-- 메뉴판 끝 -->
		<!-- 평가 게시판 뷰 시작 -->
		</table>
		<table align="center" width="100%" id="">
		<tr>
			<td colspan="6" align="left">
			<font color="blue">가게 평가하기</font>
			</td>
		</tr>
		<tr>
			<td colspan="6"><iframe name="contentFrame" id="contentFrame"  src="ebbs_list.do?stnum=${st.st_num }" align="top" marginwidth="0" marginheight="0" frameborder="0"  width="100%" scrolling="no"></iframe></td>
		</tr>
			</table>
			</td>
		</tr>
	</table>
</div>
</body>
</html>