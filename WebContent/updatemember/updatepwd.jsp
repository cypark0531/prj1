<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 관리</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	body{background-color: black;}
	.typing{width:100%; height:40px; font-size:30px; border:2px solid white;}
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid white; background-color:black; color:white;}
	
</style>
</head>
<body>
<div id="wrap" style="margin:auto; margin-top:100px; width:600px; height: 800px; border-color: white; border-style: dotted;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	<h1 style="padding-top:50px; color: white;">비밀번호 재설정</h1>	
	
	<form method="post" action="${pageContext.request.contextPath }/updatemember/updatepwd" id="frm">
		<div id="loginType" style="padding-top:60px; width:450px;">			
			<input type="password" class="typing" id="currpwd" name="currpwd" placeholder="현재 비밀번호"><br><div style="height:10px"></div>
			<input type="password" class="typing" id="changepwd" name="changepwd" placeholder="변경된 비밀번호"><br><div style="height:10px"></div>
			<input type="password" class="typing" id="changepwdck" name="changepwdck" placeholder="비밀번호확인"><br><div style="height:10px"></div>			
		</div>
		<div style="padding-top:40px; width:450px;">
			<input class="btn1" type="button" id="setbtn" value="설정">
			<input class="btn1" type="button" id="cancelbtn" value="취소" style="margin-top:10px">
		</div>
	</form>	
	</div>
</div>

</body>
<script type="text/javascript">
	const setbtn=document.getElementById("setbtn");
	const cancelbtn=document.getElementById("cancelbtn");
	const currpwd=document.getElementById("currpwd");
	const changepwd=document.getElementById("changepwd");
	const changepwdck=document.getElementById("changepwdck");
	
	cancelbtn.onclick=function(){
		window.location.href= "${pageContext.request.contextPath }/updatemember/update";
	}
	setbtn.onclick=function(){
		console.log(currpwd.value+" "+changepwd.value+" "+changepwdck.value);
		if(currpwd.value=="" || changepwd.value=="" || changepwdck.value=="")alert("비밀번호를 입력해주세요");
		else if(currpwd.value!="${pwd}")alert("현재 비밀번호가 아닙니다");
		else if(changepwd.value!=changepwdck.value)alert("비밀번호확인이 비밀번호와 일치하지 않습니다");
		else {
			alert("비밀번호가 성공적으로 변경되었습니다");
			document.getElementById("frm").submit();
			window.location.href= "${pageContext.request.contextPath }/updatemember/update";
		}
	}
</script>
</html>