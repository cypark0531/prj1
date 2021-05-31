<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	.typing{width:100%; height:40px; font-size:30px; border:2px solid black;}
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid black; background-color:#FF8224; color:white;}
	
</style>
</head>
<body>
<div id="wrap" style="margin:auto; width:600px; height: 800px; background-color:white;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	<h1 style="padding-top:50px;">아이디 찾기</h1>
	
	<c:choose>
		<c:when test="${id==null }">
			<form method="post" action="${pageContext.request.contextPath }/login/findid">
				<div id="loginType" style="padding-top:60px; width:450px;">			
					<input class="typing" name="name" placeholder="이름"><br><div style="height:10px"></div>
					<input class="typing" name="email" placeholder="이메일"><br><div style="height:10px"></div>
					<input class="typing" name="phone" placeholder="전화번호('-'는 제외)"><br><div style="height:10px"></div>			
				</div>
				<div id="buttons" style="padding-top:40px; width:450px;">
					<input class="btn1" type="submit" name="loginbtn" value="아이디 찾기"><br><div style="height:5px"></div>
				</div>
			</form>	
		</c:when>
		<c:otherwise>
			<div style="padding-top:60px; width:450px;">
			 	
			</div>			
		</c:otherwise>
	</c:choose>
		<div style="width:450px;">	
			<a href="${pageContext.request.contextPath }/login/findpwd">비밀번호 찾기</a>
		</div>
	</div>
</div>

</body>
</html>