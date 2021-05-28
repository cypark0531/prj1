<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	.typing{width:100%; height:40px; font-size:30px; border:2px solid black;}
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid black; background-color:#FF8224; color:white;}
	.btn2{width:223px; height:40px; font-size:15px; border:2px solid black; background-color:#FF8224; color:white;}
	
</style>
</head>
<body>
<div id="wrap" style="margin:auto; width:600px; height: 800px; background-color:white;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	
	<form method="post" action="${pageContext.request.contextPath }/login/login">
		<img style="padding-left:75px;" src="${pageContext.request.contextPath }/login/loginlogo450x150.png">
		<div id="loginType" style="padding-top:60px; padding-left:75px; width:450px;">
			<input class="typing" name="id" placeholder="아이디"><br><div style="height:10px"></div>
			<span id="idcheck"></span>
			<input class="typing" type="password" name="pwd" placeholder="비밀번호"><br><div style="height:10px"></div>
			<input type="checkbox" name="box"><span>   아이디 저장</span>
			  
		</div>
		<div id="buttons" style="padding-top:40px; padding-left:75px; width:450px;">
			<input class="btn1" type="submit" name="loginbtn" value="로그인"><br><div style="height:5px"></div>
		</div>
	</form>	
		<div id="buttons" style="padding-left:75px; width:450px;">
		<form method="get" action="${pageContext.request.contextPath }/login/regist" style="float: left">
			<input class="btn2" type="submit" name="loginbtn" value="회원가입"><br><div style="height:5px"></div>
		</form>
		<form method="get" action="${pageContext.request.contextPath }/login/find" style="float: right">
			<input class="btn2" type="submit" name="loginbtn" value="아이디/비밀번호 찾기"><br><div style="height:5px"></div>
		</form>
		</div>
	</div>
</div>
</body>
</html>