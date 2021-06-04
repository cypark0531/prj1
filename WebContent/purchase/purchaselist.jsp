<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="500">
  <tr>
    <th>구매번호</th>
    <th>ID</th>
    <th>상품코드</th>
    <th>구입한 날짜</th>
  </tr>
  <c:forEach var="vo" items="${list}">
    <tr>
      <td>${vo.purnum }</td>
      <td>${vo.id }</td>
      <td>${vo.gcode }</td>
      <td>${vo.regdate }</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>