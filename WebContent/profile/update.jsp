<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile/update.jsp</title>
<script type="text/javascript">
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '100px'; 
			img.style.height = '100px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}
</script>
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
	<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/update" enctype="multipart/form-data" method="post" >
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
		
			<td colspan="3" id="img_td"><input type= "file" name="imgfile" value="" >
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
	<div class="btn_right mt15" style="width: 69%">
	<input type="submit" class="btn black mr5" value="메인으로">
	<input type="submit" class="btn black" value="수정하기">
	 </div>
 <input type= "hidden" name = "id" value= "${param.id}"> 
	</form>
	

	</div>
</div>
</div>
</body>
</html>