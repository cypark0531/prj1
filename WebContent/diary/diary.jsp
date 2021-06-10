<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	
	#wrap{
		margin-left: 1em;
		width: 400px;
		height: 400px;
		margin-left: 
		
	 }
	 #year {
	 	color: black; 
	 	font-weight: 900;

	 }
	 

	 
	
</style>
<script type="text/javascript">
		
	</script>
</head>
<body>


	<div id="wrap" >
	<span id="yt" style="margin-left: 4em;">년도 :</span>
	<select id = "year">
	<c:forEach var ="i" begin="1990" end = "${param.realYear }">
	<option id = "y${i }">${i } </option>
	</c:forEach>
	</select>
	<span id="mt" style="margin-left: 1em;">월 :</span>
	<select id= "month"  >
		<c:forEach var ="i" begin="1" end = "12">
	<option id = "m${i }">${i } </option>
	</c:forEach>
		</select>
		<input type= "button" value= "선택" onclick="change()">
	<br>
	<table style="border-bottom: none; border-top: none;">
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
		<input type= "text"  id = "insertContent" style="color: black;">
		<input type= "button" value= "글쓰기" id = "btnn">
		
		</div>
	
		<div id = "pageDiv" style="display: inline-flex; margin-left: 10em; border:0;">
		${param.id}
		</div>
	
	</div>
	<script type="text/javascript">
	
	let days = document.getElementsByClassName("day");
	for(let i =0;i<days.length;i++){
		let k = i+1;

		days[i].innerHTML = "<a style='font-weight:600; font-size:20px; border-top: none;' href = 'javascript:content("+k+");'>"+k+"</a>";


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
		
		function content(k,pageNum){
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
						newInput1.addEventListener('click', function(e) {
							console.log(dnum)
							ddelete(dnum);
						});
						
						newTd2.appendChild(newInput1);
						newTd1.innerHTML = dcontent;
						newTd1.style.width = "250px";
						newTr.appendChild(newTd1)
						newTr.appendChild(newTd2)
						newTable.appendChild(newTr);
						main.appendChild(newTable);
					}
						/* 
						pw.print("<page>");
						pw.print("<pageNum>"+pageNum+"</pageNum>");
						pw.print("<startPageNum>"+startPageNum+"</startPageNum>");
						pw.print("<endPageNum>"+endPageNum+"</endPageNum>");
						pw.print("<startRow>"+startRow+"</startRow>");
						pw.print("<endRow>"+endRow+"</endRow>");
						pw.print("</page>");
						*/
						let pageNum = xml.getElementsByTagName("pageNum")[0].textContent;
						let startPageNum = xml.getElementsByTagName("startPageNum")[0].textContent;
						let endPageNum = xml.getElementsByTagName("endPageNum")[0].textContent; 
						let startRow = xml.getElementsByTagName("startRow")[0].textContent; 
						let endRow = xml.getElementsByTagName("endRow")[0].textContent;
						console.log(startPageNum)
						console.log(endPageNum);
						let str = "";
						pageDiv = document.getElementById("pageDiv");
						for(let i=startPageNum;i<=endPageNum;i++){
							if(pageNum==i){
								str = str +"<a style='border-top:none';  href = 'javascript:content("+k+","+i+")' >" +"<span style='color:black;font-weight: 700; font-size:15pt; border-top: none;'>"+[i] +"</span>"+"</a>";
								
							}else{
								str = str +"<a style='border-top:none'; href = 'javascript:content("+k+","+i+")'>" +"<span style='color:gray;font-weight: 700; font-size:15pt; border-top: none;'>"+[i] +"</span>"+"</a>";
								
							}
						}
						console.log(str);
						pageDiv.innerHTML = str;
						console.log(pageDiv);
						
					}
				}
			
			xhr.open("get","${pageContext.request.contextPath}/diary/list?gid=${param.gid}&id=${param.id}&year=${param.year}&month=${param.month}&date="+k+"&pageNum="+pageNum)
			xhr.send();
			
		}
		
		content(${param.day},1)
		
		function reload(){
			let div = document.getElementById("main");
			let childs = div.childNodes;
			for(let i=childs.length-1;i>=0;i--){
				div.removeChild(childs.item(i))
		}
		}
		var xhr1 = null;
		var btnn = document.getElementById("btnn");
		btnn.onclick = function(){
			let insertContent = document.getElementById("insertContent").value;
			location.href = "${pageContext.request.contextPath}/diary/insert?id=${param.id}&gid=${param.gid}&dcontent="+insertContent;
				
			};
		function ddelete(dnum){
			console.log("${pageContext.request.contextPath}/diary/delete?id=${param.id}&gid=${param.gid}&dnum="+dnum)
			location.href = "${pageContext.request.contextPath}/diary/delete?id=${param.id}&gid=${param.gid}&dnum="+dnum;
			
		}
		
			
	
			
		
	</script>
	
</body>
</html>