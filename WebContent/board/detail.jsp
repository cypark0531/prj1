<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css" />
<style type="text/css">
body{
		background-color: #121418;
	
	}
	#bottom::-webkit-scrollbar{display: none;}
</style>

</head>
<body>
	<div id="wrap" class="wrap" style=" padding: 60px 60px 60px 60px; border-style: dotted; width: 1000px; height: 700px; margin:65px auto">
		<div id="top" style="margin: 0 auto; width : 100%; height: 60%;">
		<h1 style=" margin-bottom: 10px; margin-top : 0; font-size: 30pt; text-shadow:#999999 5px 5px 5px; text-align: center">Board</h1>
			<table class="table02" style="width: 60%;height:70%;;margin: auto;">
				<tr style = "height: 15%">

					<td style="width: 50px; font-size: 20px">${param.rnum }</td>
					<td style="width: 250px;">${param.btitle }</td>
					<td style="font-size: 13px; text-align: right">${param.regdate}</td>

				</tr>
				<tr  style = "height: 70%">
					<td colspan="3" height="160px">${param.bcontent }</td>
				</tr>
				<c:if test="${param.id==param.gid }">
					<tr>
						<td colspan="3" class="btn_right"><input type="button"
							value="수정하기" class="btn black mr5" id="btn1" onclick="goUpdate()">
							<input type="button" value="삭제하기" class="btn black mr5" id="btn2"
							onclick="goDelete()"></td>
					</tr>
				</c:if>
			</table>
		</div>
		<div id="bottom" style="margin: 0 auto; width : 100%; height: 30% ;overflow: scroll;">
			<table style="margin :0 auto; width : 60%;">
				<tr>
					<td colspan="3" style="text-align: center" >REPLY</td>
				</tr>
				<tr>
					<td style="width:100px;text-align: center">ID</td>
					<td style="width:200px;text-align: center">CONTENT</td>
					<td style="width:100px;">DATE</td>
				</tr>
	
			</table>
			<div id="reply" style="margin :0 auto; width : 60%; "></div>
			<table style="margin: 0 auto;">
				<tr>
					<td colspan="3"><input type="text" placeholder="댓글을 입력하세요"
						id = "brcontent" name="brcontent" style="color: black;"> <input type="button" value="입력"id="brbtn1" onclick="replyinsert(0)"></td>
				</tr>
			</table>
		</div>
	<div id="pagen" style="padding-top: 100px; margin:0 auto; text-align: center">
	<c:if test="${startPageNum>10}">
		<a href="${pageContext.request.contextPath }/board/detail?pageNum=${startPagenum-1}">[이전]</a>
		</c:if>
	<c:forEach var ="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i}">
				<a href = "${pageContext.request.contextPath }/board/detail?pageNum=${i}&bnum=${param.bnum}&bcontent=${param.bcontent}&rnum=${param.rnum}&btitle=${param.btitle}&b=0"><span style="color:white;font-weight: 900">[${i}]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "${pageContext.request.contextPath }/board/detail?pageNum=${i}&bnum=${param.bnum}&bcontent=${param.bcontent}&rnum=${param.rnum}&btitle=${param.btitle}&b=0"><span style="color:gray">[${i}]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPagenum<pageCount}">
		<a href="${pageContext.request.contextPath }/board/list?pageNum=${endPageNum+1}">[다음]</a>
		</c:if>

</div>

	</div>
	
	
	<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	var btn2 = document.getElementById("btn2");
	var brbtn1 = document.getElementById("brbtn1");
	var xhr = null;
	var flag = true;
	function goUpdate(){
		location.href = "${pageContext.request.contextPath}/board/update?bnum=${param.bnum}";
	}
	function goDelete(){
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			location.href = "${pageContext.request.contextPath}/board/delete?bnum=${param.bnum}";
		 
		}else{
			return;
		}
	}
	function list(){
		let div = document.getElementById("reply");
		let childs = div.childNodes;
		for(let i=childs.length-1;i>=0;i--){
			div.removeChild(childs.item(i))
		}
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange= function(){
		if(xhr.readyState==4&&xhr.status==200){
			let replyDiv = document.getElementById("reply");
			var xml = xhr.responseXML;
			let brcontent = xml.getElementsByTagName("brcontent");
			for(let i = 0; i<brcontent.length;i++){
				let gid = xml.getElementsByTagName("gid")[i].textContent;
				let regdate = xml.getElementsByTagName("regdate")[i].textContent;
				let bgroup = xml.getElementsByTagName("bgroup")[i].textContent
				let brcon = brcontent[i].textContent;
				let newTable = document.createElement("table");
				newTable.style.margin ="0 auto";
				let newTr = document.createElement("tr");
				let newTd1 = document.createElement("td");
				let newTd2 = document.createElement("td");
				let newTd3 = document.createElement("td");
				let newTd4 = document.createElement("td");
				let newTd5 = document.createElement("td");
				let newDiv = document.createElement("div");
				
				newTd1.style.width = '100px';
				newTd2.style.width = '200px';
				newTd3.style.fontSize = '15px';
				newTd1.innerHTML = gid;
				newTd2.innerHTML = brcon;
				newTd3.innerHTML = regdate;
				newTd4.innerHTML = "<a href = 'javascript:replylist("+bgroup+")'><span id = 'span"+bgroup+"'>↓</span>"+"</a>";
				newTd5.innerHTML = "<input type= 'button' id = 'redelete' value= '삭제' onclick=redelete("+bgroup+")>";
				newDiv.id = "replyDiv"+bgroup;
				newTr.appendChild(newTd1);
				newTr.appendChild(newTd2);
				newTr.appendChild(newTd3);
				newTr.appendChild(newTd4);
				newTr.appendChild(newTd5);
				newTable.appendChild(newTr);
				replyDiv.appendChild(newTable);
				replyDiv.appendChild(newDiv);
			}
		}
	}
		xhr.open("get","${pageContext.request.contextPath}/boardreply/list?bnum=${param.bnum}&pageNum=${requestScope.pageNum}",true);
		xhr.send();
	}
	
	window.onload= function(e){
		list();
	}
	function redelete(bgroup){
		
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			
			location.href = "${pageContext.request.contextPath}/boardreply/delete?bgroup="+bgroup+
					"&bnum=${param.bnum}&rnum=${param.rnum}"+
					"&regdate=${param.regdate}&btitle=${param.btitle}&bcontent=${param.bcontent}";
		}else{
		 return;
		}
	}
function reredelete(brnum,bgroup){
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			
			location.href = "${pageContext.request.contextPath}/boardreply/redelete?brnum="+brnum+"&bgroup="+bgroup+
			"&bnum=${param.bnum}&rnum=${param.rnum}"+
					"&regdate=${param.regdate}&btitle=${param.btitle}&bcontent=${param.bcontent}";
		}else{
		 return;
		}
}
	var xhr1 = null;
	function replylist(bgroup){
		if(flag){
			let replyDiv1 = document.getElementById("replyDiv"+bgroup);
			replyDiv1.style.marginLeft = '100px';
			xhr1 = new XMLHttpRequest();
			xhr1.onreadystatechange = function(){
			if(xhr1.readyState==4&&xhr1.status==200){
				var xml = xhr1.responseXML;
						
				let newTable = document.createElement("table");
				let length = xml.getElementsByTagName("brnum").length
				for(let i=0;i<length;i++){
					let newTr = document.createElement("tr");
					let newTd1 = document.createElement("td");
					let newTd2 = document.createElement("td");
					let newTd3 = document.createElement("td");
					let newTd4 = document.createElement("td");
					let brnum = xml.getElementsByTagName("brnum")[i].textContent;
					newTd1.innerHTML = xml.getElementsByTagName("gid")[i].textContent;
					newTd2.innerHTML = xml.getElementsByTagName("brcontent")[i].textContent;
					newTd3.innerHTML = xml.getElementsByTagName("regdate")[i].textContent;
					newTd4.innerHTML = "<a href = 'javascript:reredelete("+brnum+","+bgroup+")'>x</a>"
					newTd1.style.fontSize = '12px';
					newTd2.style.fontSize = '12px';
					newTd3.style.fontSize = '12px';
					newTd4.style.fontSize = '12px';
					
					newTr.appendChild(newTd1);
					newTr.appendChild(newTd2);
					newTr.appendChild(newTd3);
					newTr.appendChild(newTd4);
					newTable.appendChild(newTr);
					replyDiv1.appendChild(newTable);
					
					}
					let renewDiv = document.createElement("div");
					let input1 = document.createElement("input");
					input1.type = "text";
					input1.name = "brcontent1";
					input1.id = "brcontent1";
					input1.style.color = "black"
					let input2 = document.createElement("input");
					input2.type = "button";
					input2.id = "brbtn2";
					input2.value = "입력";
					renewDiv.appendChild(input1);
					renewDiv.appendChild(input2);
					input2.addEventListener('click', function(e) {
						replyinsert(bgroup);
						})
					replyDiv1.appendChild(renewDiv)
				
				
			}
			
		}
		xhr1.open("get","${pageContext.request.contextPath}/boardrereply/list?bnum=${param.bnum}&brlevel=1&bgroup="+bgroup,true)
		xhr1.send();
		let span = document.getElementById("span"+bgroup);
		span.innerHTML = "↑";
		flag = false;
	}else{
		let div = document.getElementById("replyDiv"+bgroup);
		let childs = div.childNodes;
		for(let i=childs.length-1;i>=0;i--){
			div.removeChild(childs.item(i));
		}
			let span = document.getElementById("span"+bgroup);
				span.innerHTML = "↓";
				flag = true;
		
	
	}
}
	var brbtn1 = document.getElementById("brbtn1");
	function replyinsert(bgroup){
		
		var brcontent = null;
		if(bgroup==0){
			brcontent = document.getElementById("brcontent").value;
		}else{
			brcontent = document.getElementById("brcontent1").value;
		}
		if(brcontent==""){
			alert("댓글을 입력해 주세요");
			return;
		}
				
	 	location.href = "${pageContext.request.contextPath}/boardreply/insert?bgroup="+bgroup+
		"&bnum=${param.bnum}&rnum=${param.rnum}"+
		"&regdate=${param.regdate}&btitle=${param.btitle}&bcontent=${param.bcontent}"+
		"&brcontent="+brcontent;
	}
		console.log(${param.c});
	  if(${!empty param.c}){
		  let pageNum = 1;
		  let paramb = ${param.b}
			replylist(paramb,1);
		}

	
	</script>
	
</body>
</html>