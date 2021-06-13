<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
	

	#all {
		margin: 0;
		position: relative;
		width: 360px;
		height: 500px;
		border-style: double;
		border-color: #566574;
		overflow: scroll;

	}
	
	#all::-webkit-scrollbar {
    display: none;
	}

	
	

	.ftable {

		
		
	}	
	
	.ftd {
		font-family: 'Nanum Pen Script', cursive;
		border-right: 1px dotted black;
		color: black;

		width: 50px;
	}
	


</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>

</head>
<body>
<div id = "all">
	<h1>Friend Talk Talk </h1>
	
	
</div>
<c:if test="${sessionScope.id!=sessionScope.gid }">
<div> <input style=" border: 3px solid  #566574; border-radius:10%;  color:black; " type= "text" id = "inputContent" maxlength="15" oninput="limitText(this)"> <input type= "button" value = "INPUT" onclick="fsinsert(0)" style="border: 3px solid  #566574; color:white; background-color:#566574;font-size:15px; font-family: Consolas,Monaco;">
</div>
</c:if>	
<br>
<div id = "pageDiv">

</div>
<script type="text/javascript">


function limitText(e) {
	
	if(e.maxLength==e.value.length ) {
		alert("15자 이하로 적어주세요!");
		e.value = e.value.slice(0,e.maxLength);
}
}








var flag =true;
function list(pageNum){
	var spageNum = pageNum
	reload();
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			let xml = xhr.responseXML;
			length = xml.getElementsByTagName("fsnum").length;
			let all = document.getElementById("all");
			for(let i=0;i<length;i++){
				let fsnum = xml.getElementsByTagName("fsnum")[i].textContent;
				let fsgroup = xml.getElementsByTagName("fsgroup")[i].textContent;
				let fscontent = xml.getElementsByTagName("fscontent")[i].textContent;
				let gid = xml.getElementsByTagName("gid")[i].textContent;
				//let id = xml.getElementsByTagName("id")[i].textContent;
				let newDiv = document.createElement("div");
				newDiv.id = "reply"+fsgroup;
				let newTable = document.createElement("table");
				newTable.className = "ftable"
				let newTr = document.createElement("tr");
				newTr.className = "ftr"
				let newTd1 = document.createElement("td"); //일촌 이름
				let newTd2 = document.createElement("td");//내용
				let newTd3 = document.createElement("td"); // 삭제
				let newTd4 = document.createElement("td")// 삭제
				newTd1.className = "ftd";
				newTd2.className = "ftd";
				newTd3.className = "ftd";
				newTd4.className = "ftd";
				newTd1.style.width = "100px";
				newTd1.style.fontSize = "20px";
				newTd2.style.width = "600px";
				newTd2.style.fontSize = "20px";
				newTd3.style.fontSize = "20px";
				newTd4.style.fontSize = "20px";
				newTd3.style.width = "35px";
				newTd4.style.width = "35px";
				
				
				newTd3.innerHTML = "<a href = 'javascript:reply("+fsgroup+","+spageNum+")'><span id = 'span"+fsgroup+"' style='color:black;font-weight: 900'><img src='${pageContext.request.contextPath }/friendsay/down.png'></span>"+"</a>";
				newTd1.innerHTML = gid
				newTd2.innerHTML = fscontent

				newTd4.innerHTML = "<a href = 'javascript:fsredelete2("+fsgroup+")'><img src='${pageContext.request.contextPath }/friendsay/close.png'></a>";
				newTd4.onclick = fsdelete(fsgroup);
				
				newTr.appendChild(newTd1);
				newTr.appendChild(newTd2);
				newTr.appendChild(newTd3);
				if(${sessionScope.id==sessionScope.gid}){
				newTr.appendChild(newTd4);
				}					
				newTable.appendChild(newTr);
				all.appendChild(newTable);
				all.appendChild(newDiv);
				
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
				
				let pageNum = xml.getElementsByTagName("pageNum")[0].textContent;//페이지번호 넘겨야해서 열로 가져옴
				let startPageNum = xml.getElementsByTagName("startPageNum")[0].textContent;
				let endPageNum = xml.getElementsByTagName("endPageNum")[0].textContent; 
				let startRow = xml.getElementsByTagName("startRow")[0].textContent; 
				let endRow = xml.getElementsByTagName("endRow")[0].textContent;
				let str = "";
				pageDiv = document.getElementById("pageDiv");
				for(let i=startPageNum;i<=endPageNum;i++){
					if(pageNum==i){
						str = str +"<a href = 'javascript:list("+i+")'>"+"<span style='color:black;font-weight: 900'>"+[i] +"</span>"+"</a>";
					}else{
						str = str +"<a href = 'javascript:list("+i+")'>"+"<span style='color:gray;font-weight: 900'>"+[i] +"</span>"+"</a>";
						
					}
				}
				pageDiv.innerHTML = str;
				
				
			
		}
	}
	xhr.open("get","${pageContext.request.contextPath}/friendsay/list?id=${param.id}&pageNum="+pageNum)
	xhr.send();
	
}
	console.log(${pageNum});
	if(${!empty param.pageNum}){
	var pgnum = ${param.pagenum}+"";
	list(${param.pageNum});
	}else{
		var pgnum = 1;
		list(1);
	}
	

function reload(){
	let div = document.getElementById("all");
	let childs = div.childNodes;
	for(let i=childs.length-1;i>=0;i--){
		div.removeChild(childs.item(i))
	}
	}
function rereload(fsgroup){
	console.log(fsgroup);
	let div = document.getElementById("reply"+fsgroup);
	console.log(div)
	let childs = div.childNodes;
	for(let i=childs.length-1;i>=0;i--){
		div.removeChild(childs.item(i))
	}
	}
	
	
function fsdelete(fsnum){
}
var xhr1 = null;
function reply(fsgroup){
	if(flag){
			let reply = document.getElementById("reply"+fsgroup);
			let span = document.getElementById("span"+fsgroup);
		
		xhr1 = new XMLHttpRequest();
		xhr1.onreadystatechange= function(){
		if(xhr1.readyState==4&&xhr1.status==200){
			let xml1 = xhr1.responseXML;
			let renewTable = document.createElement("table");
			reply.appendChild(renewTable);
			length = xml1.getElementsByTagName("refsnum").length
			for(let i=0;i<length;i++){
				let refsnum = xml1.getElementsByTagName("refsnum")[i].textContent;
				let refsgroup = xml1.getElementsByTagName("refsgroup")[i].textContent;
				let refscontent = xml1.getElementsByTagName("refscontent")[i].textContent;
				let regid = xml1.getElementsByTagName("regid")[i].textContent;
				console.log(refscontent)
				let renewTr = document.createElement("tr");
				let renewTd1 = document.createElement("td");
				let renewTd2 = document.createElement("td");
				let renewTd3 = document.createElement("td");
				let renewTd4 = document.createElement("td");
				renewTd1.innerHTML = " >"
				renewTd2.innerHTML = regid;
				renewTd3.innerHTML = refscontent;
				renewTd4.innerHTML = "<a href = 'javascript:fsredelete("+refsnum+")'>삭제</a>";
				
				renewTr.appendChild(renewTd1);
				renewTr.appendChild(renewTd2);
				renewTr.appendChild(renewTd3);
				renewTr.appendChild(renewTd4);
				renewTable.appendChild(renewTr);
			}
				let renewDiv = document.createElement("div");
				let reinput1 = document.createElement("input");
				reinput1.type = "text";
				reinput1.id = "inputContent2";
				let reinput2 = document.createElement("input");
				reinput2.type = "button";
				reinput2.onclick = function (){
					fsinsert(fsgroup);
				}
				reinput2.value = "입력"
				renewDiv.appendChild(reinput1);
				renewDiv.appendChild(reinput2);
				reply.appendChild(renewDiv);
				console.log(renewDiv)
			}
			}
				xhr1.open("get","${pageContext.request.contextPath}/friendsay/replylist?fsgroup="+fsgroup+"&pageNum=${param.pageNum}",true)
				xhr1.send();
				span.innerHTML = "<img src='${pageContext.request.contextPath }/friendsay/up.png'>";
			flag = false;
			}else{
				let reply = document.getElementById("reply"+fsgroup);
				let span = document.getElementById("span"+fsgroup);
				let childs = reply.childNodes;
				for(let i=childs.length-1;i>=0;i--){
					reply.removeChild(childs.item(i))
					span.innerHTML = "<img src='${pageContext.request.contextPath }/friendsay/down.png'>";
					flag = true;
					}
				}
	}
function fsredelete(fsnum){
	location.href = "${pageContext.request.contextPath}/friendsay/delete?fsnum="+fsnum;
}
function fsredelete2(fsgroup){
	location.href = "${pageContext.request.contextPath}/friendsay/delete?fsgroup="+fsgroup;
}
function fsinsert(num){
		inputContent = null;
	if(num == 0){
		inputContent = document.getElementById("inputContent").value;
	location.href = "${pageContext.request.contextPath}/friendsay/insert?inputContent="+inputContent+"&fsgroup=0";
	}else{
		inputContent = document.getElementById("inputContent2").value;
		location.href = "${pageContext.request.contextPath}/friendsay/insert?inputContent="+inputContent+"&fsgroup="+num;
	}
}

</script>
</body>
