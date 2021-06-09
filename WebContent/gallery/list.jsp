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
<body >
	<h1>GALLERY</h1>
	<div class= "wraps">
	<div id = "hello">
	
	</div>
	</div>
<script type="text/javascript">
	var xhr = null;
	
show();

	function show() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4&&xhr.status==200){
				let hello = document.getElementById("hello");
				
				var xml = xhr.responseXML;
				let length = xml. getElementsByTagName("regdate").length
				console.log(length);
				for(let i=0;i<length;i++){
				
					
				let regdate = xml.getElementsByTagName("regdate")[i].textContent;
				let galcontent = xml.getElementsByTagName("galcontent")[i].textContent;
				let galsavename = xml.getElementsByTagName("galsavename")[i].textContent;
				let galtitle = xml.getElementsByTagName("galtitle")[i].textContent;
				let id = xml.getElementsByTagName("id")[i].textContent;
				let div = document.createElement("div");
				div.className= "btns";
				let div1 = document.createElement("div");
				div1.className = "child-page-listing";
				let h2 = document.createElement("h2");
				let h3 = document.createElement("h3");
				let div2 = document.createElement("div");
				div2.className = "grid-container";
				let article = document.createElement("article");
				article.className = "location-listing";
				let a = document.createElement("a");
				a.className="location-title";
				a.href="#";
				let div3 = document.createElement("div");
				div3.className = "location-image";
				let a2 = document.createElement("a");
				a2.href="#";
				let img = document.createElement("img");
				img.width = "300";
				img.height = "169";
				//img.src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/san-fransisco-768x432.jpg";
				img.src= "${pageContext.request.contextPath }/homepageframe/gimg/"+galsavename;
				
				
								
				
				h2.innerHTML = galtitle;
				h3.innerHTML = regdate;
				a.innerHTML = galcontent;
				hello.appendChild(div1);
				div1.appendChild(h2);
				div1.appendChild(h3);
				div1.appendChild(div2);
				div2.appendChild(article);
				article.appendChild(a);
				article.appendChild(div3);
				div3.appendChild(a2);
				a2.appendChild(img);
				hello.appendChild(div);
				
				let flag = true;
				a.addEventListener('click', function(e) {
					if(flag){
						let input1 = document.createElement("input");
						input1.type= "button";
						input1.value= "수정"
						input1.onclick = function(){
							console.log("2")
							location.href = "asdjkl;f?id"+id+"&gid="+gid+"&galnum="+galnum
						}
						let input2 = document.createElement("input");
						input2.type= "button";
						input2.value= "삭제"
						input2.onclick = function(){
							
							location.href = "asdjkl;f?id"+id+"&gid="+gid+"&galnum="+galnum
						}
						
						div.appendChild(input1);
						div.appendChild(input2);
						flag = false;
					}else{
							let childs = div.childNodes;
							for(let i=childs.length-1;i>=0;i--){
								div.removeChild(childs.item(i))
								flag = true;
						
					}
					}
					
				});
				/*
				a2.appendChild(img);
				div3.appendChild(a2);
				article.appendChild(div3);
				article.appendChild(a);
				div2.appendChild(article);
				div1.appendChild(div2);
				hello.appendChild(div1);	
			*/
			
				}

			}
		};
		xhr.open("get","${pageContext.request.contextPath}/gallery/list?id=${param.id}",true);
		xhr.send();
	}

	
</script>
</body>
</html>