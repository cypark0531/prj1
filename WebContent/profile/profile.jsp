<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="css/common.css"/>
</head>
<body>

<div id="wrapper">
	<div class="container">
	<div class= "inner">
		<h2>프로필 상세등록</h2>
	<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/upload" enctype="multipart/form-data" method="post" onsubmit="return false;"></form>
	<table style= "width: 70%;"  class="table02"  >
	<caption><strong><span class="t_red">*</span>표시는 필수입력 항목입니다.</strong></caption>
		<colgroup>
			<col width="20%">
			<col width="*">
		</colgroup>
		<tbody id="tbody">
		<tr>
		<th>프로필제목<span class="t_red">*</span></th>
		<td><input id="ptitle" name="ptitle" value="" class="tbox1"/></td>		
		</tr>
		<tr>
			<th>홈페이지 제목<span class="t_red">*</span></th>
			<td><input id="htitle" name="htitle" value="" class="tbox2"/></td>
		</tr>
		<tr>
		<th>자기소개<span class="t_red">*</span></th>
                            <td><textarea id="board_content" name="board_content" cols="10" rows="5" class="textarea01"></textarea></td>
		</tr>
		<tr>
			<th>프로필이미지(첨부파일)</th>
			<td colspan="3" id="img_td"><input type= "file" name="imgfile" value="">
		</tr>
		</tbody>
	</table>
	<input type="submit" value="등록">
	
	
	
	
	
	</div>





</div>
</div>
</body>
</html>