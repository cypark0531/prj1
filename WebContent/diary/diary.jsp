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
	<table>
		<tr>
		<c:forEach var = "i" begin = "1" end = "16">
		<td><div class = "day" id= "d${i}"></div></td>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach var = "i" begin = "17" end = "${param.lastDay }">
		<td><div class = "day" id= "d${i}"></div></td>
		</c:forEach>
		</tr>
		</table>
		
	
	<script type="text/javascript">
	
	let days = document.getElementsByClassName("day");
	for(let i =0;i<days.length;i++){
		let k = i+1;
		days[i].innerHTML = "<a href = 'javascript:content("+k+");'>"+k+"</a>";
		console.log(days[i].id);
		
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
		var xhr = null;
		function content(k){
			console.log(k);
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4&&xhr.status==200){
					
				}
			}
			xhr.open("get","${pageContext.request.contextPath}/diary/list?id=${param.id}&year=${param.year}&month=${param.month}&date="+k)
			xhr.send();
			
		}
		
	</script>
</body>
</html>