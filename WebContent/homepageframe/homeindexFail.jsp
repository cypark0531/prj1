<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<% request.setAttribute("id", "test"); %>
<html>
<head>
<meta charset="UTF-8">
<title>homeindex.jsp</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/homepageframe/css/test.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>

<style type="text/css">
#container {
	width: 1500px;
	height: 1000px; 
	margin-right: auto;
	margin-left: auto;
}
#header {
	height: 100px;
	width: 100%;
	background-color:#ff00ff;
}

#content {
	width: 70%;
	padding: 10px;
	margin-right: 160px;
	margin-left: 160px;
}


#leftnav {
	float: left;
	width: 15%;
	height: 100%; 
	background-color: #30D9F4;
	padding: 5px;
		
}

#leftnav ul{
	margin-left: 0;
	padding-left: 0;
	list-style-type: none;
	font-family: '돋움', Helvetica, sans-serif;
	font-size: 12px;
}

#leftnav a{
	display: block;
	width: 130px;
	padding-top: 3px;
	padding-right: 3px;
	padding-bottom: 3px;
	padding-left: 3px;
	border-bottom-width: 1px;
}

#leftnav a:link, .navlist a:visited{
color: #ffffff;
text-decoration: underline;
font-weight: bold;
}

#leftnav a:visited{
   color: #ffffff;
   text-decoration: underline;
   font-weight: bold;
}

#leftnav a:hover{
	text-decoration: none;
	color: #0000ff;
}

#sidebar {
	padding: 10px;
	float: right;
	width: 15%;
	background-color: #30D9F4;
	height: 100%;

}

#footer {
	background-color: #2F77F1;
	padding: 10px;
	clear: both;
	font-family: '돋움', Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
}
</style>
</head>
<body> 

<div id="container">

	<div id="header">
		<span class="style1">헤더영역</span>
	</div>


	<!--메뉴영역-->
	<div id="leftnav">
		<ul id="navlist"> 
		<li>Profile</li>
		</ul>
	</div>


	<div id="sidebar">
	Music box
		
	</div>
	
	<div id="content">
<div class="cp_tab">

	<input type="radio" name="cp_tab" id="tab2_1" aria-controls="first_tab02" checked >
	<label for="tab2_1">Profile</label>
	
	
	<input type="radio" name="cp_tab" id="tab2_2" aria-controls="second_tab02">
	<label for="tab2_2">Second Tab</label>
	<input type="radio" name="cp_tab" id="tab2_3" aria-controls="third_tab02">
	<label for="tab2_3">Third Tab</label>
	<input type="radio" name="cp_tab" id="tab2_4" aria-controls="force_tab02">
	<label for="tab2_4">Force Tab</label>

	<div class="cp_tabpanels">
		<div class="cp_tabpanel">
		<jsp:include page= "${content }"/>
		</div>
		<div class="cp_tabpanel">
		<jsp:include page="/board/boardlist.jsp"/>
		<h2>Second Tab</h2>
		<p>Second Tab text</p>
		</div>
		<div class="cp_tabpanel">
		<h2>Third Tab</h2>
		<p>Third Tab text</p>
		</div>
		<div class="cp_tabpanel">
		<h2>Force Tab</h2>
		<p>Force Tab text</p>
		</div>
	</div>
</div>
	 </div>


	<div align="center" id="footer">
	하단 푸터
	</div>

</div>


</body>
</html>
