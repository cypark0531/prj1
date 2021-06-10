<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/profile/css/common.css" />

</head>
<body>
	<div id="wrap">
		<div id="top">
			<table class="table02" style="width: 50%">
				<tr>

					<td style="width: 50px; font-size: 20px">${param.rnum }</td>
					<td style="width: 250px;">${param.btitle }</td>
					<td style="font-size: 13px; text-align: right">${param.regdate}</td>

				</tr>
				<tr>
					<td colspan="3" height="160px">콘텐트 : ${param.bcontent }</td>
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
		<div id="bottom" class="table02">
			<table>
				<tr>
					<td colspan="3">댓글</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>내용</td>
					<td>날짜</td>
				</tr>
	
			</table>
			<div id="reply"></div>
			<table>
				<tr>
					<td colspan="3"><input type="text" placeholder="댓글을 입력하세요"
						id = "brcontent" name="brcontent"> <input type="button" value="입력"id="brbtn1" onclick="replyinsert(0)"></td>
				</tr>
			</table>
		</div>
	<div>
	<c:if test="${startPageNum>10}">
		<a href="${pageContext.request.contextPath }/board/detail?pageNum=${startPagenum-1}">[이전]</a>
		</c:if>
	<c:forEach var ="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i}">
				<a href = "${pageContext.request.contextPath }/board/detail?pageNum=${i}&id=${param.id}&gid=${param.gid}&bnum=${param.bnum}&bcontent=${param.bcontent}&rnum=${param.rnum}&btitle=${param.btitle}&b=0"><span style="color:black;font-weight: 900">[${i}]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "${pageContext.request.contextPath }/board/detail?pageNum=${i}&id=${param.id}&gid=${param.gid}&bnum=${param.bnum}&bcontent=${param.bcontent}&rnum=${param.rnum}&btitle=${param.btitle}&b=0"><span style="color:gray">[${i}]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPagenum<pageCount}">
		<a href="${pageContext.request.contextPath }/board/list?pageNum=${endPageNum+1}">[다음]</a>
		</c:if>

</div>
	</div>
	
	
	<script type="text/javascript">
	console.log(${param.regdate})
	console.log(${requestScope.startPageNum});
	console.log(${param.rnum})
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
		 return;
		}
	}
	function list(){
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
				let newTr = document.createElement("tr");
				let newTd1 = document.createElement("td");
				let newTd2 = document.createElement("td");
				let newTd3 = document.createElement("td");
				let newTd4 = document.createElement("td");
				let newTd5 = document.createElement("td");
				let newDiv = document.createElement("div");
				
				newTd1.innerHTML = gid;
				newTd2.innerHTML = brcon;
				newTd3.innerHTML = regdate;
				newTd4.innerHTML = "<input type= 'button' id = 'repbtn"+bgroup+"' value= '+' onclick=replylist("+bgroup+")>";
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
	if(${param.b==0}){
		reload();
	}
	
	list();
	function redelete(bgroup){
		
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			
			location.href = "${pageContext.request.contextPath}/boardreply/delete?bgroup="+bgroup+
					"&id=${param.id}&gid=${param.gid}&bnum=${param.bnum}&rnum=${param.rnum}"+
					"&regdate=${param.regdate}&btitle=${param.btitle}&bcontent=${param.bcontent}";
		}else{
		 return;
		}
	}
function reredelete(brnum,bgroup){
			console.log("gd");
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			
			location.href = "${pageContext.request.contextPath}/boardreply/redelete?brnum="+brnum+"&bgroup="+bgroup+
					"&id=${param.id}&gid=${param.gid}&bnum=${param.bnum}&rnum=${param.rnum}"+
					"&regdate=${param.regdate}&btitle=${param.btitle}&bcontent=${param.bcontent}";
		}else{
		 return;
		}
}
	var xhr1 = null;
	function replylist(bgroup){
		if(flag){
			
		
		xhr1 = new XMLHttpRequest();
		xhr1.onreadystatechange = function(){
			if(xhr1.readyState==4&&xhr1.status==200){
				var xml = xhr1.responseXML;
				let replyDiv = document.getElementById("replyDiv"+bgroup);
				if(replyDiv==undefined){
					
				}
				let newTable = document.createElement("table");
				let length = xml.getElementsByTagName("brnum").length
				for(let i=0;i<length;i++){
					let newTr = document.createElement("tr");
						newTr.className("wrap")
					let newTd1 = document.createElement("td");
					let newTd2 = document.createElement("td");
					let newTd3 = document.createElement("td");
					let newTd4 = document.createElement("td");
					let brnum = xml.getElementsByTagName("brnum")[i].textContent;
					newTd1.innerHTML = xml.getElementsByTagName("gid")[i].textContent;
					newTd2.innerHTML = xml.getElementsByTagName("brcontent")[i].textContent;
					newTd3.innerHTML = xml.getElementsByTagName("regdate")[i].textContent;
					newTd4.innerHTML = "<input type = 'button' value= '삭제'>"
					newTd4.addEventListener('click', function(e) {
						console.log('gd');
						reredelete(brnum,bgroup);
					})
					console.log(newTd4.onclick)
					newTr.appendChild(newTd1);
					newTr.appendChild(newTd2);
					newTr.appendChild(newTd3);
					newTr.appendChild(newTd4);
					newTable.appendChild(newTr);
					replyDiv.appendChild(newTable);
				}
				
				let input1 = document.createElement("input");
				input1.type = "text";
				input1.name = "brcontent1";
				input1.id = "brcontent1";
				let input2 = document.createElement("input");
				input2.type = "button";
				input2.id = "brbtn2";
				input2.value = "입력";
				replyDiv.appendChild(input1);
				replyDiv.appendChild(input2);
				input2.addEventListener('click', function(e) {
					replyinsert(bgroup);
				})
					
				let repbtn = document.getElementById("repbtn"+bgroup);
					repbtn.value= "-";
			
				
				
			}
			flag = false;
		}
		xhr1.open("get","${pageContext.request.contextPath}/boardrereply/list?bnum=${param.bnum}&brlevel=1&bgroup="+bgroup,true)
		xhr1.send();
		
		
	}else{
		let div = document.getElementById("replyDiv"+bgroup);
		let childs = div.childNodes;
		for(let i=childs.length-1;i>=0;i--){
			div.removeChild(childs.item(i));
				let repbtn = document.getElementById("repbtn"+bgroup);
				repbtn.value= "+";
		}
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
			console.log(brcontent);
				
	 	location.href = "${pageContext.request.contextPath}/boardreply/insert?bgroup="+bgroup+
		"&id=${param.id}&gid=${param.gid}&bnum=${param.bnum}&rnum=${param.rnum}"+
		"&regdate=${param.regdate}&btitle=${param.btitle}&bcontent=${param.bcontent}"+
		"&brcontent="+brcontent;
	}
	
	 if(${param.b}){
		 console.log(${param.b})
			replylist(${param.b})
		}
	function reload(){
		let div = document.getElementById("reply");
		let childs = div.childNodes;
		for(let i=childs.length-1;i>=0;i--){
			div.removeChild(childs.item(i))
		}
	}

	
	</script>
	
</body>
</html>