<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setAttribute("id", "test");
	request.setAttribute("gid","test2");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<h1>MAIN</h1>
<a href= "${pageContext.request.contextPath }/board/list?id=${requestScope.id}&gid=${requestScope.gid}">게시판</a>
</html>