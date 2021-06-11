
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>profilelist(update).jsp</title>
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




.del {
	 position: relative; 
	width: 300px; 
	height: 300px; 
	margin-right:  20px; 
	margin-bottom: 50px; 
	float: right;
}

.del:before {
  content:"";
  position:absolute;
  width:100%;
  height:100%;
  top:0;left:0;right:0;
  background-color:rgba(0,0,0,0);
}

.del:hover::before {
  background-color:rgba(0,0,0,0.5);
}


.del input {
	  position: absolute;
	  top: 60%;
 	 left: 50%;
 	 transform: translate(-50%, -50%);
 	 -ms-transform: translate(-50%, -50%);
 	 opacity:0;

}


.del:hover input {  
	
  opacity: 1;
}

  .container {background-color:#121418; z-index:1; margin-left:3vh;  margin-top:3.5vh; height:600px; overflow-y: auto;  border-bottom-style: dotted; border-color :white;  width:900px;}
  .container::-webkit-scrollbar { width: 5px; /*스크롤바의 너비*/ } 
  .container::-webkit-scrollbar-thumb { background-color: black; /*스크롤바의 색상*/ } 
  .container::-webkit-scrollbar-track { background-color: white; /*스크롤바 트랙 색상*/ }


</style>
<script type="text/javascript">
/*
top.window.moveTo(0,0);
if (document.all) {
top.window.resizeTo(screen.availWidth,screen.availHeight);
}
else if (document.layers||document.getElementById) {
if (top.window.outerHeight<screen.availHeight||top.window.outerWidth<screen.availWidth){
top.window.outerHeight = screen.availHeight;
top.window.outerWidth = screen.availWidth;
}
}
	window.onload = function () {
		window.focus();
		window.moveTo(0, 0);
		window.resizeTo(1280,800);
		window.scrollTo(0,250);
	}
*/
 function moveFocus(e) {
	if(event.keyCode==13) {
		var f =document.getElementById("profileForm");
		f.elements[e.tabIndex].focus();
	}
}
	</script>
<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
</head>
<body>
<% 
	
	String id = request.getParameter("id");
	System.out.print("업데이트쪽에왔음"+id);
	
	
	%>
<div class="wrap" style=" padding: 60px 60px 60px 60px;  border-style: dotted;" >
	<div class="container">
	<div class= "inner">
		<h2>PROFILE REGISTER</h2>
	<form id="profileForm" name="profilemsmsForm" action="${pageContext.request.contextPath }/profile/update" enctype="multipart/form-data" method="post" onsubmit="return UpdateCommit()">
	<table   class="table02"  >
	<caption><strong style="font-size: 20px; color: #ffffff;">'<span class="t_red">*</span>' This mark is required input items.</strong></caption>
		<colgroup>
			<col width="30%">
			<col width="*">
		</colgroup>
		
		<tbody id="tbody" >
		
		<tr>
		
		<th>POFILE TITLE<span class="t_red"> *</span></th>
		<td><input id="ptitle" name="ptitle" value="${vo.ptitle }" class="tbox1"  style=" width:400px; height:auto; background-color:  #121418;color: white;font-size: 16px;border: none; " autofocus="autofocus"  tabindex="1" onkeyup="moveFocus(this);" value=""/></td>		
		</tr>
		<tr>
			<th>MYPAGE MAIN TITLE<span class="t_red"> *</span></th>
			<td><input id="htitle" name="htitle" value="${vo.htitle }" class="tbox2" style=" width:400px; height:auto; background-color:  #121418;color: white;font-size: 16px;border: none;" tabindex="2" onkeyup="moveFocus(this);" value=""/></td>
		</tr>
		<tr>
		<th>MY INRODUCE<span class="t_red"> *</span></th>
        <td><textarea id="pintro" name="pintro" cols="10" rows="5" class="textarea01" style="width:700px; height:200px; background-color:  #121418;color: white;font-size: 16px;border: none;" tabindex="3" onkeyup="moveFocus(this);" >${vo.pintro }</textarea></td>
		</tr>
		<tr>
			<th>MY PROFILE<br>(Attached File)</th>
			
			<td colspan="3" id="img_td">[Exisiting File Name ${vo.porgimg }]	<br><br><input type="file" name="imgfile" id="imgfile"  style="font-size: 16px; width: 360px; height: auto; background-color:  #121418;color: white; border: none; background-color:  #121418;color: white;font-size: 16px;border: none;" onchange="readURL(this)">
						
			<br/>
			<div class="del">
			<img id="preview" src="${pageContext.request.contextPath }/homepageframe/img/${vo.porgimg }" style="width: 100%; display: block; height:100%;top:0;left:0;right:0;"/>
				<input id="del" type="button" value="Delete" onclick="proDelete()" >
			</div>
			</td>
			
		</tr>
	
		<tr>
		<th>OPEN CHECK<span class="t_red"> *</span></th>
		<td>
		<select name= "popen" style="font-size: 18px; background-color: #121418; color: white;">
		<option value= "1">비공개</option>
		<option value= "2">일촌공개</option>
		<option value= "3">전체공개</option>
		</select>
		</td>
		</tr>
		</tbody>

	</table>
	<div class="btn_right mt15" style=" float: right;" >
	<input type="button" class="btn  mr5" value="메인으로" style="width: 100px; height: 40px; font-weight:900;  font-size: 16px;" onclick="toMain()">
 	<input type="submit" class="btn " value="수정하기"  style="width: 100px; height: 40px; font-weight:900;  font-size: 16px; "  >
	<input type= "hidden" name = "id" value= "${param.id}"> 
	<input type= "hidden" name = "gid" value= "${param.id}"> 
	<input type = "hidden" name = "code" value = "1">
 	 </div>
	 </form>
	</div>
</div>
</div>
<script type="text/javascript">
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

	function  UpdateCommit() {
		//alert("등록을 완료하였습니다.");
		
		if(confirm("수정을완료하였습니다 홈으로가시겠습니까? \n \t home:확인 \t 취소:현재페이지")==true) {
			 return true;
		}else{
			return false;
		}
	}

	function  proDelete() {
		if(confirm("삭제를 하시겠습니까?")==true){
			console.log(${requestScope.id})
			location.href = "${pageContext.request.contextPath}/profile/delete?id=${param.id}";
	
		}
		
	}
	if(${param.code==1}) {
		alert('삭제를 완료하였습니다.');
	}
	
	function  toMain() {
		 	window.location.replace("${pageContext.request.contextPath}/home");
	}
	
	
	
	
	
</script>



</body>
</html>