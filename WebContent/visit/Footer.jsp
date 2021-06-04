<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>하단 영역</title>
</head>
<body>
	<br>
        전체 투데이수 : <%=session.getAttribute("totalCount") %>
	<br>
	오늘 : <%=session.getAttribute("todayCount") %>
	<br>
</body>
</html>
