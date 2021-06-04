	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/homepageframe/css/homeindex.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
<style type="text/css">


</style>

</head>
<body>
<div class="blog">
 <div class="blog-part is-menu">
  <a href="#" class="blog-menu">
   Work
   <svg fill="none" stroke="currentColor" stroke-width=".7" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-up-right" viewBox="0 0 24 24">
    <path d="M7 17L17 7M7 7h10v10" />
   </svg>
  </a>
  <a href="#" class="blog-menu">Studio</a>
  <a href="#" class="blog-menu">Blog</a>
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
 <div class="blog-header-container">
  <div class="blog-header">
   <div class="blog-article header-article">
    <div class="blog-big__title">Profile</div>
    <div class="blog-menu small-title date">12.06.2021</div>
   </div>
   <div class="blog-article">
    <img alt="" src="${pageContext.request.contextPath }/homepageframe/img/${psaveimg}" style="border-radius: 50%; width: 220px;  height:220px; margin-left: 100px;"/>
    <h2 style="text-align: center; margin-top: 10px;">	<!--<span>Widespread</span>-->${ptitle}</h2>
    <div class="blog-detail">
     <span>By Richard Carnation</span>
     <span>5 Min Read</span>
    </div>
    <p style="font-size: 20px;">${pintro}</p>
    <a href="#">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     See More
    </a>
   </div>
  </div>
  <div class="blog-header">
   <div class="blog-article header-article">
    <div class="blog-big__title">Love</div>
    <div class="blog-menu small-title date">12.06.2021</div>
   </div>
   <div class="blog-article">
    <img src="https://images.unsplash.com/photo-1529255484355-cb73c33c04bb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTh8fGJsYWNrJTIwYW5kJTIwd2hpdGV8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="">
    <h2>Talking About <span>Vulnerability</span> During Quarantine</h2>
    <div class="blog-detail">
     <span>By Tom Hiddleston</span>
     <span>5 Min Read</span>
    </div>
    <p>Having traveled to Turkey multiple times, with critics praising Ocean's introspective lyrics and the album's unconventional</p>
    <a href="#">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     See More
    </a>
   </div>
  </div>
  <div class="blog-header">
   <div class="blog-article header-article">
    <div class="blog-big__title">Control</div>
    <div class="blog-menu small-title date">12.06.2021</div>
   </div>
   <div class="blog-article">
    <img src="https://images.unsplash.com/photo-1616248249518-b16013cd4e42?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTkzfHxibGFjayUyMGFuZCUyMHdoaXRlfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="">
    <h2>How 2020 Changed <span>Understanding</span> Of Mental Health</h2>
    <div class="blog-detail">
     <span>By Scarlett Witch</span>
     <span>5 Min Read</span>
    </div>
    <p>Time is defines ad the indefinete continued progress, with critics praising Ocean's introspective lyrics and the album's</p>
    <a href="#">
     <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right" viewBox="0 0 24 24">
      <path d="M15 10l5 5-5 5" />
      <path d="M4 4v7a4 4 0 004 4h12" />
     </svg>
     See More
    </a>
   </div>
  </div>
 </div>
 <div class="blog-part right-blog">

  <marquee width="100%" direction="left">
   <span>Now And Then You Miss It Sounds Make You Cry</span>
   <span>Now In - MoMa Sharing Exhibition NOW</span>
   <span>NYC Opens After Long Lockdown Check</span>
  </marquee>
  <div class="blog-right-title-container">

   <div class="blog-right-title" >
   </div>
   <div class="blog-menu rounded">See All</div>
  </div>
  <div class="blog-right">
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">1</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">Blonde - Widespread Acclaim</div>
    <div class="blog-right-page-subtitle">Blonde received widespread acclaim, with critics praising Ocean's introspective lyrics and the album's</div>
   </div>
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">2</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">Introspective Lyrics and Beats</div>
    <div class="blog-right-page-subtitle">When we toured Scotland we stopped at several selft-sealing hpuses because hotels would</div>
   </div>
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">3</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">The Language Of Gris: Comples Beauty Of Monochrome</div>
    <div class="blog-right-page-subtitle">The interior concept was conceived of by Dutch archtitect Studio Anne Holtrop who cleverly emulated</div>
   </div>
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">4</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">A24 IS LAUNCHING ITS OWN BEAUTY BRAND</div>
    <div class="blog-right-page-subtitle">Blonde received widespread acclaim, with critics praising Ocean's introspective lyrics and the album's</div>
   </div>
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">5</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">Elon Musk's SpaceX is launching a moon satellite</div>
    <div class="blog-right-page-subtitle">The interior concept was conceived of by Dutch archtitect Studio Anne Holtrop who cleverly emulated</div>
   </div>
   <div class="blog-right-container">
    <div class="blog-title-date">
     <div class="blog-right-page">6</div>
     <div class="date">12.06.2021</div>
    </div>
    <div class="blog-right-page-title">What Happens When You Leave Your Old life Behind</div>
    <div class="blog-right-page-subtitle">The interior concept was conceived of by Dutch archtitect Studio Anne Holtrop who cleverly emulated</div>
   </div>
   <div class="circle">
    <div class="circle-title">Leave Your Old Life Behind</div>
    <div class="circle-subtitle">Don't try to be like someone else, be yourself. Be secure with yourself.</div>
    <div class="circle-footer">Explore</div>
   </div>
  </div>
 </div>
</div>
</body>
</html>