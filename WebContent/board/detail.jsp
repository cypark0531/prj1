<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap{width: 400px;height: 400px; border : 1px solid red}
#top{width : 100%;height: 10%;background-color: pink; text-align: center;}
</style>
</head>
<body>
<div id="wrap">
<div id="top">
	<table>
		<tr>
			<td style="width: 50px; font-size: 20px">${param.rnum }</td>
			<td style="width: 250px;">${param.btitle }</td>
			<td style="font-size: 13px;text-align: right">${param.regdate}</td>
		
		</tr>
	</table>
</div>
<div id = "center">
	<div id="content">콘텐트 : ${param.bcontent }</div>
</div>
<div id="bottom">
댓글입니다
</div>	
</div>
</body>
</html>