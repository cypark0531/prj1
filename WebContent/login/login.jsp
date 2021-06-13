<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
	*{margin:0px;padding:0px;}
	body{  background-color: #121418;}
	.typing{width:100%; height:40px; font-size:30px;border-radius: 10px; border: hidden; font-family: 'Jua', sans-serif; }
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid black; background-color: white; color:black; font-family: 'Jua', sans-serif; background-color: #566574; color: white; border: hidden; border-radius: 10px}
	.btn2{width:223px; height:40px; font-size:15px; border:2px solid black; background-color: white; color:black; font-family: 'Jua', sans-serif; background-color: #566574; color: white; border: hidden; border-radius: 10px}
	 
</style>
</head>
<body>
<div id="wrap" style=" background-color: #e9e6e4;  font-family: 'Jua', sans-serif; color:#566574; margin:auto;margin-top:100px; width:600px; height: 800px; border-color: white; border-style: dotted;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	<form method="post" action="${pageContext.request.contextPath }/login/login">
		<img src="${pageContext.request.contextPath }/login/loginlogo450x15001.png">
		<c:if test="${fail!=null }">
			<div style="margin-top:60px; width:450px; height:30px; background-color: black; text-align: center;">
				<span style="color: #566574;">올바른 아이디와 비밀번호를 입력해주세요</span>
			</div>
		</c:if>
		<div id="loginType" style="padding-top:60px; width:450px;">
			<input class="typing" name="id" placeholder="아이디" value=${requestScope.id }><br><div style="height:10px"></div>
			<span id="idcheck"></span>
			<input class="typing" type="password" name="pwd" placeholder="비밀번호"><br><div style="height:10px"></div>
			<c:choose>
				<c:when test="${requestScope.id!=null }">
				<input type="checkbox" name="box" value="true" checked="checked"><span style="color:white">   아이디 저장</span>
				</c:when>
				<c:otherwise>
				<input type="checkbox" name="box" value="true"><span style="color:#566574;">   아이디 저장</span>
				</c:otherwise>
			</c:choose>
			   
		</div>
		<div id="buttons" style="padding-top:40px; width:450px;">
			<input class="btn1" type="submit" name="loginbtn" value="로그인"><br><div style="height:5px"></div>
		</div>
	</form>	
		<div id="buttons" style="width:450px;">
		<form method="get" action="${pageContext.request.contextPath }/login/regist" style="float: left">
			<input class="btn2" type="submit" name="loginbtn" value="회원가입"><br><div style="height:5px"></div>
		</form>
		<form method="get" action="${pageContext.request.contextPath }/login/findid" style="float: right">
			<input class="btn2" type="submit" name="loginbtn" value="아이디/비밀번호 찾기"><br><div style="height:5px"></div>
		</form>
		</div>
	</div>
</div>
</body>
</html>