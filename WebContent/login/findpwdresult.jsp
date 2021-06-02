<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
	<div style="padding-top:60px; width:450px;">	
	<c:choose>
		<c:when test="${ pwd==null }">
			해당사용자의 계정을 찾을 수 없습니다
		</c:when>
		<c:otherwise>
			해당사용자의 비밀번호는 
			<span style="font-size: x-large; font-weight: bold;">${pwd }</span>입니다.
		</c:otherwise>
	</c:choose>
	</div>		
					
	<div style="width:450px;">	
		<a href="${pageContext.request.contextPath }/login/login">로그인</a>
	</div>
	</div>
</div>

</body>
</html>