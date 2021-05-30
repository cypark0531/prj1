<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${param.id }님의 게시판</h1>
<table>
	<tr>
		<th>게시판번호</th>
		<th>제목</th>
		<th>날짜</th>
	</tr>

<c:forEach var = "vo" items="${boardlist }">
	<tr>
		<td>${vo.bnum }</td>
		<td>${vo.btitle }</td>
		<td>${vo.regdate }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>