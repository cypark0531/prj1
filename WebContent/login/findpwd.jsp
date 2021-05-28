<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	.typing{width:100%; height:40px; font-size:30px; border:2px solid black;}
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid black; background-color:#FF8224; color:white;}
	
</style>
</head>
<body>
<div id="wrap" style="margin:auto; width:600px; height: 800px; background-color:white;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	<h1 style="padding-top:50px;">비밀번호 찾기</h1>
	
	<form method="post" action="${pageContext.request.contextPath }/login/regist">
		<div id="loginType" style="padding-top:60px; width:450px;">
			<input class="typing" name="id" placeholder="아이디"><br><div style="height:10px"></div>
			<span id="idcheck"></span>
			<input class="typing" name="name" placeholder="이름"><br><div style="height:10px"></div>
			비밀번호질문   <select  name="pwdAsk" >
				<option value="">--- 선택하세요 ---</option>
				<option value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
				<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
				<option value="가장 좋아하는 책은?">가장 좋아하는 책은?</option>
				<option value="가장 존경하는 사람은?">가장 존경하는 사람은?</option>
				<option value="가장 좋아하는 장소는?">가장 좋아하는 장소는?</option>
			</select><br><div style="height:10px"></div>
			<input class="typing" name="pwdAns" placeholder="비밀번호답안"><br>
			
		</div>
		<div id="buttons" style="padding-top:40px; width:450px;">
			<input class="btn1" type="submit" name="loginbtn" value="비밀번호 확인"><br><div style="height:5px"></div>
		</div>
	</form>	
	</div>
</div>
</body>
</html>