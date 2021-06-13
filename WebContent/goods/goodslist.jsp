<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css?ver=1"/>
<%
 //int money=Integer.parseInt(request.getParameter("money"));

%> 
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
      <h2>상품목록</h2>
      <!-- 카테고리 -->
      <div class="btn_right mt15">
        <form action="${pageContext.request.contextPath }/goods/goodslist">
        <span class="t_red" style="margin-right: 30px; float: left; font-size: 30px;">카테고리:</span>
          <input type="hidden" name="id" value="${sessionScope.id }">
          <input type="submit" value="전체" class="btn mr5" style="float: left; margin-bottom:5px; width: 100px; height: 40px; font-weight:900;  font-size: 16px;  ">
        </form>
        <form action="${pageContext.request.contextPath }/music/select">
          <input type="hidden" name="id" value="${sessionScope.id }">
          <input type="hidden" name="gcategory" value="music">
          <input type="submit" value="음악" class="btn mr5" style=" float: left; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
        </form>
        <form action="${pageContext.request.contextPath }/background/select">
          <input type="hidden" name="id" value="${sessionScope.id }">
          <input type="hidden" name="gcategory" value="background">
          <input type="submit" value="배경" class="btn mr5" style="float: left; width: 100px; height: 40px; font-weight:900;  font-size: 16px; ">
        </form>
      </div> 
		<table style="width: 100%; "class="table02" >
		  <tr>
		    <th>상품이미지</th>
		    <th>상품가격</th>
		    <th>상품이름</th>
		    <th>상품카테코리</th>
		    <th colspan='2'>구매</th>
		  </tr>
		  <c:forEach var="vo" items="${goodslist }">
		    <tr>
		      <td><img alt="상품이미지" src="${pageContext.request.contextPath }/goodsimgfile/${vo.gsaveimg}" width="100" height="100"></td>
		      <td>${vo.gprice }</td>
		      <td>${vo.gname }</td>
		      <td>${vo.gcategory }</td>
		      <td>
		        <form action="${pageContext.request.contextPath }/purchase/insert" method="post" onsubmit="return check(${requestScope.money},${vo.gprice })">
		      <%--   <input type="hidden" name="money" value="${requestScope.money}"> --%>
		          <input type="hidden" name="id" value="${sessionScope.id }">
		          <input type="hidden" name="gprice" value="${vo.gprice }">
		          <input type="hidden" name="gcode" value="${vo.gcode }">
		          <input type="hidden" name="glink" value="${vo.glink }">
		          <input type="hidden" name="gsaveimg" value="${vo.gsaveimg }">
		          <input type="hidden" name="gname" value="${vo.gname }">
		          <input type="hidden" name="gcategory" value="${vo.gcategory }">
		          <input type="submit" value="구매" class="btn mr5" style="width: 60px; height: 40px; font-weight:900;  font-size: 16px; text-align: center;">
		        </form>
			  </td>
		      <td>
	            <form action="${pageContext.request.contextPath }/basket/insert" method="post" onsubmit="return ccheck()">
	              <input type="hidden" name="id" value="${sessionScope.id }">
		          <input type="hidden" name="gprice" value="${vo.gprice }">
		          <input type="hidden" name="gcode" value="${vo.gcode }">
		          <input type="hidden" name="gname" value="${vo.gname }">
		          <input type="hidden" name="glink" value="${vo.glink }">
		          <input type="hidden" name="gsaveimg" value="${vo.gsaveimg }">
	              <input type="submit" value="장바구니" class="btn mr5" style="width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
	            </form>
	          </td>
		    </tr>
		    </c:forEach>
		</table>
	    <div class="page_wrap">
	      <div class="page_nation">
			  <c:if test="${startPageNum>5 }">
			    <a href="${pageContext.request.contextPath }/goods/goodslist?pageNum=${startPageNum-1 }&id=${sessionScope.id}"><</a>
			  </c:if>
			  <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			    <c:choose>
			      <c:when test="${pageNum==i }">
			        <a href="${pageContext.request.contextPath }/goods/goodslist?pageNum=${i }&id=${sessionScope.id}">
			          <span style="color: black; ">${i }</span>
			        </a>
			      </c:when>
			      <c:otherwise>
			        <a href="${pageContext.request.contextPath }/goods/goodslist?pageNum=${i }&id=${sessionScope.id}">
			          <span style="color: red">${i }</span>
			        </a>
			      </c:otherwise>
			    </c:choose>
			  </c:forEach>
			  <c:if test="${endPageNum < pageCount }">
			     <a href="${pageContext.request.contextPath }/goods/goodslist?pageNum=${endPageNum+1 }&id=${sessionScope.id}">></a>
			  </c:if>
		  </div>
		</div>
	    <div class="btn_right mt15">
		  <form action="${pageContext.request.contextPath }/home">
		    <input type="hidden" name="id" value="${sessionScope.id }">
		    <input type="submit" value="메인으로" class="btn mr5" style="float: left; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
	      <form action="${pageContext.request.contextPath }/purchase/purchaselist">
		    <input type="hidden" name="id" value="${sessionScope.id }">
		    <input type="hidden" name="gprice" value="${requestScope.gprice }">
		    <input type="submit" value="구매목록" class="btn mr5" style="float: right; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
	      <form action="${pageContext.request.contextPath }/basket/basketlist">
		    <input type="hidden" name="id" value="${sessionScope.id }">
		    <input type="submit" value="장바구니 목록" class="btn mr5" style="float: rigth; width: 130px; height: 40px; font-weight:900;  font-size: 16px;">
		  </form>
	    </div>
    </div>
  </div>
</div>
<script type="text/javascript">
   function check(money,gprice){
	   if(gprice>money){
	     alert('금액이 부족합니다');
	   	 return false;
	   }else{
	     return true;
	   }
   }
   function ccheck(){
		if (confirm(" 추가하시겠습니까?") == true){
			alert("추가되었습니다");
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>