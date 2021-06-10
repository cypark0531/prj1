<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<%
  String id = request.getParameter("id");
%>
</head>
<body>
<h1>GOODS</h1>
<form action="${pageContext.request.contextPath }/goods/goodsadd.jsp">
  <input type="submit" value="상품추가">
</form>
<form action="${pageContext.request.contextPath }/goods/goodslist">
  <input type="hidden" name="id" value="test1">
  <input type="submit" value="상품목록">
</form>
<form action="${pageContext.request.contextPath }/refund/refundlist">
  <input type="hidden" name="id" value="test1">
  <input type="submit" value="환불목록">
<!-- 
  환불에서 gprice값 얻어오기
  
  환불 상태를 업데이트해서 완료하기
  ex)환불안함 0 환불대기상태 1 환불완료 2
  환불 신청을 하면 환불신청(1) 리스트만들고 고객환불리스트는 환불대기생태로 저장 <-관리자만 들어갈수있음;
  관리자가 환불리스트에서 환불수락 누르면 고객환불리스트에 환불완료라고 업데이트(2)되게 만들고 money 추가;
  
  뮤직을 src로 저장하기
  
  보관함 목록 구현
 
-->
</form>
</body>
</html>