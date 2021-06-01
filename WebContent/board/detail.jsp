<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>

</head>
<body>
<div id="wrap">
<div id="top">
	<table style="width:70%">
		<tbody id="tbody">		<tr>
		
			<td style="width: 50px; font-size: 20px" class = "table.table01">${param.rnum }<span class="t_red"> *</span></td>
			<td style="width: 250px;"class = "table.table01">${param.btitle }<span class="t_red"> *</span></td>
			<td style="font-size: 13px;text-align: right"class = "table.table01">${param.regdate}</td>
			
		</tr>
		<tr>
		<th></th>
		</tr>
		</tbody>
		
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