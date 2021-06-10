<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
     <div class="inner">
       <h2>환불</h2>
		<table style="width: 100%"class="table02">
		  <tr>
		    <th>ID</th>
		    <th>환불 상태</th>
		    <th>구매번호</th>
		    <th>환불 날짜</th>
		  </tr>
		  <c:forEach var="vo" items="${refundlist}">
		    <tr>
		      <td>${vo.id }</td>
		      <td>${vo.refstate }</td>
		      <td>${vo.purnum }</td>
		      <td>${vo.regdate }</td>
		    </tr>
		  </c:forEach>
		</table>
		<div class="btn_right mt15"> 
		  <form action="${pageContext.request.contextPath }/goods/goodslist">
		    <input type="hidden" name="id" value="test">
  			<input type="submit" value="상품목록" class="btn mr5" style="float: rigth; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
		</div>
    </div>
  </div>
</div>
</body>
</html>