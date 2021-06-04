<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
</head>
<body>
<h1>GOODS</h1>
<form action="${pageContext.request.contextPath }/purchase/purchaselist">
  <input type="hidden" name="id" value="test5">
  <input type="submit" value="구매목록">
</form>
  <form action="${pageContext.request.contextPath }/goods/goodsadd.jsp">
  <input type="submit" value="상품추가">
</form>
<form action="${pageContext.request.contextPath }/goods/goodslist">
  <input type="submit" value="상품목록">
</form>
<form action="${pageContext.request.contextPath }/goods/goodslist">
  <input type="hidden" name="id" value="test5">
  <input type="submit" value="장바구니">
</form>
</body>
</html>