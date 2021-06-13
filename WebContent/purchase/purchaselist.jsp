<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css?ver=1"/>
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
.page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
</style>
</head>
<body>
<div id="wrapper" style=" padding: 30px 30px;  border-style: dotted;">
   <div class="container">
     <div class="inner">
        <h1>구매목록</h1>
		<table style="width: 100%"class="table02">
		  <tr>
		    <th>구매번호</th>
		    <th>ID</th>
		    <th>상품코드</th>
		    <th>가격</th>
		    <th>구입한 날짜</th>
		    <th colspan="2">환불</th>
		  </tr>
		  <c:forEach var="vo" items="${list}">
		    <tr>
		      <td>${vo.purnum }</td>
		      <td>${vo.id }</td>
		      <td>${vo.gcode }</td>
		      <td>${vo.gprice }</td>
		      <td>${vo.regdate }</td>
		      <td>
		      <c:set var="a" value="1"/>
		      <!-- 환불 버튼 누르면 /purchase/purchasedeleteController로 감 -->
		          <c:forEach var = "vo1" items="${relist }">
		          <!-- 이거 궁금함 purnum을 != 이렇게 환불 버튼이 계속 활성화됨 -->
		            <c:if test="${vo.purnum == vo1.purnum}">
		          	  <c:set var="a" value="2"/>
		            </c:if>
		          </c:forEach>
		          <c:choose>
		            <c:when test="${a==2 }">
		          	  이미 환불되었습니다.
		          	</c:when>
		          	<c:otherwise>
		          	  <form action="${pageContext.request.contextPath }/purchase/delete" method="post">
		          		<input type="hidden" name="id" value="${vo.id }">
			            <input type="hidden" name="gcode" value="${vo.gcode }">
			            <input type="hidden" name="purnum" value="${vo.purnum }">
			            <input type="hidden" name="gprice" value="${vo.gprice }">
			            <input type="submit" value="환불" class="btn mr5" style="float: rigth; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
			    	  </form>
		          	</c:otherwise>
				  </c:choose>
			  </td>
		    </tr>
		  </c:forEach>
		</table>
		<div class="page_wrap">
	      <div class="page_nation">
			  <c:if test="${startPageNum>8 }">
			    <a href="${pageContext.request.contextPath }/purchase/purchaselist?pageNum=${startPageNum-1 }&id=${sessionScope.id}"><</a>
			  </c:if>
			  <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			    <c:choose>
			      <c:when test="${pageNum==i }">
			        <a href="${pageContext.request.contextPath }/purchase/purchaselist?pageNum=${i }&id=${sessionScope.id}">
			          <span style="color: black; ">${i }</span>
			        </a>
			      </c:when>
			      <c:otherwise>
			        <a href="${pageContext.request.contextPath }/purchase/purchaselist?pageNum=${i }&id=${sessionScope.id}">
			          <span style="color: red">${i }</span>
			        </a>
			      </c:otherwise>
			    </c:choose>
			  </c:forEach>
			  <c:if test="${endPageNum < pageCount }">
			     <a href="${pageContext.request.contextPath }/purchase/purchaselist?pageNum=${endPageNum+1 }&id=${sessionScope.id}">></a>
			  </c:if>
		  </div>
		</div>
		<div class="btn_right mt15"> 
		  <form action="${pageContext.request.contextPath }/home">
		    <input type="hidden" name="id" value="${sessionScope.id }">
		    <input type="submit" value="메인으로" class="btn mr5" style="float: left; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>  
		  <form action="${pageContext.request.contextPath }/goods/goodslist">
		    <input type="hidden" name="id" value="${sessionScope.id }">
  			<input type="submit" value="상품목록" class="btn mr5" style="float: rigth; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
        </div>
    </div>
  </div>
</div>
</body>
</html>