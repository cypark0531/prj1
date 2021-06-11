<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
<style type="text/css">
	body{
		background-color: black;
	
	}

</style>
</head>
<body>
<!-- h1타이틀 지워도 될듯 -->
<div style="position:relative; width:800px;  height: 44em; margin-top:2em;  margin-left: 27em;  border:  dotted 6px white;  background-size: 7px 2px;  text-align: center;">
<h1 style=" margin-top: 0; font-size: 60pt; text-shadow:#999999 5px 5px 5px;">Board</h1>
<div style="  margin: 0 auto;   width: 450px ;">
<table class="table02" style="text-align: center;">
	<tr>
		<th>No.</th>
		<th style="width: 220px;">TITLE</th>
		<th>DATE</th>
	</tr>

<c:forEach var = "vo" items="${boardlist }">
	<c:choose>
		<c:when test="${param.gid==param.id||(vo.bopen==2&&friend==true)||vo.bopen==3 }">
		<tr>
			<td>${vo.rnum }</td>
			<td><a class ="title" style="color: white; text-decoration: none;" href = "${pageContext.request.contextPath }/board/detail?bnum=${vo.bnum}&btitle=${vo.btitle}
			&rnum=${vo.rnum}&bcontent=${vo.bcontent}&regdate=${vo.regdate}&id=${param.id}&gid=${param.gid}&b=0">${vo.btitle }</a></td>
			<td>${vo.regdate }</td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td></td>
			<td>비공개입니다.</td>
			<td></td>
		</tr>
		</c:otherwise>
	</c:choose>
</c:forEach>
</table>

<div style="float: right;margin-right: 0.5em; height: 30px;padding-bottom: 10px;">
	<c:if test="${param.id==param.gid }">
	<input style="width: 60px;height: 30px;font-size: 15px;margin-top:10px; color: white; background-color: #353535; border-radius: 30%;" type = "button" value="글쓰기" id = btn1>
	</c:if>
</div>
<br>
<div style="margin-left: 2.1em ;height: 30px;margin-top: 20px;">
	<c:if test="${startPageNum>10}">
		<a href="${pageContext.request.contextPath }/board/list?pageNum=${startPagenum-1}&id=${param.id}&gid=${param.gid}">[이전]</a>
		</c:if>
	<c:forEach var ="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i}">
				<a href = "${pageContext.request.contextPath }/board/list?pageNum=${i}&id=${param.id}&gid=${param.gid}"><span style="color:white;font-weight: 900">[${i}]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "${pageContext.request.contextPath }/board/list?pageNum=${i}&id=${param.id}&gid=${param.gid}"><span style="color:gray">[${i}]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPagenum<pageCount}">
		<a href="${pageContext.request.contextPath }/board/list?pageNum=${endPageNum+1}&id=${param.id}&gid=${param.gid}">[다음]</a>
		</c:if>

</div>
</div>

</div>
<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	btn1.addEventListener('click', function(e) {
		location.href = "${pageContext.request.contextPath}/board/insert.jsp?id=${param.id}&gid=${param.gid}";
	});
	var title = document.getElementsByClassName("title");
	for(let i=0;i<title.length;i++){
		title[i].onmouseover = function(){
			title[i].style.color= "white";
			title[i].style.textShadow = "2px 2px 2px #B677FF" ;
	}
		title[i].onmouseout = function(){
			title[i].style.color = "white";
			title[i].style.textShadow = "none";
	}
	
	}
</script>


</body>
</html>