<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

 .container {background-color:#121418; z-index:1; margin-left:3vh;  margin-top:3.5vh; height:600px; overflow-y: auto;  border-bottom-style: dotted; border-color :white;  width:900px;}
  .container::-webkit-scrollbar { width: 5px; /*스크롤바의 너비*/ } 
  .container::-webkit-scrollbar-thumb { background-color: black; /*스크롤바의 색상*/ } 
  .container::-webkit-scrollbar-track { background-color: white; /*스크롤바 트랙 색상*/ } 



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

</style>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
</head>
<body>

<div class="wrap" style=" padding: 60px 60px 60px 60px;  border-style: dotted;" >
	<div class="container">
	<div class= "inner">
		<h1>Gallery</h1>
	<form id="galleryForm" name="galleryForm"  action="${pageContext.request.contextPath }/gallery/update?galnum=${vo.galnum}" enctype="multipart/form-data" method="post"  onsubmit="return UpdateCommit()">
	<table   class="table02"  >
	<caption><strong style="font-size: 20px; color: #ffffff;">'<span class="t_red">*</span>' This mark is required input items.</strong></caption>
		<colgroup>
			<col width="30%">
			<col width="*">
		</colgroup>
		
		<tbody id="tbody" >
		<tr>
		<th>GALLERY TITLE<span class="t_red"> *</span></th>
		<td><input  type= "text" id="galtitle" name="galtitle" value="${vo.galtitle }" class="tbox1"  style=" width:400px; height:auto; background-color:  #121418;color: white;font-size: 16px;border: none; " autofocus="autofocus"  tabindex="1" onkeyup="moveFocus(this);"></td>
		</tr>

		<tr>
		<th>CONTENTS<span class="t_red"> *</span></th>
        <td><textarea id="content" name="content" cols="10" rows="5" class="textarea01" style="width:700px; height:200px; background-color:  #121418;color: white;font-size: 16px;border: none;" tabindex="3" onkeyup="moveFocus(this);" >${vo.galcontent }</textarea></td>
		</tr>
		<tr>
			<th>MY PICTURE<br>(Attached File)</th>
			
			<td colspan="3" id="img_td">[Exisiting File Name ${vo.galorgname }] <br><br><input type="file" name="imgfile" id="imgfile"  style="font-size: 16px; width: 360px; height: auto; background-color:  #121418;color: white; border: none; background-color:  #121418;color: white;font-size: 16px;border: none;" onchange="readURL(this)">				
			<div class="del">
			<img id="preview"  src="${pageContext.request.contextPath }/homepageframe/gimg/${vo.galorgname }"style="width: 100%; display: block; height:100%;top:0;left:0;right:0;" />
			<input id="del" type="button" value="Delete" onclick="galDelete()" >
			</div>
			</td>
		</tr>
	
		<tr>
		<th>OPEN CHECK<span class="t_red"> *</span></th>
		<td>
		<select name= "galopen" style="font-size: 18px; background-color: #121418; color: white;">
		<option value= "1">비공개</option>
		<option value= "2">일촌공개</option>
		<option value= "3">전체공개</option>
		</select>
		</td>
		</tr>
		</tbody>

	</table>
	<div class="btn_right mt15" style=" float: right;" >

	<input type="button" class="btn  mr5" value="메인으로" style="width: 100px; height: 40px; font-weight:900;  font-size: 16px; ">
 	<input type="submit" class="btn " value="수정하기"  style="width: 100px; height: 40px; font-weight:900;  font-size: 16px; "  >
 	<!--  	<input type="submit" class="btn " value="등록하기"  id ='btn2' style="display:none; width: 100px; height: 40px; font-weight:900;-->

	 </div>
	 </form>
	</div>
</div>
</div>
<script type="text/javascript">
function moveFocus(e) {
	if(event.keyCode==13) {
		var f =document.getElementById("galleryForm");
		f.elements[e.tabIndex].focus();
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

 
	function  galDelete() {
		if(confirm("삭제를 하시겠습니까?")==true){
			console.log(${requestScope.id})
			location.href = "${pageContext.request.contextPath}/gallery/delete?galnum=${vo.galnum}";
	
		}
		
	}
	if(${param.code==1}) {
		alert('삭제를 완료하였습니다.');
	}
	
	function  toMain() {
		 	window.location.replace("${pageContext.request.contextPath}/home");
	}
	
 
 
 
 
 /*
 var filebox = document.getElementById("imgfile");
	filebox.innerHTML = "Choice File"
 */

	</script>
</body>
</html>