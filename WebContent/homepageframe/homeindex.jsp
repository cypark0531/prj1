	<%@page import="com.minihome.vo.ProfilesVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/homepageframe/css/homeindex.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>

<script type="text/javascript">

top.window.moveTo(0,0);
if (document.all) {
top.window.resizeTo(screen.availWidth,screen.availHeight);
}
else if (document.layers||document.getElementById) {
if (top.window.outerHeight<screen.availHeight||top.window.outerWidth<screen.availWidth){
top.window.outerHeight = screen.availHeight;
top.window.outerWidth = screen.availWidth;
}
}
	window.onload = function () {
		window.focus();
		window.moveTo(0, 0);
		window.resizeTo(1280,800);
		window.scrollTo(0,250);
	}
	function addFriend(){
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let xml=xhr.responseXML;
				let result=xml.getElementsByTagName("code")[0].textContent;
				let reason=xml.getElementsByTagName("reason")[0].textContent;
				if(result=="success"){
					alert("성공적으로 일촌신청되었습니다");									
				}
				else {
					if(reason=="already")alert("이미 신청되었거나 일촌 상태인 회원입니다.");	
					else alert("오류로 인해 실패했습니다.");				
				}
			}
		};
		xhr.open('get','${pageContext.request.contextPath }/friend/addfriend?hid=${gid}&gid=${id}',true);
		xhr.send();
	}
	
	function GOFriend() {
		window.location.href= "${pageContext.request.contextPath }/friend/friend?host=${id}";
		
	}
	function SetUp1() {
		window.location.href= "${pageContext.request.contextPath }/profile/upload.jsp?id=${id}";
		
	}
	
	function SetUp2() {
		window.location.href= "${pageContext.request.contextPath }/profile/list?id=${id}";
		
	}
	
	function SeeMore() {
		window.location.href= "${pageContext.request.contextPath }/gallery/list.jsp?id=${id}&gid=${gid}";
			
	}
	
	function Resister() {
		window.location.href= "${pageContext.request.contextPath }/gallery/insert.jsp?id=${id}&gid=${gid}"
	}
	
	
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/homepageframe/css/homeindex.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
<style type="text/css">


</style>

</head>
<body style="color:#383a3d;">
<div class="blog">
 <div class="blog-part is-menu">
 <!--
  <a href="#" class="blog-menu">
   Work
   <svg fill="none" stroke="currentColor" stroke-width=".7" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-up-right" viewBox="0 0 24 24">
    <path d="M7 17L17 7M7 7h10v10" />
   </svg>
  </a>
  <a href="#" class="blog-menu">Contact</a>
 -->
  <a href="${pageContext.request.contextPath }/scheduler/calendar?host=${id}" class="blog-menu">SCHEDULER</a>
  <a href="${pageContext.request.contextPath }/board/list?id=${gid}" class="blog-menu">BOARD</a>s

  <a href="${pageContext.request.contextPath }/goods/goodslist?id=${gid}" class="blog-menu">SHOP</a>

  <a href="${pageContext.request.contextPath }/histories/list?id=${gid}" class="blog-menu">GUEST BOOK</a>  
  <a href="${pageContext.request.contextPath }/search/search.jsp" class="blog-menu">SEARCH</a>
  
  <a href="${pageContext.request.contextPath }/login/logout" class="blog-menu mention">LOGOUT</a>
  <a href="${pageContext.request.contextPath }/home?id=${gid}" class="blog-menu subscribe">MYHOME</a>
 </div>
 <div class="blog-header blog-is-sticky">
  <div class="blog-article header-article">
   <div class="blog-big__title" style="font-size: 50px; margin-bottom: 32px;">${htitle}<br>
   </div>
   <div class="blog-menu  small-title">

   <c:if test="${id!=gid }">
	<input type="button" value="일촌 신청" style="width:200px; height:40px; font-size: x-large; color:black;" onclick="addFriend()">
   </c:if>
   </div>
  </div>
  <div class="blog-article page-number">
    <marquee style= "margin-bottom:20px; width:13.4em; height:28px; direction: left;  background-color: #566574">
   <p style=" font-family: Consolas,Monaco;  font-size:14pt; position:absolute; word-spacing: 10px; margin-top: -5px; text-align: center;">This area is music title</p>
  </marquee>
  <jsp:include page="${musicBox }"></jsp:include>

  <div style="height:400px; max-width:227px;">
   <table id="friend">
   <tr>
   	<th style="font-size:x-large; text-align: left; color:black;">일촌 목록</th>
   </tr>
   	<tr>
   		<th style="font-size:large; color:black; width:70%; border-bottom: 1px solid #94918f;">아이디</th>
   		<th style="font-size:large; color:black; width:100%; border-bottom: 1px solid #94918f;">홈페이지</th>
   	</tr>
   	<c:forEach var="list" items="${requestScope.friendlist }">
   		<tr>
   			<td style="font-size:medium; color:black; border-bottom: 1px solid #94918f;">${list[0] }</td>
   			<td style="color:black; border-bottom: 1px solid #94918f;">
   				<c:if test="${list[0]!='-' }">
   					<a href="${pageContext.request.contextPath }/${list[1]}" style="border-top: 0px; font-size: medium; padding-top: 0px;">이동</a>
   				</c:if>
   			</td>
   		</tr>
   	</c:forEach>
   </table>
  </div>
   <a href="#" onclick="GOFriend()">
   	<svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
   	<path d="M15 10l5 5-5 5" />
   	<path d="M4 4v7a4 4 0 004 4h12" />
   	</svg>
    SEE MORE
   </a>
  </div>
 </div>
 
 <div class="blog-header-container">
 	 <!-- 프로필profile -->
  <div class="blog-header">
   <div class="blog-article header-article">
    <div class="blog-big__title">Profile</div>
   </div>
   
 
   <c:choose>
   
   <c:when test="${profile==2}">
  
   <div class="blog-article">
   <c:choose>
	<c:when test="${psaveimg!=null }">
    <img alt="" src="${pageContext.request.contextPath }/homepageframe/img/${psaveimg}" style="border-radius: 50%; width: 220px;  height:220px; margin-left: 100px;"/>
    </c:when>
    <c:otherwise>
    <img alt="" src="homepageframe/gimg/none1.jpg" style="border-radius: 50%; width: 220px;  height:220px; margin-left: 100px;"/>
    
    </c:otherwise>
    </c:choose>
    <h2 style="text-align: center; margin-top: 10px;">	<!--<span>Widespread</span>-->${ptitle}</h2>
    <div class="blog-detail">
     <span>♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥</span>
     
    </div>
    <p style="font-size: 20px; text-align: center;">${pintro}</p>
    <c:if test="${id==gid}">
    <a href="#" onclick="SetUp2()">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
    SET UP
    </a>
    </c:if>
   </div>
     </c:when>
    <c:otherwise>
    	   <div class="blog-article">
   
    <img alt="" src="homepageframe/gimg/none1.jpg" style="border-radius: 50%; width: 220px;  height:220px; margin-left: 100px;"/>
    <h2 style="text-align: center; margin-top: 10px;">	<!--<span>Widespread</span>-->Profile dosen't not exist.</h2>
    <div class="blog-detail">
     <span>By Richard Carnation</span>
     <span>5 Min Read</span>
    </div>
    <p style="font-size: 20px;"> If u  Want to upload your Profile Please Click 'SETUP'!</p>
    <a href="#" onclick="SetUp1()">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
    SET UP
    </a>
    
   </div>
   </c:otherwise>
     </c:choose>
    
    
  </div>
  <!-- 다이어리 Daily -->
  <div class="blog-header">
  	<div class="blog-article header-article">
    <div class="blog-big__title">Diary</div>
    <div class="blog-menu small-title date">12.06.2021</div>
   </div>
   <div class="blog-article" >
   <jsp:include page="${requestScope.dPath}"/>
     <!-- <img src="https://images.unsplash.com/photo-1529255484355-cb73c33c04bb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTh8fGJsYWNrJTIwYW5kJTIwd2hpdGV8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="">
    <h2>Talking About <span>Vulnerability</span> During Quarantine</h2>
    <div class="blog-detail">
     <span>By Tom Hiddleston</span>
     <span>5 Min Read</span>
    </div>
    <p>Having traveled to Turkey multiple times, with critics praising Ocean's introspective lyrics and the album's unconventional</p>
     <input  id='seemore' type="button"  onclick="nextPage()" value="SEE MORE">
     <a href="#">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     See More
    </a> -->
   </div>
  </div>
  
  <!-- Gallery갤러리 -->
  <div class="blog-header">
   <div class="blog-article header-article" >
    <div class="blog-big__title" style="height: 160px; ">Gallery</div>
	
    <div class="blog-menu small-title date" style="color:#383a3d; font-style: oblique; font-family: Consolas,Monaco ">update date: ${gvo.regdate}</div>
   </div>
   	<div class="blog-article">
   	<c:choose>
   	<c:when test="${gvo.galsavename=='none' }">
   	<img src="homepageframe/gimg/none1.jpg" style=" display:flex;   border-radius: 10%; width: 300px;  height:300px; margin-left: 3em;" >
   	</c:when>
   	<c:otherwise>
    <img src="${pageContext.request.contextPath }/homepageframe/gimg/${gvo.galsavename}" style=" display:flex; border-radius: 10%; width: 300px;  height:300px; margin-left: 3em; " >
   	</c:otherwise>
   	</c:choose>
    <h2 style="text-align: center; margin-top: 10px;">	<!--<span>Widespread</span>-->${gvo.galtitle}</h2>
  
    <p style="font-size: 20px;text-align: center;">${gvo.galcontent }</p>

    
  
    <div class="prolinks" >
  
    
    <c:choose>
    <c:when test="${id==gid }">
    <a href="#" onclick="Resister()" style="float: left;">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     RESISTER
    </a>
        <a href="#" onclick="SeeMore()" style="float: right;">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     SEE MORE
    </a>
   </c:when>
	<c:otherwise>
	  <a href="#" onclick="SeeMore()" style="float: right;">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     SEE MORE
    </a>
  	</c:otherwise>
    </c:choose>

    </div>
   </div>
  </div>
 </div>
 
 <div class="blog-part right-blog">

  <marquee width="100%" direction="left">
   <span style="font-size:18pt; font-family: Consolas,Monaco;">${pintro} </span>
   <span>Now In - MoMa Sharing Exhibition NOW</span>
   <span>NYC Opens After Long Lockdown Check</span>
  </marquee>
  <div class = "today">
 	today : ${requestScope.today }&nbsp;&nbsp;total : ${requestScope.allday }
 	</div>
  <div class="blog-right-title-container">
 	
   <div class="blog-right-title" style="color:#383a3d" >
   </div>
   <div class="blog-menu rounded" style="width: 100%; color:#383a3d; font-weight: 900; font-size:35px; font-family: Consolas,Monaco " >Frineds Talk Talk</div>
  </div>
  
  <jsp:include page="/friendsay/friendsaylist.jsp"/>
  
  
  

	<!--  
  <div class="blog-right">
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">1</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">Blonde - Widespread Acclaim</div>
    <div class="blog-right-page-subtitle">Blonde received widespread acclaim, with critics praising Ocean's introspective lyrics and the album's</div>
   </div>
    
   
   
   
   <div class="circle">
    <div class="circle-title">Leave Your Old Life Behind</div>
    <div class="circle-subtitle">Don't try to be like someone else, be yourself. Be secure with yourself.</div>
    <div class="circle-footer">Explore</div>
   </div>
  </div>
 </div>
 -->
 
 
 
</div>


</body>
</html>