<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/profile/css/common.css"/>
<style type="text/css">
*{margin:auto}
#wrap{20px ;}
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

</head>
<body>
<div class="wrap" style=" padding: 60px 60px 60px 60px; border-style: dotted;" >
	<div class="container">
	<div class= "inner">
	<h1 style="margin-left: 1em; font-size: 50pt; text-shadow:#999999 5px 5px 5px;" >BOARDWRITE</h1>
	<form id="boardForm" name="boardForm"  action="${pageContext.request.contextPath }/board/update" method="post" onsubmit ="return check()">
	<table   class="table02"  >
	<caption><strong style="font-size: 20px; color: #ffffff;">'<span class="t_red">*</span>' This mark is required input items.</strong></caption>
		<colgroup>
			<col width="30%">
			<col width="*">
		</colgroup>
		
		<tbody id="tbody" >
		<tr>
		<th>BOARD TITLE<span class="t_red"> *</span></th>
		<td><input  type= "text" id="btitle" name="btitle" value="${vo.btitle }" class="tbox1"  style=" width:400px; height:auto; background-color:  #121418;color: white;font-size: 16px;border: none; " autofocus="autofocus"  tabindex="1" onkeyup=""></td>
		</tr>
		<tr>
		<th>BOARD CONTENT<span class="t_red"> *</span></th>
        <td><textarea id="bcontent" name="bcontent" cols="10" rows="5" class="textarea01" style="width:700px; height:200px; background-color:  #121418;color: white;font-size: 16px;border: none;" tabindex="3" onkeyup="" >${vo.bcontent }</textarea></td>
		</tr>
	
		<tr>
		<th>OPEN CHECK<span class="t_red"> *</span></th>
		<td>
		<select name= "bopen" style="font-size: 18px; background-color: #121418; color: white;">
		<option value= "1">비공개</option>
		<option value= "2">일촌공개</option>
		<option value= "3">전체공개</option>
		</select>
		</td>
		</tr>
		</tbody>

	</table>
	<div class="btn_right mt15" style=" float: right;" >
	<input type= "hidden" name = "bnum" value= "${param.bnum}">
 	<input type="submit" class="btn " value="등록하기"  id ='btn2' style=" width: 100px; height: 40px; font-weight:900;  font-size: 16px;">

	 </div>
	 </form>
	 <script type="text/javascript">
	 function check(){
		 var btitle = document.getElementById("btitle").value;
		 var bcontent = document.getElementById("bcontent").value;
		 if(btitle==""){
			 alert("제목을 입력해주세요");
			 return false;
		 }else if(bcontent==""){
			 alert("내용을 입력해주세요");
			 return false;
			
		 }
		 var btitlelength = btitle.length
		 var bcontentlength = bcontent.length
		 if(btitlelength>10){
			 alert("제목을 10글자 이내로 작성해주세요 \n 현재 글자수 : "+btitle.length)
			 return false;
		 }
		 if(bcontentlength>100){
			 alert("내용을 100글자 이내로 작성해주세요 \n 현재 글자수 : "+btitle.length)
			 return false;
		 }
		
		 if(confirm("등록하시겠습니까?")==true) {
			return true;
		}else {
			return false;
		}
		 
	 }
	 </script>
	</div>
</html>