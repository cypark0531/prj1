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
body {
	margin:0;
  background-color: #121418;
  display: flex;
  font-family: "Inter", sans-serif;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 200vh;
  padding: 0 2em;
  height: 100vh;
	font-size: 16px;
}
#wrap::-webkit-scrollbar{display: none;}
#btn1{ float: right;
}
</style>
</head>
<body>
<h1 style=" margin-top: 0; font-size: 60pt; text-shadow:#999999 5px 5px 5px;">GUEST BOOK</h1>
<div id="wrap" style="overflow: scroll; width: 400px; margin : 0 auto;">
<div>

<c:forEach var = "vo" items="${list }">
	<table style="width: 400px; text-align: center;"border="1" class="table02">
	<tr>
		<th>${vo.gid }</th>
	</tr>
	<tr>
		<td >${vo.htitle }</td>
	<tr>	
		<td  style="height: 80px;">${vo.hcontent }</td>
	</tr>
	<tr>
		<td>${vo.regdate }</td>
	</tr>
	</table>
	<br>
	<c:if test="${vo.gid==sessionScope.id||sessionScope.id==sessionScope.gid}">
	<input type = "button" id= "btn1" value="삭제" id = btn2 onclick = "delete1(${vo.hnum})">
	</c:if>
	<br>
</c:forEach>

</div>
<div>
	<c:if test="${startPageNum>4}">
		<a href="${pageContext.request.contextPath }/histories/list?pageNum=${startPageNum-1}&id=${param.id}&gid=${param.gid}">[이전]</a>
		</c:if>
	<c:forEach var ="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i}">
				<a href = "${pageContext.request.contextPath }/histories/list?pageNum=${i}"><span style="color:white;font-weight: 900">[${i}]</span></a>
			</c:when>
			<c:otherwise>
				<a href = "${pageContext.request.contextPath }/histories/list?pageNum=${i}"><span style="color:gray">[${i}]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount}">
		<a href="${pageContext.request.contextPath }/histories/list?pageNum=${endPageNum+1}">[다음]</a>
		</c:if>


</div>
<div>
	<c:if test="${sessionScope.id!=sessionScope.gid&&friend==true }">
	<input type = "button" value="방명록쓰기" id = btn1 onclick = "insert()">
	</c:if>
	
	
</div>
</div>
<script type="text/javascript">
	function insert(){
		location.href = "${pageContext.request.contextPath}/histories/insert.jsp?";
	};
	function delete1(hnum){
		location.href = "${pageContext.request.contextPath}/histories/delete?hnum="+hnum;
	}
</script>
</body>
</html>