<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 관리</title>
<style type="text/css">
	*{margin:0px;padding:0px;}
	body{background-color: black;}
	.btn1{width:100px; height:40px; font-size:16px; border:2px solid black; background-color:black; color:white; border:2px solid white;}
	tr{height:50px;}
	th{width:150px; background-color:#ccc}
	td{width:650px; background-color: #eee}
	.input{margin-left:20px;}
</style>
</head>
<body>
<div id="wrap" style="margin:auto; margin-top:100px; width:800px; height: 800px; padding-left:100px; padding-right:100px; border-color: white; border-style: dotted;">
	<div style="padding-top:50px; ">
	<h1 style="padding-top:50px; margin-bottom:10px; color:white;">사용자 정보 관리</h1>
	
	<form method="post" action="${pageContext.request.contextPath }/login/regist" style="margin-top:50px;">
		<div id="registBox" >
		<table>
		
		<tr>
			<th class="title">
				아이디
			</th>
			<td>
				<span class="input">${vo.id }</span>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				<input type="button" class="input" id="pwdbtn"value="비밀번호 변경">
			</td>
		</tr>
		<tr>
			<th>
				닉네임
			</th>
			<td>
				<input class="input" name="name" id="name" value="${vo.name }" >
				<span id="namecheck"></span>
			</td>
		</tr>
		<tr>
			<th>
				이메일
			</th>
			<td>
				<input type="email" class="input" name="email" id="email" value="${vo.email }" >
				<span id="emailcheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				전화번호
			</th>
			<td>
				<input name="phone" class="input" id="phone" value="${vo.phone }">
				<span id="phonecheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호질문
			</th>
			<td>
			<select name="question" class="input" id="question">
				<option value="출신 초등학교 이름은?" class="option">출신 초등학교 이름은?</option>
				<option value="가장 좋아하는 음식은?" class="option">가장 좋아하는 음식은?</option>
				<option value="가장 좋아하는 책은?" class="option">가장 좋아하는 책은?</option>
				<option value="가장 존경하는 사람은?" class="option">가장 존경하는 사람은?</option>
				<option value="가장 좋아하는 장소는?" class="option">가장 좋아하는 장소는?</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호답안
			</th>
			<td>
				<input name="answer" class="input" id="answer" value="${vo.answer }">
				<span id="answercheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				캐시
			</th>
			<td>
				<span  class="input">${vo.money } 코인</span>
				<input type="button" value="코인 충전" id=charge>
			</td>
		</tr>
		</table>
			
			
		</div>
		<div id="buttons" style="padding-top:5px; padding-left:590px;">		
			<input class="btn1" type="submit" id="updatebtn" value="수정" disabled="disabled" style="background-color: silver;">
			<input class="btn1" type="button" id="cancelbtn" value="취소">
		</div>
	</form>	
	</div>
</div>
</body>
<script type="text/javascript">
	var option=document.getElementsByClassName("option");
	var question="${vo.question}";
	var pwdbtn=document.getElementById("pwdbtn");
	var updatebtn=document.getElementById("updatebtn");
	var cancelbtn=document.getElementById("cancelbtn");
	var name=document.getElementById("name");
	var n=name.value;
	var email=document.getElementById("email");
	var e=email.value;
	var phone=document.getElementById("phone");
	var answer=document.getElementById("answer");
	var charge=document.getElementById("charge");
	console.log(name);
	console.log(e);
	console.log(phone.value);
	console.log(answer.value);
	var namecheck=document.getElementById("namecheck");
	var emailcheck=document.getElementById("emailcheck");
	var phonecheck=document.getElementById("phonecheck");
	var answercheck=document.getElementById("answercheck");

	var checking=31;
	
	for(let i=0;i<option.length;i++){
		if(question==option[i].value) option[i].selected="selected";
	}
	cancelbtn.onclick=function(){
		alert("메인으로 돌아갑니다.");
		window.location.href= "${pageContext.request.contextPath }/home";
	};
	
	name.onfocus=function(){
		console.log(name.value);
		if(checking%2==1)checking-=1;
		console.log(checking);
		updatebtn.disabled=true;
		updatebtn.style.backgroundColor="silver";
	}
	email.onfocus=function(){
		if(checking%4>=2)checking-=2;
		console.log(checking);
		updatebtn.disabled=true;
		updatebtn.style.backgroundColor="silver";
	}
	phone.onfocus=function(){
		if(checking%8>=4)checking-=4;
		console.log(checking);
		updatebtn.disabled=true;
		updatebtn.style.backgroundColor="silver";
	}
	answer.onfocus=function(){
		if(checking%16>=8)checking-=8;
		console.log(checking);
		updatebtn.disabled=true;
		updatebtn.style.backgroundColor="silver";
	}
	
	name.onblur=function(){
		console.log(name.value);
		if(name.value=="" || name.value==null){
			namecheck.innerHTML="닉네임을 입력하세요";
		}else{
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml= xhr.responseXML;
					let using = xml.getElementsByTagName("using")[0].textContent;
					if(using=="true" && name.value!=n){
						namecheck.innerHTML="이미 사용되는 닉네임입니다";
					}
					else {
						namecheck.innerHTML="";
						if(checking%2==0)checking+=1;	
						console.log(checking);
						if(checking==31){
							updatebtn.disabled=false;
							updatebtn.style.backgroundColor="black";
						}
					}
				}		
			};
			xhr.open('get','${pageContext.request.contextPath}/login/nameoverlapck?name='+name.value,true);
			xhr.send();
			}
	}
	email.onblur=function(){

		if(email.value==""){
			emailcheck.innerHTML="이메일을 입력하세요";
		}else{
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml= xhr.responseXML;
					let using = xml.getElementsByTagName("using")[0].textContent;
					if(using=="true" && email.value!=e){
						emailcheck.innerHTML="이미 사용되는 이메일입니다";
					}
					else {
						emailcheck.innerHTML="";		
						if(checking%4<=2)checking+=2;	
						console.log(checking);
						if(checking==31){
							updatebtn.disabled=false;
							updatebtn.style.backgroundColor="black";
						}
					}
				}		
			};
			xhr.open('get','${pageContext.request.contextPath}/login/emailoverlapck?email='+email.value,true);
			xhr.send();			
		}
	};
		
	
	phone.onblur=function(){

		let cck=false;
		for(let i=0;i<phone.value.length;i++){
			let c=phone.value.charCodeAt(i);
			if((c>='0'.charCodeAt(0)&&c<='9'.charCodeAt(0))){
				cck=true;
			}
			else{cck=false;break;}
		}
		console.log(cck+" "+phone.value.length);
		if(!cck){
			phonecheck.innerHTML="숫자만 입력해 주세요";
		}else if(!(phone.value.length==10 || phone.value.length==11)){
			phonecheck.innerHTML="전화번호를 입력하세요";
		}else{
			phonecheck.innerHTML="";	
			if(checking%8<=4)checking+=4;
			console.log(checking);
			if(checking==31){
				updatebtn.disabled=false;
				updatebtn.style.backgroundColor="black";
			}
		}
	}
	answer.onblur=function(){
		if(answer.value==""){
			answercheck.innerHTML="답을 입력하세요";
		}else{
			answercheck.innerHTML="";	
			if(checking%16<=8)checking+=8;
			console.log(checking);
			if(checking==31){
				updatebtn.disabled=false;
				updatebtn.style.backgroundColor="black";
			}
		}
	}
	pwdbtn.onclick=function(){
		window.location.href= "${pageContext.request.contextPath }/updatemember/updatepwd";
	}
	
</script>
</html>