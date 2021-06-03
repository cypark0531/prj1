<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, td, th {  
  border: 1px solid #ddd;
  text-align: left;
}

table {border-collapse:collapse; width: 100%;}
th {text-align: center;}
td {height: 40px; margin:0px; padding:0px;}
</style>
</head>
<body>
<div style="width:450px; height: 400px; border:1px solid gray">
	<div style="margin-left:30%;">
		<input type="button" id="prevmonth" value="<<">
		<span style="font-size: large;">${year }년 ${month }월</span>
		<input type="button" id="nextmonth" value=">>">
	</div>
	<table>
		<tr>
			<th style="background-color: #F15F5F; color: white;" >일</th>
			<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
			<th style="background-color: #6799FF; color: white">토</th>
		</tr>		
			<c:forEach var="array" items="${requestScope.arr }">
			<c:if test="${array.num%7==0}"><tr class="calrow"></c:if>
				<c:choose>
					<c:when test="${array.day==-1 }">
						<td>
						<div style="width:100%; height:20px"></div>
						<div style="width:100%; height:20px"></div>
						</td>
					</c:when>
					<c:otherwise>
						<td class="td">
						<div style="background-color: silver; width:100%; height:20px">
							<c:out value="${array.day}"/>
						</div>
						<div style="width:100%; height:20px">
							<c:out value="${array.sche }"/>
						</div>
						</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${ array.num%7==6}"></tr></c:if>
	</table>
	<input type="button" id="savebtn" value="저장">
	<input type="button" id="cancelbtn" value="취소">
</div>
</body>
<script type="text/javascript">
	var calrow=document.getElementsByClassName("calrow");
	var cancelbtn=document.getElementById("cancelbtn");
	var td=document.getElementsByClassName("td");
	var prevmonth=document.getElementById("prevmonth");
	var nextmonth=document.getElementById("nextmonth");
	
	for(let i=0;i<td.length;i++){
		td[i].onclick=function(){

			for(let j=0;j<calrow.length;j++){
				let child=calrow[j].children;
				for(let n=0;n<child.length;n++){
					child[n].style="height:40px";
					child[n].childNodes[3].style="height:20px;";
				}
			}
			let tr=td[i].parentElement;
			let tds=tr.children;
			for(let j=0;j<tds.length;j++){
				tds[j].style="height:120px";
				tds[j].childNodes[3].style="height:100px;";

			}
		}
	}
	cancelbtn.onclick=function(){
		for(let j=0;j<calrow.length;j++){
			let child=calrow[j].children;
			for(let n=0;n<child.length;n++){
				child[n].style="height:40px";	
				child[n].childNodes[3].style="height:20px;";
			}
		}
	}
	prevmonth.onclick=function(){
		let year=${year};
		let month=${month}-2;
		location.replace("calendar?year="+year+"&month="+month);
	}
	nextmonth.onclick=function(){
		let year=${year};
		let month=${month};
		location.replace("calendar?year="+year+"&month="+month);
	}
</script>
</html>