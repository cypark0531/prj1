<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품목록</h1>
<table border="1" width="500">
  <tr>
    <th>상품이미지</th>
    <th>상품코드</th>
    <th>상품가격</th>
    <th>상품이름</th>
    <th>상품카테코리</th>
  </tr>
  <c:forEach var="vo" items="${goodslist }">
    <tr>
      <td><img alt="" src="${pageContext.request.contextPath }/goodsimgfile/${vo.gsaveimg}" width="100" height="100"></td>
      <td>${vo.gcode }</td>
      <td>${vo.gprice }</td>
      <td>${vo.gname }</td>
      <td>${vo.gcategory }</td>
    </tr>
  </c:forEach>
</table>

</body>
</html>