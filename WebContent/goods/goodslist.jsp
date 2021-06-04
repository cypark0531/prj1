<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css?ver=1"/>
<%
 // ${requestScope.money };
%> 
</head>
<body>
<div id="wrapper">
  <div class="container">
    <div class="inner">
      <h1>상품목록</h1>
		<table border="1" id="asd" style="width: 70%"class="table01" >
		  <tr>
		    <th>상품이미지</th>
		    <th>상품코드</th>
		    <th>상품가격</th>
		    <th>상품이름</th>
		    <th>상품카테코리</th>
		  </tr>
		  <c:forEach var="vo" items="${goodslist }">
		    <tr>
		      <td><img alt="상품이미지" src="${pageContext.request.contextPath }/goodsimgfile/${vo.gsaveimg}" width="100" height="100"></td>
		      <td>${vo.gcode }</td>
		      <td>${vo.gprice }</td>
		      <td>${vo.gname }</td>
		      <td>${vo.gcategory }</td>
		      <td>
		        <form action="${pageContext.request.contextPath }/purchase/insert" method="post" onsubmit="return check()">
		          <input type="hidden" name="id" value="admin123">
		          <input type="hidden" name="gcode" value="${vo.gcode }">
		          <input type="hidden" name="gmoney" value="${vo.gprice }">
		          <input type="submit" value="구매">
		        </form>
			  </td>
		      <td>
	            <form action="${pageContext.request.contextPath }/purchase/list" method="post">
	              <input type="hidden" name="id" value="test5">
		          <input type="hidden" name="gcode" value="${vo.gcode }">
	              <input type="submit" value="장바구니">
	            </form>
	          </td>
		    </tr>
		  </c:forEach>
		</table>
    </div>
  </div>
</div>
<script type="text/javascript">
/* 	function check(){
		if(parma. naskldfj){
			alerrt
			return false;
		}else{
			return true;
		}
	} */
</script>
</body>
</html>