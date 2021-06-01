<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>

</head>
<body>
<div id="wrap">
	<div id="top">
		<table class="table02" style="width: 50%">
			<tr>
			
				<td style="width: 50px; font-size: 20px" >${param.rnum }aa</td>
				<td style="width: 250px;">${param.btitle }aa</td>
				<td style="font-size: 13px;text-align: right">${param.regdate}aa</td>
				
			</tr>
			<tr>
				<td colspan="3" height="160px">콘텐트 : ${param.bcontent }</td>
			</tr>
			<c:if test="${param.id==param.gid }">
			<tr>
			<td colspan="3" class="btn_right">
			<input type= "button" value= "수정하기" class="btn black mr5" id="btn1">
			
			<input type= "button" value= "삭제하기" class="btn black mr5" id="btn2">
		
			
			
			</td>
			</tr>
			</c:if>
		</table>
	</div>
	<div id="bottom" class = "table02">
		댓글 : 속상 파람 : ${param.gid }
	</div>
</div>
</body>
<script type="text/javascript">
	var btn1 = document.getElementById("btn1");
	btn1.onclick = function(e){
		location.href = "${pageContext.request.contextPath}/board/update?&bnum=${param.bnum}";
	}
	var btn2 = document.getElementById("btn2");
	btn2.onclick = function(e){
		if (confirm(" 정말 삭제하시겠습니까?") == true){
			location.href = "${pageContext.request.contextPath}/board/delete?&bnum=${param.bnum}";
		}else{
		 return;
		}
		
	}
</script>
</html>