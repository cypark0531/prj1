<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
</head>
<style type="text/css">
body {
	margin:0;
  background-color: #121418;
  display: flex;
  font-family: "Inter", sans-serif;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 200vh;
  padding: 0 2em;

  height: 100vh;
	font-size: 16px;
}

</style>
<body>
	<h1 style="margin-left: 1em; font-size: 50pt; text-shadow:#999999 5px 5px 5px;" >CASH CHARGE</h1>
	<form action="${pageContext.request.contextPath }/charge/insert" method="get" onsubmit ="return check1()">
	<table>
	<tr>
	<td><input type="radio" name = "cash" value= "50" onclick="bb()"></td><td>5000원</td><td>50 coins</td>
	</tr>
	<tr>
	<td><input type="radio" name = "cash" value= "100" onclick="bb()"></td><td>10000원</td><td>100 coins</td>
	</tr>
	<tr>
	<td><input type="radio" name = "cash" value= "300" onclick="bb()"></td><td>30000원</td><td>300 coins</td>
	</tr>
	<tr>
	<td><input type="radio" name = "cash" value= "another" onclick="aa()"></td><td><input style="color:black;" type= "text" name= "another"  id = "etc" disabled="disabled">원</td>
	</tr>
	</table>

	<input type = "submit" value ="결제하기">
	</form>

	
</body>
<script type="text/javascript">
function aa(){
	var etc = document.getElementById("etc");
	etc.disabled = "";
}
function bb(){
	var etc = document.getElementById("etc");
	etc.value = "";
	etc.disabled = "disabled";
}
function check1(){
	var cash = document.getElementById("etc");
	var check2 = false;
	var chargeJ = /^[0-9]{1,12}$/;
	var empJ = /\s/g;
	if(empJ.test(cash.value)){
		alert("금액을 입력하세요");
		return false;
	}
	if(chargeJ.test(cash.value)){
		if(confirm(cash.value+"원을 결제하시겠습니까?")==true){
			return true;
		}else{
			return false;
		}
	}else{
	alert("금액을 숫자로 입력하세요");
	return false;
	}
}

</script>
</html>