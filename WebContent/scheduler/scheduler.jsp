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
				<input type="hidden" class="arrday" value="${array.day }">
				<input type="hidden" class="arrschenum" value="${array.scheNum }">
				<input type="hidden" class="arrtext" value="${array.text }">
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
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td></tr>
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td></tr>
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td></tr>
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td></tr>
	</table>
	<div style="margin-left:83%;">
	<input style="padding-left:6px; padding-right:6px;" type="button" value="저장" id="savebtn">
	<input style="padding-left:6px; padding-right:6px;" type="button" value="취소" id="cancelbtn">
	</div>
</div>
</body>
<script type="text/javascript">
	var cal=document.getElementById("cal");
	var calrow=document.getElementsByClassName("calrow");
	var td=document.getElementsByClassName("td");
	var prevmonth=document.getElementById("prevmonth");
	var nextmonth=document.getElementById("nextmonth");
	
	var arrday=document.getElementsByClassName("arrday");
	var arrschenum=document.getElementsByClassName("arrschenum");
	var arrtext=document.getElementsByClassName("arrtext");
	
	var time=document.getElementsByClassName("time");
	var schedule=document.getElementsByClassName("schedule");
	
	var savebtn=document.getElementById("savebtn");
	var cancelbtn=document.getElementById("cancelbtn");
	
	for(let i=0;i<td.length;i++){
			
		td[i].onclick=function(){
			for(let j=0;j<calrow.length;j++){
				let child=calrow[j].children;
				for(let n=3;n<child.length;n+=4 ){
					child[n].style="height:40px";				
					child[n].childNodes[1].style="background-color:silver;";
					child[n].childNodes[3].style="width:84px; height:20px;";					
				}
			}
			let tr=td[i].parentElement;
			let tds=tr.children;
			for(let j=3;j<tds.length;j+=4){
				tds[j].style="height:104px";
				tds[j].childNodes[3].style="width:84px; height:80px;";
			}
			
			td[i].childNodes[1].style="background-color:#FAED7D;";
			
			let day=0;
			let num=0;
			for(let j=0;j<42;j++){
				for(let n=0;n<42;n++)if(arrday[n].value==td[i].childNodes[1].textContent.trim())num=n;
				if(arrschenum[j].value==-1)continue;
				if(Math.floor(num/7)==Math.floor(j/7) && arrtext[j].value!=""){
					let timesche=arrtext[j].value.split("<br>");
					let ts="";
					for(let n=0;n<timesche.length;n++){
						ts+=timesche[n].substring(0, 8)+"..<br>"
					}
					td[day].childNodes[3].innerHTML=ts.substr(0, ts.length-6);
				}else{
					
					if(arrschenum[j].value=="0"){
						//console.log(td[day].childNodes[1].textContent.trim());
						td[day].childNodes[3].innerHTML="";
					}else{
						td[day].childNodes[3].innerHTML="일정: "+arrschenum[j].value;
					}
				}
				day++;
			}						
					
			let timesche=arrtext[num].value.split("<br>");
			for(let j=0;j<timesche.length;j++){
				let ts=timesche[j].split(" ");
				let s="";
				for(let n=1;n<ts.length;n++){
					s+=ts[n]+" ";
				}
				time[j].value=ts[0];
				schedule[j].value=s;
				s="";
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
	savebtn.onclick=function(){
		
	}
	cancelbtn.onclick=function(){
		let day=0;
		let num=0;
		for(let j=0;j<42;j++){			
			if(arrschenum[j].value=="0"){
					//console.log(td[day].childNodes[1].textContent.trim());
				td[day].childNodes[3].innerHTML="";
			}else{
				td[day].childNodes[3].innerHTML="일정: "+arrschenum[j].value;
			}
		}
		day++;
		
		for(let j=0;j<time.length;j++){
			time[j].value=null;
			schedule[j].value=null;
		}
		for(let j=0;j<calrow.length;j++){
			let child=calrow[j].children;
			for(let n=3;n<child.length;n+=4 ){
				child[n].style="height:40px";				
				child[n].childNodes[1].style="background-color:silver;";
				child[n].childNodes[3].style="width:84px; height:20px;";					
				child[n].childNodes[3].innerHTML="";					
			}
		}
	}
</script>
</html>