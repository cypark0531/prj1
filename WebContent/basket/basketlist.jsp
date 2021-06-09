<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css?ver=1"/>
<style type="text/css">
body {
	margin:0;
  background-color: #121418;
  display: flex;
  font-family: "Inter", sans-serif;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 200vh;
  padding: 0 2em;
  height: 100vh;
	font-size: 16px;
}
</style>
</head>
<body>
<div id="wrapper" style=" padding: 30px 30px;  border-style: dotted;">
  <div class="container">
    <div class="inner" >
      <h1>장바구니목록</h1>
      <div style="overflow: scroll; width:100%; height:600px;">
		<table style="width: 100%;"  class="table02" >
		  <tr>
		    <th>삭제</th>
		    <th>상품이미지</th>
		    <th>상품이름</th>
		    <th>가격</th>
		    <th>합계</th>
		  </tr>
		  <c:set var="total" value="0"/>
		  <c:forEach var="vo" items="${basketlist }">
		    <tr>
		      <td>
		        <form action="${pageContext.request.contextPath }/basket/delete" method="post">
		          <input type="hidden" name="id" value="test">
		          <input type="hidden" name="basnum" value="${vo.basnum }">
		          <input type="submit" value="삭제" class="btn mr5" style="margin-bottom:5px; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
		        </form>
		      </td>
		      <td><img alt="상품이미지" src="${pageContext.request.contextPath }/goodsimgfile/${vo.gsaveimg}" width="100" height="100"></td>
		      <td>${vo.gname }</td>
		      <td>${vo.gprice}</td>
		      <!-- 원하는 숫자를 양식에 맞춰서 변환 해줌 -->
		      <td>
		        <form action="${pageContext.request.contextPath }/purchase/insert" method="post" onsubmit="return check('${requestScope.money},${vo.gprice }')">
		      <%--   <input type="hidden" name="money" value="${requestScope.money}"> --%>
		          <input type="hidden" name="id" value="test">
		          <input type="hidden" name="gprice" value="${vo.gprice }">
		          <input type="hidden" name="gcode" value="${vo.gcode }">
		          <input type="submit" value="구매" class="btn mr5" style="float: left; margin-bottom:5px; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
		        </form>
			  </td>
		    </tr>
		    <c:set var= "total" value="${total + vo.gprice}"/>
		    </c:forEach>
		</table >
      </div>
		<!-- 장바구니 합계 -->
		<h1 style="text-align: center;">장바구니 합계</h1>
		<table  style="width: 100%"class="table02">
		  <tr>
		  <th>합계</th>
		  <td style="text-align: center"> <c:out value="${total}"/>원</td>
		  </tr>
		</table>
	    
		<div class="btn_right mt15"> 
		  <form action="${pageContext.request.contextPath }/goods/goodslist">
		    <input type="hidden" name="id" value="test">
  			<input type="submit" value="상품목록" class="btn mr5" style="float: right; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
		  <form action="${pageContext.request.contextPath }/purchase/purchaselist">
		    <input type="hidden" name="id" value="test1">
		    <input type="submit" value="구매목록" class="btn mr5" style="float: right; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
		  <form action="${pageContext.request.contextPath }/home">
		    <input type="hidden" name="id" value="test1">
		    <input type="submit" value="메인으로" class="btn mr5" style="float: left; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
		</div>
    </div>
  </div>
</div>
<script type="text/javascript">
   function check(money,gprice){
   	if(gprice>money){
   		alert('금액 부족함');
   		return false;
   	}else{
   		return true;
   	}
  } 
 </script>
</body>
</html>