<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
opener.document.getElementById('htitle').value = ${#popup}.val();
</script>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
</head>
<style>
#sidebar-left {
	float: left;
	width: 160px;
	height: 380px; 
	padding: 20px;
	margin-right: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}
</style>
<body>
<%
	String ptitle = request.getParameter("ptitle");
%>
		<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/upload" enctype="multipart/form-data" method="post" >
		<div id="sidebar-left">
				<h2>Profile</h2>
		<!--  <h2><img src ="${cp}/home~~/img/${save}"</h1>-->
			
			<p>${param.ptitle}</p>
			</div><br>	
	<input type="submit" class="btn black" value="등록하기">
	</form>
</body>
</html>