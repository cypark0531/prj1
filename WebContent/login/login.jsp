<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	.typing{width:100%; height:40px; font-size:30px; border:2px solid black;}
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid black; background-color:black; color:white;}
	.btn2{width:223px; height:40px; font-size:15px; border:2px solid black; background-color:black; color:white;}
	 
</style>
</head>
<body>
<div id="wrap" style="margin:auto; width:600px; height: 800px; background-color:white;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	
	<form method="post" action="${pageContext.request.contextPath }/login/login">
		<img src="${pageContext.request.contextPath }/login/loginlogo450x150.png">
		<c:if test="${fail!=null }">
			<div style="padding-top:60px; width:450px; height:30px; border:2px solid red">
				에러: 올바른 아이디와 비밀번호를 입력해주세요
			</div>
		</c:if>
		<div id="loginType" style="padding-top:60px; width:450px;">
			<input class="typing" name="id" placeholder="아이디" value=${id }><br><div style="height:10px"></div>
			<span id="idcheck"></span>
			<input class="typing" type="password" name="pwd" placeholder="비밀번호"><br><div style="height:10px"></div>
			<c:choose>
				<c:when test="${id!=null }">
				<input type="checkbox" name="box" value="true" checked="checked"><span>   아이디 저장</span>
				</c:when>
				<c:otherwise>
				<input type="checkbox" name="box" value="true"><span>   아이디 저장</span>
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