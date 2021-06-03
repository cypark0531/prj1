<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin:0px; padding:0px;}
#cal, #cal td, #cal th {  border: 1px solid #ddd;text-align: left;}
#cal {border-collapse:collapse; width: 100%;}
#cal th {text-align: center;}
#cal td {height: 40px; margin:0px; padding:0px;}


#sche th{width:112px;}
#sche th input{width:100%; height:100%;}
#sche td{width:470px;}
#sche td input{margin-left:4px; width:100%; height:100%;}
</style>
</head>
<body>
<div style="width:600px; height: 500px; border:1px solid gray">
	<div style="margin-left:35%;">
		<input type="button" id="prevmonth" value="<<">
		<span style="font-size: large;">${year }년 ${month }월</span>
		<input type="button" id="nextmonth" value=">>">
	</div>
	<div style="height:337px;">
	<table id="cal">
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
						<div style="width:84px; height:20px">
							<c:if test="${array.scheNum!=0 }">
								<c:out value="일정: ${array.scheNum }"/>
							</c:if>
						</div>
						</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${ array.num%7==6}"></tr></c:if>
	</table>
	</div>
	<table id="sche">
	<tr><th><input type="time"></th><td><input></td></tr>
	<tr><th><input type="time"></th><td><input></td></tr>
	<tr><th><input type="time"></th><td><input></td></tr>
	<tr><th><input type="time"></th><td><input></td></tr>
	</table>
	<div style="margin-left:83%;">
	<input style="padding-left:6px; padding-right:6px;" type="button" value="저장" id="savebtn">
	<input style="padding-left:6px; padding-right:6px;" type="button" value="취소" id="cancelbtn">
	</div>
</div>
</body>
<script type="text/javascript">
	var calrow=document.getElementsByClassName("calrow");
	var td=document.getElementsByClassName("td");
	var prevmonth=document.getElementById("prevmonth");
	var nextmonth=document.getElementById("nextmonth");

	function getdata(){
		var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==5&&xhr.status==200){
				
			}
		};
		xhr.open('get','getdata',true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		let params="year="+${year}+"&month="+${month}+"&arr"+${arr};
		xhr.send();
	}
	

	
	for(let i=0;i<td.length;i++){
			
		td[i].onclick=function(){
			for(let j=0;j<calrow.length;j++){
				let child=calrow[j].children;
				for(let n=0;n<child.length;n++){
					child[n].style="height:40px";				
					child[n].childNodes[1].style="background-color:silver;";
					child[n].childNodes[3].style="width:84px; height:20px;";
					child[n].childNodes[3].innerHTML="";

				}
			}
			let tr=td[i].parentElement;
			let tds=tr.children;
			for(let j=0;j<tds.length;j++){
				tds[j].style="height:104px";
				tds[j].childNodes[3].style="width:84px; height:80px;";
				tds[j].childNodes[3].innerHTML="";

			}
			td[i].childNodes[1].style="background-color:#FAED7D;";
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