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

					<td style="width: 50px; font-size: 20px">${param.rnum }aa</td>
					<td style="width: 250px;">${param.btitle }aa</td>
					<td style="font-size: 13px; text-align: right">${param.regdate}aa</td>

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
						id = "brcontent" name="brcontent"> <input type="button" value="입력"id="brbtn1"></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	var btn2 = document.getElementById("btn2");
	var brbtn1 = document.getElementById("brbtn1");
	var xhr = null;
	function goUpdate(){
		location.href = "${pageContext.request.contextPath}/board/update?&bnum=${param.bnum}";
	}
	function goDelete(){
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			location.href = "${pageContext.request.contextPath}/board/delete?&bnum=${param.bnum}";
		}else{
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
			for(var i = 0; i<brcontent.length;i++){
				let gid = xml.getElementsByTagName("gid")[i].textContent;
				let regdate = xml.getElementsByTagName("regdate")[i].textContent;
				var bgroup = xml.getElementsByTagName("bgroup")[i].textContent
				let brcon = brcontent[i].textContent;
				console.log(bgroup)
				let newTable = document.createElement("table");
				let newTr = document.createElement("tr");
				let newTd1 = document.createElement("td");
				let newTd2 = document.createElement("td");
				let newTd3 = document.createElement("td");
				let newTd4 = document.createElement("td");
				let newDiv = document.createElement("div");
				
				newTd1.innerHTML = brcon;
				newTd2.innerHTML = gid;
				newTd3.innerHTML = regdate;
				newTd4.innerHTML = "<input type= 'button' id = 'repbtn' value= '↓' onclick=reply("+bgroup+")>";
				newDiv.id = "replyDiv"+bgroup;
				newTr.appendChild(newTd1);
				newTr.appendChild(newTd2);
				newTr.appendChild(newTd3);
				newTr.appendChild(newTd4);
				newTable.appendChild(newTr);
				replyDiv.appendChild(newTable);
				replyDiv.appendChild(newDiv);
			}
		}
	}
	xhr.open("post","${pageContext.request.contextPath}/boardreply/list",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	let param = 'bnum=${param.bnum}';
	xhr.send(param);
	}
	list();

</script>
</body>
</html>