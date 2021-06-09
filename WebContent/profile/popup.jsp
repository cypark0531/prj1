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
	width: 280px;
	height: 500px; 
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
			<div id= "intro" style="border-top: 30em; color: black;">${param.htitle }</div><br>
			<img id= "img" style="width: 220px; height: 220px; margin-top: -5em; margin-left: 1.5em;"> 
			<div id = "pt" style="border-top: 30em; color: black;">${param.ptitle}</div>
			
			

		<input type="button" class="btn black" value="닫기" onclick="javascript:self.close()" 
		style="margin-left: 8em; margin-bottom: -30em; ">
			</div>	
	
		<!--  <div align="right"  class="btn black"><a href = "javascript:self.close();">닫기</a></div>-->

	

	
	
	
	<script type="text/javascript">
var intro = document.getElementById("intro");
var pt = document.getElementById("pt");
var img = document.getElementById("img");
var psaveimg = opener.document.getElementById('preview').src;
var ptitle = opener.document.getElementById('ptitle').value;
var ptintro= opener.document.getElementById('pintro').value;


console.log(ht);
console.log(htitle);
console.log(psaveimg);
img.src = psaveimg;
pt.innerHTML = ptitle;
intro.innerHTML = pintro;
// form > submit
//img.src = psaveimg;
//console.log(img)



</script>

</body>
</html>