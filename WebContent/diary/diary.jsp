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
	<div id="wrap" style="width: 400px;height: 400px; ">
	년도 : <select id = "year" style="color: black; font-weight: 900;">
	<c:forEach var ="i" begin="1990" end = "${param.realYear }">
	<option id = "y${i }">${i } </option>
	</c:forEach>
	</select>
	
	월 : <select id= "month" style="color: black; font-weight: 900;" >
		<c:forEach var ="i" begin="1" end = "12">
	<option id = "m${i }">${i } </option>
	</c:forEach>
		</select>
		<input type= "button" value= "선택" onclick="change()">
	<br>
	<table >
		<tr style="margin-left:30px; text-align: center;">
		<c:forEach var = "i" begin = "1" end = "16">
		<td><div class  = "day" id= "d${i}"></div></td>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach var = "i" begin = "17" end = "${param.lastDay }">
		<td><div class = "day" id= "d${i}"></div></td>
		</c:forEach>
		</tr>
		</table>
		
		<div id = "main">
		</div>
		<div>
		<input type= "button" value= "글쓰기" onclick='dinsert()'>
		
		</div>
	</div>
	<script type="text/javascript">
	
	let days = document.getElementsByClassName("day");
	for(let i =0;i<days.length;i++){
		let k = i+1;
		days[i].innerHTML = "<a style='font-size:20px;' href = 'javascript:content("+k+");'>"+k+"</a>";
		
	}
		for(let i=0;i<${param.lastDay};i++){
		let year = document.getElementById("year");
		year.value = ${param.year};
		let month = document.getElementById("month");
		year.value = ${param.month};
		}
		let year = document.getElementById("y${param.year}");
		let month = document.getElementById("m${param.month}");
		let day = document.getElementById("d${param.day}");
		year.selected = "selected";
		month.selected= "selected";
		var xhr = null;
		function change(){
			let year = document.getElementById("year").value;
			console.log(year)
			let month = document.getElementById("month").value;
			location.href = "${pageContext.request.contextPath}/home?year="+year+"&month="+month+"&id=${param.id}&gid=${param.gid}"
		}
		
		function content(k){
			reload();
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4&&xhr.status==200){
					xml = xhr.responseXML;
					length = xml.getElementsByTagName("dnum").length;
					let main = document.getElementById("main");
					for(let i=0;i<length;i++){
						let dnum = xml.getElementsByTagName("dnum")[i].textContent;
						let dcontent = xml.getElementsByTagName("dcontent")[i].textContent;
						let dopen = xml.getElementsByTagName("dopen")[i].textContent;
						
						newDiv = document.createElement("div");
						newTable = document.createElement("table");
						newTr = document.createElement("tr");
						newTd1 = document.createElement("td");
						newTd2 = document.createElement("td");
						newInput1 = document.createElement("input");
						newInput1.type= "button";
						newInput1.value= "삭제";
						newInput1.onclick = "ddelete("+dnum+")"
						
						newTd2.appendChild(newInput1);
						newTd1.innerHTML = dcontent;
						newTd1.style.width = "250px";
						newTr.appendChild(newTd1)
						newTr.appendChild(newTd2)
						newTable.appendChild(newTr);
						main.appendChild(newTable);
					}
					
				}
			}
			xhr.open("get","${pageContext.request.contextPath}/diary/list?gid=${param.gid}&id=${param.id}&year=${param.year}&month=${param.month}&date="+k)
			xhr.send();
			
		}
		content(${param.day})
		function reload(){
			let div = document.getElementById("main");
			let childs = div.childNodes;
			for(let i=childs.length-1;i>=0;i--){
				div.removeChild(childs.item(i))
		}
		}
		function dinsert(){
			location.href = "${pageContext.request.contextPath}/diary/insert?&id=${param.id}&gid=${param.gid}"
		}
		
	</script>
</body>
</html>