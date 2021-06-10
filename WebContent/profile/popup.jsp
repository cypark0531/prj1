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
body{
position:  fixed;
font-family:Space Grotesk, sans-serif; 
}
#sidebar-left {
	
	width: 280px;
	height: 500px; 
	padding: 20px;
	/*margin-right: 20px;*/
	margin-left: 45px;
	margin-bottom: 20px;
	postion:absolute;
	border: 3px dotted white;

	margin-top:1.7em;
	margin-left: 1.7em;
	background-color: #e9e6e4;
	
}



</style>
<body style="background-color: black;">
<%	
	String htitle = request.getParameter("htitle");
	String ptitle = request.getParameter("ptitle");
	String pintro = request.getParameter("pintro");
	
%>		
		<h2 style="margin-bottom:-20px; margin-top:10px; margin-left: .9em; color:white; font-family:Space Grotesk, sans-serif; font-weight: 900; font-size: 60pt; text-align: center;"  >Profile</h2>
		<div style="margin-left:3em; margin-top: 2em; width: 390px; height: 610px; color: #e9e6e4; border:3px dotted white;">	
		<div id="sidebar-left">
		<div id = "ht" style=" color: black; font-size: 20pt; text-align: center;">${param.htitle }</div>
		<!--  <h2><img src ="${cp}/home~~/img/${save}"</h1>-->
			
			<img id= "img" style="border-radius: 50%; width: 240px; height: 240px;  margin-left: 1.5em;"> 
			<div id = "pt" style="border-top: 30em; color: black; font-size: 20pt; text-align: center;">${param.ptitle}</div>
			<div id= "intro" style="border-top: 30em; color: black; text-align: center; margin-block:7px; ">${param.pintro}</div><br>
			

		<input type="button" class="btn black" value="CLOSE"  onclick="javascript:self.close()" 
		style="margin-left: 7em;  margin-top: 5em; position:fixed;  width: 100px; height: 40px; border-top-left-radius: 30%; border-bottom-right-radius: 30%; font-size: 11pt;">
			</div>	
	
		<!--  <div align="right"  class="btn black"><a href = "javascript:self.close();">닫기</a></div>-->
		</div>
	

	
	
	
	<script type="text/javascript">
var ht = document.getElementById("ht");
var intro = document.getElementById("intro");
var pt = document.getElementById("pt");
var img = document.getElementById("img");

var htitle= opener.document.getElementById('htitle').value;
var ptitle = opener.document.getElementById('ptitle').value;
var pintro = opener.document.getElementById('pintro').value;
var psaveimg = opener.document.getElementById('preview').src;




console.log(htitle);
console.log(ptitle);
console.log(pintro);
console.log(psaveimg);
pt.innerHTML = ptitle;
intro.innerHTML = pintro;
img.src = psaveimg;
// form > submit
//img.src = psaveimg;
//console.log(img)



</script>

</body>
</html>