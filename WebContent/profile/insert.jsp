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
<%	String id = request.getParameter("id");
%>
<div id="wrapper">
	<div class="container">
	<div class= "inner">
		<h2>프로필 상세등록</h2>
	<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/upload" enctype="multipart/form-data" method="post" >
	<table style= "width: 70%;"  class="table02"  >
	<caption><strong style="font-size: 16px;"><span class="t_red"> *</span> 표시는 필수입력 항목입니다.</strong></caption>
		<colgroup>
			<col width="20%">
			<col width="*">
		</colgroup>
		<tbody id="tbody">
		<tr>
		<th>프로필제목<span class="t_red"> *</span></th>
		<td><input id="ptitle" name="ptitle" value="" class="tbox1"/></td>		
		</tr>
		<tr>
			<th>홈페이지 제목<span class="t_red"> *</span></th>
			<td><input id="htitle" name="htitle" value="" class="tbox2"/></td>
		</tr>
		<tr>
		<th>자기소개<span class="t_red"> *</span></th>
                            <td><textarea id="board_content" name="board_content" cols="10" rows="5" class="textarea01"></textarea></td>
		</tr>
		<tr>
			<th>프로필이미지<br>(첨부파일)</th>
		
			<td colspan="3" id="img_td"><input type= "file" name="imgfile" value="">
		</tr>
		<tr>
		<th>프로필공개여부<span class="t_red"> *</span></th>
		<td>
		<select name= "popen">
		<option value= "1">비공개</option>
		<option value= "2">일촌공개</option>
		<option value= "3">전체공개</option>
		</select>
		</td>
		</tr>
		</tbody>
	</table>
	<input type="submit" value="등록">
 <input type= "hidden" name = "id" value= "${param.id}"> 
	</form>
	

	</div>
</div>
</div>
</body>
</html>