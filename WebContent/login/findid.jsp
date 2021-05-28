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
	
</style>
</head>
<body>
<div id="wrap" style="margin:auto; width:600px; height: 800px; background-color:white;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	<h1 style="padding-top:50px; padding-left:75px;">아이디 찾기</h1>
	
	<form method="post" action="${pageContext.request.contextPath }/login/findid">
		<div id="loginType" style="padding-top:60px; padding-left:75px; width:450px;">			
			<input class="typing" name="name" placeholder="이름"><br><div style="height:10px"></div>
			<input class="typing" name="email" placeholder="이메일"><br><div style="height:10px"></div>
			<input class="typing" name="phone" placeholder="전화번호('-'는 제외)"><br><div style="height:10px"></div>
			
			
		</div>
		<div id="buttons" style="padding-top:40px; padding-left:75px; width:450px;">
			<input class="btn1" type="submit" name="loginbtn" value="아이디 찾기"><br><div style="height:5px"></div>
			<a href="${pageContext.request.contextPath }/login/findpwd">비밀번호 찾기</a>
		</div>
	</form>	
	</div>
</div>

</body>
</html>