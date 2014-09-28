<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니</title>
</head>
<script type="text/javascript">
var menunumList=null;
var checkedList=null;
var stnumList=null;
var countList=null;
var priceList=null;
var nameList=null;
var menunumStr="";
var stnumStr="";
var countStr="";
var size=null;
var mode=null;
function init(listSize){
	menunumList=document.cartListForm.menumList;
	checkedList=document.cartListForm.checklist;
	stnumList=document.cartListForm.stnumList;
	countList=document.cartListForm.menuCountList;
	priceList=document.cartListForm.pricelist;
	nameList=document.cartListForm.namelist;
	size=Number(listSize);
	if(size!=1){
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
function orderSubmit(){
	generateAddr();
	location.replace("order.do?menunum="+menunumStr+"&stnum="+stnumStr+"&count="+countStr);
}

function deleteSubmit(){
	generateAddr();
	location.replace("deleteCart.do?menunum="+menunumStr+"&stnum="+stnumStr);
}
function result(){
	var resultNameStr="";
	var resultPriceStr="";
	 var div_ = document.getElementById('orders');
     var tableStr="<table width=\"50%\" align=\"right\" frame=\"void\" width=\"100%\"  border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse; \>";
     var inStr='<tr bgcolor=\"#fea44d\"><td>제품명</td><td>가격</td><td>소계</td></tr>';
     var total=0;
     if(mode){
    	 for(var i=0;i<size;i++){
    	     	if(checkedList[i].checked==true){
    	     		inStr+="<tr style=\"cursor:pointer;\" onMouseOver=\"this.style.backgroundColor='#FFFBD7'\" onMouseOut=\"this.style.backgroundColor=''\"><td>"+nameList[i].value+"\</td>\<td>￦"+ moneyChange(priceList[i].value)+" 원</td><td>"+ moneyChange(Number(priceList[i].value)*Number(countList[i].value))+"원</td></tr>";
    	     		total+=(Number(priceList[i].value)*Number(countList[i].value));
    	     	}
    	     } 
     }else{
 	     	if(checkedList.checked==true){
 	     		inStr+="<tr style=\"cursor:pointer;\" onMouseOver=\"this.style.backgroundColor='#FFFBD7'\" onMouseOut=\"this.style.backgroundColor=''\"><td>"+nameList.value+"\</td>\<td>￦"+ moneyChange(priceList.value)+" 원</td><td>"+ moneyChange(Number(priceList.value)*Number(countList.value))+"원</td></tr>";
 	     		total+=(Number(priceList.value)*Number(countList.value));
 	     	}
     }
     document.getElementById("orders").innerHTML = tableStr+inStr+"<tr style=\"cursor:pointer;\" onMouseOver=\"this.style.backgroundColor='#FFFBD7'\" onMouseOut=\"this.style.backgroundColor=''\"><td colspan=\"3\">합계:￦<font color=blue>"+ moneyChange(total)+"원</font></td></tr>"+"</table>";
     resize();
}

function generateAddr(){
	if(mode){
		for(var i=0;i<menunumList.length;i++){
			if(checkedList[i].checked==true){
				menunumStr+=menunumList[i].value+",";
				stnumStr+=stnumList[i].value+",";
				countStr+=countList[i].value+",";
			}
		}
	}else{
		menunumStr+=menunumList.value+",";
		stnumStr+=stnumList.value+",";
		countStr+=countList.value+",";
	}
}
</script>
<body onload="init(${listSize})">
<form id="cartListForm" name="cartListForm" action="" method="get">
<div id="content">
<table width="100%" height="100px" border="0"  cellpadding="1"  align="center">
	<tr >
		<td colspan="7">장바구니</td>
	</tr>
	</table>
<table align="center" frame="void" width="100%"  border="1" cellspacing="0" cellpadding="1" style="border-collapse:collapse; ">
	<tr bgcolor="${blog_des.layout_color}" align="center">
		<td>선택</td>
		<td>상품명</td>
		<td>가격</td>
		<td>수량</td>
		<td>상점명</td>
	</tr>
	<!--
	반복문 시작 위치
	-->
	<c:set var="cn" value="0"/>
	<c:forEach var="model" items="${cartlist}">
		<tr style="cursor:pointer;" onMouseOver="this.style.backgroundColor='#FFFBD7'" onMouseOut="this.style.backgroundColor=''">
			<td align="center"><input type="checkbox" name="checklist" id="ch${cn}" onclick="result()"/></td>
			<td>${model.menuname}</td>
			<td>${model.price}</td>
			<td>${model.quentity}</td>
			<td>${model.storename}</td>		
			<input type="hidden" name="menumList" id="menu_num${cn}" value="${model.menu_num}"/>
			<input type="hidden" name="stnumList" id="st_num${cn}" value="${model.st_num}"/>
			<input type="hidden" name="menuCountList" id="menucount${cn}" value="${model.quentity}"/>
			<input type="hidden" name="pricelist" id="pricecount${cn}" value="${model.price}"/>
			<input type="hidden" name="namelist" id="namecount${cn}" value="${model.menuname}"/>
			<c:set var="cn" value="${cn+1}"/>
		</tr>
	</c:forEach>
	<!--
	반복문 끝 위치
	-->
	<tr>
		<td colspan="7" align="left"><input type="button" value="삭 제" onclick="deleteSubmit()"></td>
	</tr>
	<tr>
		<td colspan="7">
			<div id="orders" align="right" style="margin-bottom: 0;"></div>
		</td>
	<tr>
		<td colspan="7" align="right"><input type="button" value="주문" onclick="orderSubmit()"><input type="button" value="Shopping" onclick="history.go(-1)"></td>
	</tr>
</table>
</div>
</form>
</body>
</html>