<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile/insert.jsp</title>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/profile/css/common.css"/>
</head>
<body>
<%
  String id = request.getParameter("id");
%>
<div id="wrapper">
	<div class="container">
	  <div class= "inner">
		<h2>프로필 상세등록</h2>
<<<<<<< HEAD
		<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/upload" enctype="multipart/form-data" method="get" >
			<table style= "width: 70%;"  class="table02">
			  <caption>
			    <strong style="font-size: 16px;">
			      <span class="t_red"> *</span> 표시는 필수입력 항목입니다.
			    </strong>
			  </caption>
			  <colgroup>
			    <col width="30%">
				<col width="*">
			  </colgroup>
				<tbody id="tbody">
					<tr>
					  <th>프로필제목<span class="t_red"> *</span></th>
					  <td>
					    <input id="ptitle" name="ptitle" value="" class="tbox1"/>
					  </td>		
					</tr>
					<tr>
						<th>홈페이지 제목<span class="t_red"> *</span></th>
						<td>
						  <input id="htitle" name="htitle" value="" class="tbox2"/>
						</td>
					</tr>
					<tr>
					  <th>자기소개<span class="t_red"> *</span></th>
			          <td>
			            <textarea id="pintro" name="pintro" cols="10" rows="5" class="textarea01"></textarea>
			          </td>
					</tr>
					<tr>
						<th>프로필이미지<br>(첨부파일)</th>
						<td colspan="3" id="img_td"><input type="file" name="imgfile" id="imgfile" onchange="readURL(this);">
						  <br />
						  <img id="preview" />
						</td>
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
		  <input type="button" class="btn black mr5" value="메인으로">
		  <input type="button" class="btn black mr5"  id = 'btn1' value="미리보기" onclick= "openChild()" >
		</div>
	   </form>
	    <input type= "hidden" name = "id" value= "${param.id}"> 
	  </div>
=======
	<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/upload" enctype="multipart/form-data" method="post" >
	<table style= "width: 70%;"  class="table02"  >
	<caption><strong style="font-size: 16px;"><span class="t_red"> *</span> 표시는 필수입력 항목입니다.</strong></caption>
		<colgroup>
			<col width="30%">
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
                            <td><textarea id="pintro" name="pintro" cols="10" rows="5" class="textarea01"></textarea></td>
		</tr>
		<tr>
			<th>프로필이미지<br>(첨부파일)</th>
			
			<td colspan="3" id="img_td"><input type="file" name="imgfile" id="imgfile" onchange="readURL(this);" >
<br />
<img id="preview" />
			

			</td>
			
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
	<input type="button" class="btn black mr5" value="메인으로">
	<input type="button" class="btn black mr5"  id = 'btn1' value="미리보기" >
 	<input type="submit" class="btn black" value="등록하기" style="display:none;" id ='btn2' >


	 </div>
 <input type= "hidden" name = "id" value= "${param.id}"> 
<input type= "hidden" name = "gid" value= "${param.gid}">	
	 </form>

>>>>>>> branch 'master' of https://github.com/cypark0531/prj1.git
	</div>
  </div>
<script type="text/javascript">
var flag = false;
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview').src = "";
	} 
}

<<<<<<< HEAD
 var btn1 = document.getElementById("btn1");
 btn1.addEventListener('click', function(e) {
	 window.open('popup.jsp','',"width=400,height=700,resizable = no, scrollbars = n0"
=======


/*
	function change(){
		var imgfile = document.getElementById("imgfile")
		var src = imgfile.value
		console.log(src);
>>>>>>> branch 'master' of https://github.com/cypark0531/prj1.git
	}
<<<<<<< HEAD
=======

*/
 var btn1 = document.getElementById("btn1");
 var btn2 = document.getElementById("btn2");
 
 btn1.addEventListener('click', function(e) {
	 window.open('${pageContext.request.contextPath}/profile/popup.jsp','',"width=400,height=700,resizable = no, scrollbars = no");
	 btn1.style.display= 'none';
	 btn2.style.display =  'inline';
>>>>>>> branch 'master' of https://github.com/cypark0531/prj1.git
 });
</script>
</body>
</html>