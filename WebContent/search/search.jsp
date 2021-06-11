<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0px; padding:0px;}
	body{background-color: black;}
	td{text-align: center;}
</style>
</head>
<body>
<div style="margin:auto; margin-top:100px; padding: 100px 60px 100px 60px; width:520px; border-color: white; border-style: dotted;">
<div style="width:100%;">
<h1 style="color:white;">회원 검색</h1>
<div style="width:100%; margin-top:60px; height:40px;">
	<input id="search" value="${requestScope.str }" style="font-size:x-large; width:87%; height:40px; background-color: black; border:2px solid white; color:white;">
	<input id="sbtn" type="button" value="검색" style="background-color: black; border:2px solid white; color:white; width:50px; height:40px;">
</div>
<table id="friendtable" style="background-color: white; width:100%; margin-top:60px;">
	<tr>
		<th>아이디</th><th>닉네임</th><th>일촌 상태</th><th>미니홈피</th>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr class="tr" >
			<td>
			${list.id }
			<input class="id" type="hidden" value="${list.id }">
			</td>
			<td>${list.name }</td>
			<td><c:choose>
			<c:when test="${list.state==1 }">승락 대기중</c:when>
			<c:when test="${list.state==2 }">요청됨</c:when>
			<c:when test="${list.state==3 }">일촌</c:when>
			<c:otherwise>-</c:otherwise>
			</c:choose></td>
			<td><a href="${pageContext.request.contextPath }/home?id=${list.id }">이동</a></td>
		</tr>
	</c:forEach>
</table>
</div>

</div>
</body>
<script type="text/javascript">
	var search=document.getElementById("search").value;
	var sbtn=document.getElementById("sbtn");
	sbtn.onclick=function(){
		location.replace("${pageContext.request.contextPath}/search/search?str="+search);	
	}
	
	
	
</script>
</html>