<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/profile/css/common.css"/>
</head>
<style>
body{
position:  fixed;
font-family:Space Grotesk, sans-serif; 
}
#sidebar-left {
	
	width: 210px;
	height: 500px; 
	padding: 20px;
	/*margin-right: 20px;*/
	margin-left: 32px;
	margin-bottom: 20px;
	postion:absolute;
	border: 3px dotted white;

	margin-top:1.7em;
	background-color: #e9e6e4;
	
}
#intro::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
#pt::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}


</style>
<body style="background-color: black;">
<%	
	String galtitle = request.getParameter("galtitle");
	String galcontent = request.getParameter("galcontent");
	String galsavename = request.getParameter("galsavename");
	
%>		<h2 style="margin-bottom:-20px; margin-top:10px; margin-left: .5em; color:white; font-family:Space Grotesk, sans-serif; font-weight: 900; font-size: 40pt; text-align: center;"  >Gallery</h2>
		<div style="margin-left:2em; margin-top: 2em; width: 320px; height: 610px; color: #e9e6e4; border:3px dotted white;">	
		<div id="sidebar-left">
		<div id = "ht" style=" color: black; font-size: 20pt; text-align: center;">${param.galtitle }</div>
		<!--  <h2><img src ="${cp}/home~~/img/${save}"</h1>-->
			
			<img id= "img" style="border-radius: 50%; width: 200px; height: 200px;  margin-left: 0.3em;"> 
			<div id = "pt" style="display:flex;  border-top: 30em; padding-left:9px; color: black; font-size: 20pt; text-align: center; width: 220px; height: 35px; overflow: scroll;">${param.galtitle}</div>
			<div id= "intro" style="border-top: 30em; color: black; text-align: center; margin-block:7px; width:210px; height: 260px; position: fixed; overflow: scroll;  "><p style="text-align: center;">${param.galcontent}</p></div><br>
			

		<input type="button" class="btn black" value="CLOSE"  onclick="javascript:self.close()" 
		style="margin-left: 4.7em;  margin-top: 22em;  position:fixed;  width: 80px; height: 35px; border-top-left-radius: 30%; border-bottom-right-radius: 30%; font-size: 11pt;">
			</div>	
	
		<!--  <div align="right"  class="btn black"><a href = "javascript:self.close();">닫기</a></div>-->
		</div>
	

	
	
	
	<script type="text/javascript">
var ht = document.getElementById("ht");
var intro = document.getElementById("intro");
var pt = document.getElementById("pt");
var img = document.getElementById("img");

//var galtitle= opener.document.getElementById('galtitle').value;
var galtitle = opener.document.getElementById('galtitle').value;
var galcontent = opener.document.getElementById('galcontent').value;
var galsavename = opener.document.getElementById('preview').src;




console.log(galtitle);
console.log(galcontent);
console.log(galsavename);

pt.innerHTML = galtitle;
intro.innerHTML = galcontent;
img.src = galsavename;
// form > submit
//img.src = psaveimg;
//console.log(img)



</script>

</body>
</html>