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
body{background-color: black;}
#cal, #cal td, #cal th {  border: 1px solid #ddd;text-align: left;}
#cal {border-collapse:collapse; width: 100%;}
#cal th {text-align: center; color:white;}
#cal td {height: 40px; margin:0px; padding:0px;}


#sche th{width:112px;}
#sche th input{width:100%; height:100%;}
#sche td{width:470px;}
#sche td input{margin-left:4px; width:370px; height:100%;}
</style>
</head>
<body>
<div id="wrap" style="margin:auto; margin-top:100px; padding: 100px 60px 100px 60px; width:800px; border-color: white; border-style: dotted;">
<div style="width:600px; height: 500px; border:1px solid gray; margin:auto;">
	<div style="margin-left:35%; color:white;">
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
				<input type="hidden" class="arrsche" value="${array.sche }">
				<c:choose>
					<c:when test="${array.day==-1 }">
						<td>
						<div style="width:100%; height:20px"></div>
						<div class="disp" style="width:100%; height:20px"></div>
						</td>
					</c:when>
					<c:otherwise>
						<td class="td">
						<div style="background-color: silver; width:100%; height:20px">
							<c:out value="${array.day}"/>
						</div>
						<div class="disp" style="width:84px; height:20px; color:white;">
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
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td><td><select class="open"><option value="1">전체공개</option><option value="2">일촌공개</option><option value="3">비공개</option></select></td></tr>
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td><td><select class="open"><option value="1">전체공개</option><option value="2">일촌공개</option><option value="3">비공개</option></select></td></tr>
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td><td><select class="open"><option value="1">전체공개</option><option value="2">일촌공개</option><option value="3">비공개</option></select></td></tr>
	<tr><th><input type="time" class="time"></th><td><input class="schedule"></td><td><select class="open"><option value="1">전체공개</option><option value="2">일촌공개</option><option value="3">비공개</option></select></td></tr>
	</table>
	<div style="margin-left:83%;">
	<input style="padding-left:6px; padding-right:6px;" type="button" value="저장" id="savebtn">
	<input style="padding-left:6px; padding-right:6px;" type="button" value="취소" id="cancelbtn">
	</div>
</div>
</div>
</body>
<script type="text/javascript">
	var cal=document.getElementById("cal");
	var calrow=document.getElementsByClassName("calrow");
	var td=document.getElementsByClassName("td");
	var disp=document.getElementsByClassName("disp");
	var prevmonth=document.getElementById("prevmonth");
	var nextmonth=document.getElementById("nextmonth");
	
	var arrday=document.getElementsByClassName("arrday");
	var arrschenum=document.getElementsByClassName("arrschenum");
	var arrsche=document.getElementsByClassName("arrsche");
	var arrnum=[-1,-1,-1,-1];
	var currday=-1;
	
	var time=document.getElementsByClassName("time");
	var schedule=document.getElementsByClassName("schedule");
	var open=document.getElementsByClassName("open");
	
	var savebtn=document.getElementById("savebtn");
	var cancelbtn=document.getElementById("cancelbtn");
	
	if("${requestScope.host}"!="${sessionScope.id}"){
		savebtn.disabled="disabled";
		for(let i=0;i<4;i++){
			arrday[i].readonly="readonly";
			schedule[i].readonly="readonly";
			open[i].disabled="disabled";
		}
	}
	
	for(let i=0;i<td.length;i++){			
		td[i].onclick=function(){
			for(let j=0;j<calrow.length;j++){
				let child=calrow[j].children;
				for(let n=3;n<child.length;n+=4 ){
					child[n].style="height:40px";				
					child[n].childNodes[1].style="background-color:silver; color:white;";
					child[n].childNodes[3].style="width:84px; height:20px; color:white;";					
				}
			}
			let tr=td[i].parentElement;
			let tds=tr.children;
			for(let j=3;j<tds.length;j+=4){
				tds[j].style="height:104px";
				tds[j].childNodes[3].style="width:84px; height:80px; color:white;";
			}
			
			td[i].childNodes[1].style="background-color:#FAED7D; color:white;";
			currday=i;
			
			let day=0;
			let num=0;
			for(let j=0;j<42;j++){
				for(let n=0;n<42;n++)if(arrday[n].value==td[i].childNodes[1].textContent.trim()){num=n;}
				if(arrschenum[j].value==-1)continue;
				if(Math.floor(num/7)==Math.floor(j/7) && arrsche[j].value!=null){                      
					let a=arrsche[j].value;
					let as= a.substring(1, a.length-1).split(","); 
					let text="";
					for(let n=0;n<as.length;n++){		                     
						as[n]=as[n].trim();
						if(as[n]!=""){						
							let xhr= new XMLHttpRequest();
							xhr.onreadystatechange=function(){
								if(xhr.readyState==4 &&xhr.status==200){
									let text1=xhr.responseXML.getElementsByTagName("time")[0].textContent;
									let text2=xhr.responseXML.getElementsByTagName("text")[0].textContent;
									let text3=xhr.responseXML.getElementsByTagName("open")[0].textContent;
									text+=text1+" "+text2.substr(0, 2)+"..<br>";									
									disp[j].innerHTML=text;
										
								}
							}
							xhr.open('get','${pageContext.request.contextPath}/scheduler/getdata?sche='+as[n],true);
							xhr.send();
						}
					}						
					
				}else{
					
					if(arrschenum[j].value=="0"){
						td[day].childNodes[3].innerHTML="";
					}else{
						td[day].childNodes[3].innerHTML="일정: "+arrschenum[j].value;
					}
				}
				day++;
			}						
					
			for(let n=0;n<42;n++){
				if(arrday[n].value==td[i].childNodes[1].textContent.trim()){
					let a=arrsche[n].value;
					a=a.substring(1, a.length-1);
					let as=a.split(",");
					for(let j=0;j<as.length;j++){
						as[j]=as[j].trim();

						if(as[j]!="" && as[j]!=null){
							let xhr= new XMLHttpRequest();
							xhr.onreadystatechange=function(){
								if(xhr.readyState==4 &&xhr.status==200){
									let text1=xhr.responseXML.getElementsByTagName("time")[0].textContent;
									let text2=xhr.responseXML.getElementsByTagName("text")[0].textContent;
									let text3=xhr.responseXML.getElementsByTagName("open")[0].textContent;
									time[j].value=text1;
									schedule[j].value=text2;
									open[j].value=text3;
									arrnum[j]=as[j];
								}
							}
							xhr.open('get','${pageContext.request.contextPath}/scheduler/getdata?sche='+as[j],true);
							xhr.send();
							
						}						
					}
					for(let j=as.length-1;j<time.length;j++){
						time[j].value=null;
						schedule[j].value=null;
						open[j].value=null;
						arrnum[j]=-1;
					}
				}
			}
			
		}
	}
	
	prevmonth.onclick=function(){
		let year=${year};
		let month=${month}-2;
		location.replace("calendar?host=${host}&year="+year+"&month="+month);
	}
	nextmonth.onclick=function(){
		let year=${year};
		let month=${month};
		location.replace("calendar?host=${host}&year="+year+"&month="+month);
	}
	savebtn.onclick=function(){
		for(let j=0;j<time.length;j++){
			let t=${year}+"-"+${month}+"-"+(currday+1)+","+time[j].value;
			console.log(arrnum[j]+" "+t+" "+schedule[j].value+open[j].value);
			if(arrnum[j]!=-1){
				let xhr=new XMLHttpRequest();
				xhr.onreadystatechange=function(){};
				xhr.open('get','${pageContext.request.contextPath}/scheduler/updatedata?schnum='+arrnum[j]+'&schcontent='+schedule[j].value+'&schopen='+open[j].value+'&schdate='+t,true);
				xhr.send();
			}else if(arrnum[j]==-1 && open[j].value!="" && schedule[j].value!=""&& open[j].value!=null && schedule[j].value!=null){
				let xhr=new XMLHttpRequest();
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4 && xhr.status==200)console.log(t);
				};				
				xhr.open('get','${pageContext.request.contextPath}/scheduler/setdata?schnum='+arrnum[j]+'&id='+"${sessionScope.id}"+'&schcontent='+schedule[j].value+'&schopen='+open[j].value+'&schdate='+t,true);
				xhr.send();
			}
			
		}
		location.replace("calendar?year="+${year}+"&month="+(${month}-1));
	}
	cancelbtn.onclick=function(){		
		
		for(let j=0;j<calrow.length;j++){
			let child=calrow[j].children;
			for(let n=3;n<child.length;n+=4 ){
				child[n].style="height:40px";				
				child[n].childNodes[1].style="background-color:silver;color:white;";
				child[n].childNodes[3].style="width:84px; height:20px;color:white;";					
				child[n].childNodes[3].innerHTML="";					
			}
		}
		
		let day=0;
		for(let j=0;j<42;j++){			
			if(arrschenum[j].value==-1)continue;
			if(arrschenum[j].value==0){
				console.log(arrschenum[j].value);
				td[day].childNodes[3].innerHTML="";
			}else{
				console.log(arrschenum[j].value);
				td[day].childNodes[3].innerHTML="일정: "+arrschenum[j].value;
			}
			day++;
		}
	}
</script>
</html>