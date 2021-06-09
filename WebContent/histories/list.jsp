<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>${param.id }님의 게시판</h1>
<div>
<table>
	<tr>
		<th>작성자</th> <th>제목</th>
	</tr>
	<tr>	
		<th>내용</th>
	</tr>
	<tr>
		<th>날짜</th>
	</tr>
	

<c:forEach var = "vo" items="${list }">
		
		<tr>
		<th>${vo.gid }</th> <th>${vo.htitle }</th>
	</tr>
	<tr>	
		<th>${vo.hcontent }</th>
	</tr>
	<tr>
		<th>${vo.regdate }</th>
	</tr>
	<c:if test="${vo.gid==param.gid&&param.id==param.gid}">
	<input type = "button" value="삭제" id = btn2 onclick = "delete1(${vo.hnum})">
	</c:if>
</c:forEach>
</table>
</div>
<div>
	<c:if test="${startPageNum>10}">
		<a href="${pageContext.request.contextPath }/histories/list?pageNum=${startPagenum-1}&id=${param.id}&gid=${param.gid}">[이전]</a>
		</c:if>
	<c:forEach var ="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i}">
				<a href = "${pageContext.request.contextPath }/histories/list?pageNum=${i}&id=${param.id}&gid=${param.gid}"><span style="color:black;font-weight: 900">[${i}]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "${pageContext.request.contextPath }/histories/list?pageNum=${i}&id=${param.id}&gid=${param.gid}"><span style="color:gray">[${i}]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPagenum<pageCount}">
		<a href="${pageContext.request.contextPath }/histories/list?pageNum=${endPageNum+1}&id=${param.id}&gid=${param.gid}">[다음]</a>
		</c:if>

</div>
<div>
	<c:if test="${param.id!=param.gid&&friend==true }">
	<input type = "button" value="방명록쓰기" id = btn1>
	</c:if>
	
	
</div>
<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	btn1.addEventListener('click', function(e) {
		location.href = "${pageContext.request.contextPath}/histories/insert.jsp?id=${param.id}&gid=${param.gid}";
	});
	delete1(hnum){
		location.href = "${pageContext.request.contextPath}/histories/delete?id=${param.id}&gid=${param.gid}&hnum="+hnum;
	}
	
</script>
</html>