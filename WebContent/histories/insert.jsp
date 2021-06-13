<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile/insert.jsp</title>
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

</style>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
</head>
<body>
<div class="wrap" style=" padding: 60px 60px 60px 60px;  border-style: dotted;" >
	<div class="container">
	<div class= "inner">
		<h1 style="margin-left: 1em; font-size: 50pt; text-shadow:#999999 5px 5px 5px;" >WRITE GUESTBOOK</h1>
	<form id="profileForm" name="profilemsmsForm"  action="${pageContext.request.contextPath }/histories/insert?id=${param.id}&gid=${param.id}" method="post">
	<table   class="table02"  >
	<caption><strong style="font-size: 20px; color: #ffffff;">'<span class="t_red">*</span>' This mark is required input items.</strong></caption>
		<colgroup>
			<col width="30%">
			<col width="*">
		</colgroup>
		
		<tbody id="tbody" >
		<tr>
		<th>VISITOR'S BOOK TITLE<span class="t_red"> *</span></th>
		<td><input  type= "text" id="htitle" name="htitle" value="" class="tbox1"  style=" width:400px; height:auto; background-color:  #121418;color: white;font-size: 16px;border: none; " autofocus="autofocus"  tabindex="1" onkeyup="moveFocus(this);"></td>
		</tr>
		<tr>
		<th>VISITOR'S BOOK CONTENT<span class="t_red"> *</span></th>
                            <td><textarea id="hintro" name="hcontent" cols="10" rows="5" class="textarea01" style="width:700px; height:200px; background-color:  #121418;color: white;font-size: 16px;border: none;" tabindex="3" onkeyup="moveFocus(this);" ></textarea></td>
		</tr>
	
		</tbody>

	</table>
	<div class="btn_right mt15" style=" float: right;" >

	<input type="button" class="btn  mr5" value="메인으로" style="width: 100px; height: 40px; font-weight:900;  font-size: 16px; ">
 	<input type="button" class="btn mr5"  id = 'btn1' value="미리보기" style="width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
 	 	<input type="submit" class="btn " value="등록하기"  id ='btn2' style="display:none; width: 100px; height: 40px; font-weight:900;  font-size: 16px;">
	<input type= "hidden" name = "id" value= "${param.id}"> 
	<input type= "hidden" name = "gid" value= "${param.id}"> 
	 </div>
	 </form>
	</div>
</div>
</div>
<script type="text/javascript">
function moveFocus(e) {
	if(event.keyCode==13) {
		var f =document.getElementById("profileForm");
		f.elements[e.tabIndex].focus();
	}
}


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

var btn1 = document.getElementById("btn1");
var btn2 = document.getElementById("btn2");

 
 btn1.addEventListener('click', function(e) {
	 window.open('${pageContext.request.contextPath}/profile/popup.jsp','',"width=400,height=700,resizable = no, scrollbars = no");
	 btn1.style.display= 'none';
	 btn2.style.display =  'inline';
 });
/*
 var filebox = document.getElementById("imgfile");
	filebox.innerHTML = "Choice File"
 */

	</script>
</body>
</html>