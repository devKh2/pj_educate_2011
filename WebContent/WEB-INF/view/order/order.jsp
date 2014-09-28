<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문페이지</title>
<script
	src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAK4TKV0NF4V4VyWXbcCkw5RRjnEEg1WKiJQ4c--MUyKWypgOizxR_jS6n0hM2n_ShbkYijBX5eyICQw"
	type="text/javascript">
</script>
<script type="text/javascript">
var map = null;
var geocoder = null;
var menunumList=null;
var checkedList=null;
var stnumList=null;
var countList=null;
var priceList=null;
var nameList=null;
var mode=null;
var size=null;
var distance="";
var dis_check=false;

function init(){
	menunumList=document.order.menumList;
	checkedList=document.order.checklist;
	stnumList=document.order.stnumList;
	countList=document.order.orderCount;
	priceList=document.order.pricelist;
	nameList=document.order.namelist;
    size=document.order.size.value;
    if(size>1){
    	mode=true;
    }else{
    	mode=false;
    }
	resize();
}
function resize(){
	var doc = document.getElementById('content');
	  if(doc.offsetHeight == 0){
	  } else {
		 pageheight = doc.offsetHeight;
		 parent.document.getElementById("contentFrame").height = Number(pageheight+50)+"px";
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
function addrchk(){
	dis_check=false;
}
function fsubmit(){
	var stnumstr="";
	var countstr="";
	var menustr="";
	   size=document.order.size.value;
	   
	 if(!dis_check){
		   alert("거리를 확인 해주세요");
		   return;
	 }
	  
	if(!confirm("주문 하시겠습니까?")){
		return;
	}
	
	if(mode){
		var cnt=0;
		for (var i =0;i<size;i++){
			if(checkedList[i].checked){
				cnt++;
			}
		}
		if(cnt==0){alert("체크해주세요");return;}
	}else{
		if(checkedList.checked){}
		else{alert("체크해주세요");return;}
	}
	
	if(size>1){
	}else{
		
	}
	
	
	if(mode){
		for (var i =0;i<size;i++){
			if(checkedList[i].checked==true){
				menustr+=menunumList[i].value+",";
				countstr+=countList[i].value+",";
				stnumstr+=stnumList[i].value+",";
			}
		}
	}else{
		if(checkedList.checked==true){
			menustr+=menunumList.value+",";
			countstr+=countList.value+",";
			stnumstr+=stnumList.value+",";
		}
	}
	var f=document.order;
	f.method="post";
	f.action="r_order.do?menu_num="+menustr+"&st_num="+stnumstr+"&quantity="+countstr;
	f.submit();
}


function result(){
	var resultNameStr="";
	var resultPriceStr="";
	   size=document.order.size.value;
     var tableStr="<table width=\"50%\">";
     var inStr='<tr bgcolor=\"${blog_des.layout_color}\"><td>제품명</td><td>가격</td><td colspan=2>소계</td></tr>';
     var total=0;
     for(var i=0;i<size;i++)
  		if(mode){
	     		if(checkedList[i].checked==true){
		     		inStr+="<tr><td>"+nameList[i].value+"\</td>\<td>￦"+moneyChange(priceList[i].value)+" 원</td><td colspan=2>"+moneyChange(Number(priceList[i].value)*Number(countList[i].value))+"원</td></tr>";
		     		total+=(Number(priceList[i].value)*Number(countList[i].value));
	     			}
    	}else{
     			if(checkedList.checked==true){
         			inStr+="<tr><td>"+nameList.value+"\</td>\<td>￦"+moneyChange(priceList.value)+" 원</td><td colspan=2>"+moneyChange(Number(priceList.value)*Number(countList.value))+"원</td></tr>";
             		total+=(Number(priceList.value)*Number(countList.value));
         		}	
		}
     document.getElementById("orders").innerHTML = tableStr+inStr+"<tr><td colspan=\"3\" align=\"right\">합계:￦<font color=blue>"+moneyChange(total)+"원</font></td></tr>"+"</table>";
     resize();
}

function addvalue(cnt){
	size=document.order.size.value;
	var countList=document.order.orderCount;
	if(size>1)
		countList[cnt].value=Number(1)+Number(countList[cnt].value);
	else
		countList.value=Number(1)+Number(countList.value);
	result();
}

function minusvalue(cnt){
	   size=document.order.size.value;
	var countList=document.order.orderCount;
		if(size>1){
			if(countList[cnt].value>1){
				countList[cnt].value=Number(countList[cnt].value)-Number(1);
			}
		}
		else{
			if(countList.value>1){
				countList.value=Number(countList.value)-Number(1);
			}			
		}
		result();
}
// 우편번호 버튼 이벤트
function post(){
	dis_check=false;
	var winopts = "width=200px,height=450px,toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes";
	window.open('order/post.do?', 'viewer', 'winopts');
}

function clear1(userName,phone,preAddress,tailAddress){
	document.order.username.value=userName;
	document.order.userphoe.value=phone;
	document.order.preAddress.value=preAddress;
	document.order.tailAddress.value=tailAddress;
}
var cntt=false;
function textCounter(field, countfield, maxlimit) { 
	if(!cntt){field.value="";cntt=true;}
	if (field.value.length > maxlimit) // if too long...trim it!
	{alert("80자를 넘을 수없습니다.");
	return;}
	else{
			countfield.value = Number(maxlimit - field.value.length)+"/80";}
	} 
function test(){
	var addr=document.order.addr;
	alert(addr[1].value);
	var org_action;
	var org_target;
	var f=document.getElementById("order");
	org_action=f.action;
	org_target=f.target;
	f.method="get";
	f.target="contentFrame";
	size=document.order.size.value;
	if(size>1){
			f.action="distanceCal.do?size="+size;
			f.submit();
	}else{
		f.action="distanceCal.do?size="+size;
		f.submit();
	}
	f.action=org_action;
	f.target=org_target;
}
</script>
</head>
<body onload="init()">
<f:form name="order" id="order" action="order.do" method="post" commandName="order">
<div id="content">
<input type="hidden" id="uaddr" name="uaddr" class="address_input" value="${sessionScope.member.preAddress}${sessionScope.member.tailAddress}" />
<table align="center" width="100%" >
	<tr>
		<td colspan="5" height="100px" valign="middle"><b>주문페이지</b></td>
	</tr>
	<tr align="center" bgcolor="${blog_des.layout_color}">
		<td>음식명</td>
		<td>사진</td>
		<td>음식설명</td>
		<td>가격</td>
		<td>수량</td>
		<td>선택</td>
		<td>거리(반경/KM)</td>
	</tr>
	<c:set var="pricetotal" value="0" />
	<c:set var="cnt" value="0" />
	<input type="hidden" id="size" name = "size" value="${size}"/>
	<c:forEach var="menu" items="${menulist}">
		<tr align="center" style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
			<td>${menu.menu_name}</td>
			<td><a href="${menu.menu_picpath}"><img
				src="${menu.menu_picpath}" width="70px" height="60px" border="0" /></a></td>
			<td>${menu.menu_comment}</td>
			<td>${menu.menu_price}</td>
			<td><input type="text" value="${countlist[cnt]}" size="2" name="orderCount"/>
			<input type="button" size="1" value="+" onclick="addvalue(${cnt})"/>
			<input type="button" size="1" value="-" onclick="minusvalue(${cnt})"/></td>
			<td><input type="checkbox" id="chk${cnt}" name="checklist" onclick="result()"/></td>
			<td><input type="text" readonly="readonly" name="usrdistance"  size="7" style="border: 0"/>
				<input type="text" readonly="readonly" name="stdistance" value="${st[cnt].restrictDistance}km" size="4" style="border: 0"/></td>
			<input type="hidden" name="menumList" id="menu_num${cn}" value="${menu.menu_num}"/>
			<input type="hidden" name="stnumList" id="st_num${cn}" value="${menu.st_num}"/>
			<input type="hidden" name="pricelist" id="pricecount${cn}" value="${menu.menu_price}"/>
			<input type="hidden" name="namelist" id="namecount${cn}" value="${menu.menu_name}"/>
			<input type="hidden" name="addr" value="${st[cnt].st_detailaddr}"/>
			<c:set var="cnt" value="${cnt+1}" />
		</tr>
		
	</c:forEach>
		<tr>
			<td colspan="7"><f:errors path="ordersatus"/></td>
		</tr>
	<input type="hidden" name="userName" value="${sessionScope.member.userName}"/>
	<input type="hidden" name=phone value="${sessionScope.member.phone}"/>
	<input type="hidden" name="address" value="${sessionScope.member.preAddress}${sessionScope.member.tailAddress}"/>
	<tr align="right">
		<td colspan="7"><div id="orders" align="right" style="margin-bottom: 0;"></div></td>
	</tr>
	</table>
	<table align="center" width="100%" >
	<tr>
		<td colspan="2"><iframe name="contentFrame" id="contentFrame"  src="distanceCal.do?size=${size}" align="top" marginwidth="0" marginheight="0" frameborder="0"  width="85" height="27" scrolling="no"></iframe></td>
	</tr>	
	<tr>
		<td bgcolor="${blog_des.layout_color}">배송지<br>입력</td>
		<td><c:if test="${member != null }"> 기본 정보 입력:<input type="radio" name="info" value="true" onclick="clear1('${sessionScope.member.userName}','${sessionScope.member.phone}','${sessionScope.member.preAddress}','${sessionScope.member.tailAddress}')"> 배송지 변경 <input type="radio" name="info" onclick="clear1('','','','')"></c:if></td>
	</tr>
	<tr>
		<td bgcolor="${blog_des.layout_color}">이름</td>
		<td><input type="text" name="username" id="username" value="${sessionScope.member.userName}"/><f:errors path="username"/></td>
	</tr>
	<tr>
		<td bgcolor="${blog_des.layout_color}">연락처</td>
		<td><input type="text" name="userphoe" id="userphoe" value="${sessionScope.member.phone}"/><f:errors path="userphoe"/></td>
	</tr>
	<tr>
		<td bgcolor="${blog_des.layout_color}">주소</td>
		<td><input type="text" name="preAddress"  id="preAddress" value="${sessionScope.member.preAddress}" size="50"/><input type="button" value="주소 찾기" onClick="post();"/><f:errors path="tailAddress"/><br>
		<input type="text" name="tailAddress" id="tailAddress" value="${sessionScope.member.tailAddress}"/><f:errors path="preAddress"/></td>
	</tr>
	<tr>
		<td bgcolor="${blog_des.layout_color}">요청사항</td>
		<td >
		<textarea id="order_comments" name="order_comments" 
		cols="80" onclick="clear(this)"
		onKeyUp="textCounter(this,order.remLen,80);">주문 시 요청 사항을 기입하세요.</textarea><br>
		80 글자 를 초과 할수 없습니다.<input readonly type=text name=remLen  size=5 maxlength=5 value="80/80" style=" border: 0;">
		</td>
	</tr>
	<tr align="right" >
	</tr>
	<tr>
		<td colspan="5" align="right">
			<input type="button" value="쇼핑계속하기" onclick="history.go(-1)"/>
			<input type="button" value="주문하기" onclick="fsubmit()">
		</td>
	</tr>
	<tr>
		<td colspan="2">
		</td>
	</tr>
</table>
</div>
</f:form>
</body>
</html>