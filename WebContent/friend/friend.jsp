<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0px; padding:0px;}
	body{background-color: black;}
	td{text-align: center;}
</style>
</head>
<body>
<div style="margin:auto; margin-top:100px; padding: 100px 60px 100px 60px; width:520px; border-color: white; border-style: dotted;">
<div style="width:100%;">
<h1 style="color:white;">일촌 관리</h1>
<table id="friendtable" style="background-color: white; width:100%; margin-top:60px;">
	<tr>
		<th>아이디</th><th>닉네임</th><th>일촌 상태</th><th>미니홈피</th><th> </th>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr class="tr" >
			<td>
			${list.id }
			<input class="fid" type="hidden" value="${list.id }">
			<input class="fnum" type="hidden" value="${list.friendnum }">
			</td>
			<td>${list.name }</td>
			<td><c:choose>
			<c:when test="${list.state==1 }">승락 대기중</c:when>
			<c:when test="${list.state==2 }">요청됨</c:when>
			<c:otherwise>일촌</c:otherwise>
			</c:choose></td>
			<td><a href="${pageContext.request.contextPath }/home?id=${list.id }">이동</a></td>
			<td><c:choose>
			<c:when test="${host }">
			<c:choose>
			<c:when test="${list.state==1 }"><input class="dbtn" type="button" value="취소" ></c:when>
			<c:when test="${list.state==2 }"><input class="abtn" type="button" style="margin-right:10px" value="승락"><input class="dbtn" type="button" value="거절"></c:when>
			<c:otherwise><input class="dbtn" type="button" value="삭제"></c:otherwise>
			</c:choose>
			</c:when>
			<c:otherwise>
			<input class="addbtn" type="button" value="일촌 신청" >
			</c:otherwise>
			</c:choose></td>
		</tr>
	</c:forEach>
</table>
</div>

<div style="text-align: center; color:white; margin-top:30px">
	<select id="select" style="width:40px;">
		<c:forEach var="i" begin="1" end="${lastpage }">
			<option value="${i }">${i }</option>
		</c:forEach>
	</select>/${lastpage }
</div>

</div>
</body>
<script type="text/javascript">
	var tr=document.getElementsByClassName("tr");
	var select=document.getElementById("select");
	for(let i=0;i<tr.length;i++){
		let fid=tr[i].getElementsByClassName("fid")[0].value;
		let fnum=tr[i].getElementsByClassName("fnum")[0].value;
		let abtn=tr[i].getElementsByClassName("abtn")[0];
		let dbtn=tr[i].getElementsByClassName("dbtn")[0];
		let addbtn=tr[i].getElementsByClassName("addbtn")[0];
		
		if(abtn!=null)abtn.onclick=function(){
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml=xhr.responseXML;
					let result=xml.getElementsByTagName("code")[0].textContent;
					if(result=="success"){
						location.replace("${pageContext.request.contextPath}/friend/friend?host=${host}&page=${page}");											
					}
					else alert("오류로 인해 실패했습니다.");
				}
			}
			xhr.open('get','${pageContext.request.contextPath}/friend/accept?fnum='+fnum,true);
			xhr.send();
		}
		
		if(dbtn!=null)dbtn.onclick=function(){
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml=xhr.responseXML;
					let result=xml.getElementsByTagName("code")[0].textContent;
					if(result=="success"){
						location.replace("${pageContext.request.contextPath}/friend/friend?host=${host}&page=${page}");											
					}
					else alert("오류로 인해 실패했습니다.");
				}
			}
			xhr.open('get','${pageContext.request.contextPath}/friend/delete?fnum='+fnum,true);
			xhr.send();
		}
		
		function friendOK(){
		let xhr= new XMLHttpRequest()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let xml=xhr.responseXML;
				let result=xml.getElementsByTagName("code")[0].textContent;
				console.log("result:"+result);
				if(result=="success"){
					if(addbtn!=null)addbtn.disabled="disabled";
				}
			}
		}
		xhr.open('get','${pageContext.request.contextPath}/friend/friendOK?hid=${sessionScope.id}&gid='+fid,true);
		xhr.send();
		}
		friendOK();
		
		if(addbtn!=null)addbtn.onclick=function(){
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml=xhr.responseXML;
					let result=xml.getElementsByTagName("code")[0].textContent;
					if(result=="success")alert("신청되었습니다");
					else alert("오류로 인해 실패했습니다.");
				}
			}
			xhr.open('get','${pageContext.request.contextPath}/friend/addfriend?hid=${sessionScope.id}&gid='+fid,true);
			xhr.send();
		}
		
	}
	select.onblur=function(){
		let page=select.value;
		location.replace("${pageContext.request.contextPath}/friend/friend?host=${host}&page="+page);
	}
	
</script>
</html>