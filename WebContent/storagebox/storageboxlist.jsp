<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <h2>보관함</h2>
      <!-- 카테고리 -->
      <div class="btn_right mt15">
        <form action="${pageContext.request.contextPath }/storagebox/storageboxlist">
        <span class="t_red" style="margin-right: 30px; float: left; font-size: 30px;">카테고리:</span>
          <input type="hidden" name="id" value="${sessionScope.id }">
          <input type="submit" value="전체" class="btn mr5" style="float: left; margin-bottom:5px; width: 100px; height: 40px; font-weight:900;  font-size: 16px;  ">
        </form>
        <form action="${pageContext.request.contextPath }/storagemusic/secect">
          <input type="hidden" name="id" value="${sessionScope.id }">
          <input type="hidden" name="gcategory" value="music">
          <input type="submit" value="음악" class="btn mr5" style=" float: left; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
        </form>
        <form action="${pageContext.request.contextPath }/storageback/secect">
          <input type="hidden" name="id" value="${sessionScope.id }">
          <input type="hidden" name="gcategory" value="background">
          <input type="submit" value="배경" class="btn mr5" style="float: left; width: 100px; height: 40px; font-weight:900;  font-size: 16px; ">
        </form>
      </div> 
		<table style="width: 100%; "class="table02" >
		  <tr>
		    <th>이미지</th>
		    <th>이름</th>
		    <th>카테고리</th>
		    <th colspan='2'>적용</th>
		  </tr>
		  <c:forEach var="vo" items="${storageboxlist }">
		    <tr>
		      <td><img alt="상품이미지" src="${pageContext.request.contextPath }/goodsimgfile/${vo.gsaveimg}" width="100" height="100"></td>
		      <td>${vo.gname }</td>
		      <td>${vo.gcategory }</td>
		      <td>
		        <form action="${pageContext.request.contextPath }/home" method="post">
		          <input type="hidden" name="id" value="${sessionScope.id }">
		          <input type="hidden" name="gcode" value="${vo.gcode }">
		          <input type="hidden" name="glink" value="${vo.glink }">
		          <input type="hidden" name="gsaveimg" value="${vo.gsaveimg }">
		          <input type="hidden" name="gname" value="${vo.gname }">
		          <input type="hidden" name="anum" value="${vo.anum }">
		          <input type="hidden" name="basicsetting" value="${vo.basicsetting}">
		          <input type="submit" value="적용" class="btn mr5" style="width: 100px; height: 40px; font-weight:900;  font-size: 16px; text-align: center;">
		        </form>
			  </td>
		    </tr>
		    </c:forEach>
		</table>
	    <div class="page_wrap">
	      <div class="page_nation">
			  <c:if test="${startPageNum>5 }">
			    <a href="${pageContext.request.contextPath }/storagebox/storageboxlist?pageNum=${startPageNum-1 }&id=${sessionScope.id}"><</a>
			  </c:if>
			  <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			    <c:choose>
			      <c:when test="${pageNum==i }">
			        <a href="${pageContext.request.contextPath }/storagebox/storageboxlist?pageNum=${i }&id=${sessionScope.id}">
			          <span style="color: black; ">${i }</span>
			        </a>
			      </c:when>
			      <c:otherwise>
			        <a href="${pageContext.request.contextPath }/storagebox/storageboxlist?pageNum=${i }&id=${sessionScope.id}">
			          <span style="color: red">${i }</span>
			        </a>
			      </c:otherwise>
			    </c:choose>
			  </c:forEach>
			  <c:if test="${endPageNum < pageCount }">
			     <a href="${pageContext.request.contextPath }/storagebox/storageboxlist?pageNum=${endPageNum+1 }&id=${sessionScope.id}">></a>
			  </c:if>
		  </div>
		</div>
	      <form action="${pageContext.request.contextPath }/home">
		    <input type="hidden" name="id" value="${sessionScope.id }">
		    <input type="hidden" name="glink" value="${requestScope.glink }">
		    <input type="submit" value="닫기" class="btn mr5" style="float: right; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
	    </div>
    </div>
  </div>
</body>
</html>