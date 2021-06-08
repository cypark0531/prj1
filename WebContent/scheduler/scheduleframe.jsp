<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/homepageframe/css/homeindex.css">
</head>
<body style="color:black;">
<div class="blog">
 <div class="blog-part is-menu">
  <a href="#" class="blog-menu">
   Work
   <svg fill="none" stroke="currentColor" stroke-width=".7" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-up-right" viewBox="0 0 24 24">
    <path d="M7 17L17 7M7 7h10v10" />
   </svg>
  </a>
  <a href="#" class="blog-menu">Studio</a>
  <a href="${pageContext.request.contextPath }/scheduler/calendar?host=${id}" class="blog-menu">SCHEDULER</a>
  <a href="#" class="blog-menu">Contact</a>
  <a href="#" class="blog-menu mention">@MagazineDope</a>
  <a href="#" class="blog-menu subscribe">Subscribe</a>
 </div>
 <div class="blog-header blog-is-sticky">
  <div class="blog-article header-article">
   <div class="blog-big__title" style="font-size: 50px; margin-bottom: 32px; padding-left:1.5em;text-indent:-1.5em;">&nbsp;${htitle}</div>
   <div class="blog-menu rounded small-title">Pinned Issue</div>
  </div>
  <div class="blog-article page-number">
  <jsp:include page="${musicBox }"></jsp:include>
   NO. 01
  </div>
 </div>
</div>
</body>
</html>