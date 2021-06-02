<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	.typing{width:100%; height:40px; font-size:30px; border:2px solid black;}
	.btn1{width:100%; height:40px; font-size:25px; border:2px solid black; background-color:#FF8224; color:white;}
	
</style>
</head>
<body>
<div id="wrap" style="margin:auto; width:600px; height: 800px; background-color:white;">
	<div style="padding-top:50px; padding-left:75px; width:450px;">
	<h1 style="padding-top:50px;">비밀번호 찾기</h1>
	
	<form method="post" action="${pageContext.request.contextPath }/login/findpwd">
		<div id="loginType" style="padding-top:60px; width:450px;">
			<input class="typing" id="id" name="id" placeholder="아이디"><br><div style="height:10px"></div>
			비밀번호질문   <select id="question" name="question" >
				<option value="">--- 선택하세요 ---</option>
				<option value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
				<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
				<option value="가장 좋아하는 책은?">가장 좋아하는 책은?</option>
				<option value="가장 존경하는 사람은?">가장 존경하는 사람은?</option>
				<option value="가장 좋아하는 장소는?">가장 좋아하는 장소는?</option>
			</select><br><div style="height:10px"></div>
			<input class="typing" id="answer" name="answer" placeholder="비밀번호답안"><br>
			
		</div>
		<div id="buttons" style="padding-top:40px; width:450px;">
			<input class="btn1" type="submit" value="비밀번호 찾기" disabled="disabled" style="background-color: silver;"><br><div style="height:5px"></div>
		</div>
	</form>	
	</div>
</div>
</body>
<script type="text/javascript">
	var checking=0;
	const buttons=document.getElementById("buttons");
	const id=document.getElementById("id");
	const question=document.getElementById("question");
	const answer=document.getElementById("answer");
	id.onfocus=function(){
		if(checking%2==1)checking-=1;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" value=\"비밀번호 찾기\" disabled=\"disabled\" style=\"background-color: silver;\">";
	}
	question.onfocus=function(){
		if(checking%4>=2)checking-=2;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" value=\"비밀번호 찾기\" disabled=\"disabled\" style=\"background-color: silver;\">";
	}
	answer.onfocus=function(){
		if(checking%8>=4)checking-=4;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" value=\"비밀번호 찾기\" disabled=\"disabled\" style=\"background-color: silver;\">";
	}
	id.onblur=function(){
		if(id.value!="" && id.value!=null){
			if(checking%2==0)checking+=1;
			console.log(checking);
			if(checking==7)buttons.innerHTML="<input class=\"btn1\" type=\"submit\" value=\"비밀번호 찾기\" style=\"background-color: #FF8224;\">";
		}
	}
	question.onblur=function(){
		if(question.value!="" && question.value!=null){
			if(checking%4<2)checking+=2;
			console.log(checking);
			if(checking==7)buttons.innerHTML="<input class=\"btn1\" type=\"submit\" value=\"비밀번호 찾기\" style=\"background-color: #FF8224;\">";
		}
	}
	answer.onblur=function(){
		if(answer.value!="" && answer.value!=null){
			if(checking%8<4)checking+=4;
			console.log(checking);
			if(checking==7)buttons.innerHTML="<input class=\"btn1\" type=\"submit\" value=\"비밀번호 찾기\" style=\"background-color: #FF8224;\">";
		}
	}
</script>
</html>