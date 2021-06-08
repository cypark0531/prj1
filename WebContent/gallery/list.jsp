<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/gallery/css/gallery.css"/>
</head>
<body>

<div class="child-page-listing">

  <h2>Our Locations</h2>

  <div class="grid-container">

    <article id="3685" class="location-listing">

      <a class="location-title" href="#">
          San Francisco           </a>

      <div class="location-image">
        <a href="#">
            <img width="300" height="169" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg" alt="san francisco">    </a>

      </div>

    </article>


  </div>


</div>
<script type="text/javascript">

	function show() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4&&xhr.status==200){
				let replyDiv = document.getElementById("container");
				var xml = xhr.responseXML;
			
				let regdate = xml. getElementsByName("regdate")[i]textContent;
				let galcontent = xml.getElementsByTagName("galcontent").[i]textContent;
				let galsavename = xml.getElementsByTagName("galsavename").[i]textContent;
				let div = document.createElement("div");
				let divname = div.className("child-page-listing");
				let article = document.createElement("article");
				let articlename = article.className("lacation-listing")
				let h2 = document.createElement("h2");
				let a = document.createElement("a");
				a.href="#";
				let img = document.createElement("img");
				limg.src= ; 
				
			}
		}
	}
	
</script>
</body>
</html>