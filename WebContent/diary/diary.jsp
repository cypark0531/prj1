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
	년도 : <select id = "year">
	<c:forEach var ="i" begin="1990" end = "${param.year }">
	<option id = "${i }">${i } </option>
	</c:forEach>
	</select>
	
	월 : <select id= "month">
		<c:forEach var ="i" begin="1" end = "12">
	<option id = "m${i }">${i } </option>
	</c:forEach>
		</select>
		
		
	<c:forEach var= "i" begin = "1" end = "2">
	<table>
		<tr>
		<c:forEach var = "i" begin = "1" end = "16">
		<td><div class = "day"></div></td>
		</c:forEach>
		</tr>
	</table>
	</c:forEach>
	<script type="text/javascript">
	let day = document.getElementsByClassName("day");
		for(let i=0;i<${param.lastDay};i++){
			day[i].innerHTML = i+1;
		let year = document.getElementById("year");
		year.value = ${param.year};
		let month = document.getElementById("month");
		year.value = ${param.month};
		}
		var year = document.getElementById("${param.year}");
		var month = document.getElementById("m${param.month}");
		year.selected = "selected"
		month.selected= "selected";
		
		console.log(year);
	</script>
</body>
</html>