<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${param.id }님의 게시판</h1>
<div>
<table>
	<tr>
		<th>게시판번호</th>
		<th>제목</th>
		<th>날짜</th>
	</tr>

<c:forEach var = "vo" items="${boardlist }">
	<c:choose>
		<c:when test="${param.gid==param.id||(vo.bopen==2&&friend==true)||vo.bopen==3 }">
		<tr>
			<td>${vo.rnum }</td>
			<td><a href = "${pageContext.request.contextPath }/board/detail?bnum=${vo.bnum}&btitle=${vo.btitle}
			&rnum=${vo.rnum}&bcontent=${vo.bcontent}&regdate=${vo.regdate}&id=${param.id}&gid=${param.gid}">${vo.btitle }</a></td>
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
</div>
<div>
	<c:if test="${startPageNum>10}">
		<a href="${pageContext.request.contextPath }/board/list?pageNum=${startPagenum-1}">[이전]</a>
		</c:if>
	<c:forEach var ="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i}">
				<a href = "${pageContext.request.contextPath }/board/list?pageNum=${i}&id=${param.id}&gid=${param.gid}"><span style="color:blue">[${i}]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "${pageContext.request.contextPath }/board/list?pageNum=${i}&id=${param.id}&gid=${param.gid}"><span style="color:gray">[${i}]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPagenum<pageCount}">
		<a href="${pageContext.request.contextPath }/board/list?pageNum=${endPageNum+1}">[다음]</a>
		</c:if>

</div>
<div>
	<c:if test="${param.id==param.gid }">
	<input type = "button" value="글쓰기" id = btn1>
	</c:if>
</div>
<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	btn1.addEventListener('click', function(e) {
		location.href = "${pageContext.request.contextPath}/board/insert.jsp?id=${param.id}&gid=${param.gid}";
		
	});
</script>


</body>
</html>