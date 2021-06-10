<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
    position: relative;  
    width:100%;
    max-width:100px;
}
.container:before {
  content:"";
  position:absolute;
  width:100%;
  height:100%;
  top:0;left:0;right:0;
  background-color:rgba(0,0,0,0);
}


.container:hover::before {
  background-color:rgba(0,0,0,0.5);
}
.container img  {
  display:block;
}
.container button {
  position: absolute;
  top: 60%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  opacity:0;
} 

.container:hover button {  
	
  opacity: 1;
}
</style>
</head>
<body>
<div class="container">
  <img src="http://placeimg.com/100/100/animals" alt="Snow">
   
   <button class="btn">Button</button>
   
</div>
</body>
</html>