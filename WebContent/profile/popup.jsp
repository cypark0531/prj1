<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
		
		<div id="sidebar-left">
				<h2>Profile</h2>
		<!--  <h2><img src ="${cp}/home~~/img/${save}"</h1>-->
			<div id= "ht"></div><br>
			<div id = "pt"></div>
			<img id= "img"> 
			
			</div><br>	
	<input type="submit" class="btn black" value="닫기" onclick="javascript:self.close()">
		<!--  <div align="right"  class="btn black"><a href = "javascript:self.close();">닫기</a></div>-->

	

	
	
	
	<script type="text/javascript">
var ht = document.getElementById("ht");
var pt = document.getElementById("pt");
var img = document.getElementById("img");
var htitle= opener.document.getElementById('htitle').value;
var ptitle = opener.document.getElementById('ptitle').value;
var psaveimg = opener.document.getElementById('preview').src;

console.log(ht);
console.log(htitle);
console.log(psaveimg);
pt.innerHTML = ptitle;
ht.innerHTML = htitle;
img.src = psaveimg;
// form > submit
//img.src = psaveimg;
//console.log(img)



</script>
</body>
</html>