<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:auto}
#wrap{width :500px;border: 1px solid gray ;padding-top: 20px}
</style>

</head>
<body>
	<div id = "wrap">
	<div style="text-align: center">
	<span style="font-size: 20px;">글 작성</span><br><br>
	</div>
	<form action = "${pageContext.request.contextPath }/board/insert" method="get">
	<div style="width: 400px;height: 50px;">
	제목 :&nbsp;&nbsp;<input type = "text" name = "btitle" style="width:290px"><br>
	</div>
	<div style="width: 400px;height: 300;">내용 :</div>	
	<div style="width: 400px;height: 300; text-align: center">
		<textarea name = "bcontent" rows="10" cols="40"></textarea>
	</div>
	<div style="width: 400px;height: 50px;text-align: right">
	<br>
	<select name= "bopen">
		<option value= "1">비공개</option>
		<option value= "2">일촌공개</option>
		<option value= "3">전체공개</option>
	</select>
	<input type= "submit" value= "글쓰기">
	</div>
	<input type= "hidden" name = "id" value= "${param.id}">
	<input type= "hidden" name = "gid" value= "${param.gid}">
	</form>
	</div>
	
	
</body>
</html>