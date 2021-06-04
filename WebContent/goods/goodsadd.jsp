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
<h1>GOODS 추가</h1>
<form action="${pageContext.request.contextPath }/goods/insert" method="post" enctype="multipart/form-data">
	상품코드 <input type="text" name="gcode"><br>
	상품가격 <input type="text" name="gprice"><br>
	상품이름 <input type="text" name="gname"><br>
	카테코리 <input type="text" name="gcategory"><br>
	첨부파일<br>
	<input type="file" name="gsaveimg" ><br>
	<input type="submit" value="등록">
</form>
</body>
</html>