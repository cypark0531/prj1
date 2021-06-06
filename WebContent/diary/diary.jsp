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
	<option id = "y${i }">${i } </option>
	</c:forEach>
	</select>
	
	월 : <select id= "month">
		<c:forEach var ="i" begin="1" end = "12">
	<option id = "m${i }">${i } </option>
	</c:forEach>
		</select>
	<br>
		
	<c:forEach var= "j" begin = "1" end = "2">
	<table>
		<tr>
		<c:forEach var = "i" begin = "1" end = "16">
		<c:choose>
			<c:when test="${j==2 }">
			<td><div class = "day" id= "d${i+16}"></div></td>
			</c:when>
			<c:otherwise>
			<td><div class = "day" id= "d${i}"></div></td>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		</tr>
	</table>
	</c:forEach>
	<script type="text/javascript">
	let days = document.getElementsByClassName("day");
	for(let i =0;i<days.length;i++){
		let k = i+1;
		let a = days[i].id;
		days[i].innerHTML = "<a href = 'javascript:content("+a+");'>"+k+"</a>";
		
	}
		for(let i=0;i<${param.lastDay};i++){
		let year = document.getElementById("year");
		console.log(year);
		year.value = ${param.year};
		let month = document.getElementById("month");
		year.value = ${param.month};
		}
		var year = document.getElementById("y${param.year}");
		var month = document.getElementById("m${param.month}");
		var day = document.getElementById("d${param.day}");
		year.selected = "selected";
		month.selected= "selected";
		function content(a){
			let year = document.getElementById("year").value;
			let month = document.getElementById("month").value;
			console.log(a)
		}
		
	</script>
</body>
</html>