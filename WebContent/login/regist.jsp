<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	<h1 style="padding-top:50px; margin-bottom:10px; color:white;">회원가입</h1>
	
	<span style="color:white;">아래의 내용을 모두 입력해 주세요</span>
	<form method="post" action="${pageContext.request.contextPath }/login/regist" style="margin-top:50px;">
		<div id="registBox" >
		<table>
		
		<tr>
			<th class="title">
				아이디
			</th>
			<td>
				<input type="text" class="input" name="id" id="id" value=>
				<span id="idcheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호
			</th>
			<td>
				<input class="input" type="password" id="pwd" name="pwd" value=>
				<span id="pwdcheck"></span>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호 확인
			</th>
			<td>
				<input type="password" id="pwdchk" class="input">
				<span id="pccheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				닉네임
			</th>
			<td>
				<input name="name" class="input" id="name" value="${vo.name }">
			<span id="namecheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				이메일
			</th>
			<td>
				<input type="email" class="input" name="email" id="email" >
				<span id="emailcheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				전화번호
			</th>
			<td>
				<input name="phone" class="input" id="phone" placeholder="('-'는 제외)" >
				<span id="phonecheck" ></span>
			</td>
		</tr>
		<tr>
			<th>
				비밀번호 질문
			</th>
			<td>
				<select name="question" class="input" id="question">

				<option value="">--- 선택하세요 ---</option>
				<option value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
				<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
				<option value="가장 좋아하는 책은?">가장 좋아하는 책은?</option>
				<option value="가장 존경하는 사람은?">가장 존경하는 사람은?</option>
				<option value="가장 좋아하는 장소는?">가장 좋아하는 장소는?</option>
			</select>
			<span id="questcheck" ></span>
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
		</table>
			
			
		</div>
		<div id="buttons" style="padding-top:5px; padding-left:700px;">		
			<input class="btn1" type="submit" id="registbtn" value="회원가입" disabled="disabled" style="background-color: silver;">
		</div>
		<br><div style="height:70px"></div>	
	</form>	
	</div>
</div>
<script type="text/javascript">
	var checking=0;
	const id=document.getElementById("id");
	const pwd=document.getElementById("pwd");
	const pwdchk=document.getElementById("pwdchk");
	const name=document.getElementById("name");
	const email=document.getElementById("email");
	const phone=document.getElementById("phone");
	const question=document.getElementById("question");
	const answer=document.getElementById("answer");
	
	const idcheck=document.getElementById("idcheck");
	const pwdcheck=document.getElementById("pwdcheck");
	const pccheck=document.getElementById("pccheck");
	const namecheck=document.getElementById("namecheck");
	const emailcheck=document.getElementById("emailcheck");
	const phonecheck=document.getElementById("phonecheck");
	const questcheck=document.getElementById("questcheck");
	const answercheck=document.getElementById("answercheck");
	
	const buttons=document.getElementById("buttons");
	id.onfocus=function(){
		if(checking%2==1)checking-=1;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	pwd.onfocus=function(){
		if(checking%4>=2)checking-=2;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	pwdchk.onfocus=function(){
		if(checking%8>=4)checking-=4;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	name.onfocus=function(){
		if(checking%16>=8)checking-=8;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	email.onfocus=function(){
		if(checking%32>=16)checking-=16;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	phone.onfocus=function(){
		if(checking%64>=32)checking-=32;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	question.onfocus=function(){
		if(checking%128>=64)checking-=64;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	answer.onfocus=function(){
		if(checking%256>=128)checking-=128;
		console.log(checking);
		buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" disabled=\"disabled\" style=\"background-color: silver; border:2px solid white;\">";
	}
	
	id.onblur=function(){
		let idValue=id.value;
		let cck=false;

		for(let i=0;i<idValue.length;i++){
			let c=idValue.charCodeAt(i);
			if((c>='A'.charCodeAt(0)&&c<='Z'.charCodeAt(0))||(c>='a'.charCodeAt(0)&&c<='z'.charCodeAt(0))||(c>='0'.charCodeAt(0)&&c<='9'.charCodeAt(0))){
				cck=true;
			}
			else{cck=false;break;}
		}
		if(!cck||idValue.length<5){idcheck.innerHTML="영어 또는 숫자를 포함한 5자리 이상의 코드를 입력하세요";}
		else{
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml= xhr.responseXML;
					let using = xml.getElementsByTagName("using")[0].textContent;
					if(using=="true"){
						idcheck.innerHTML="이미 존재하는 아이디입니다";
					}
					else {
						idcheck.innerHTML="사용할 수 있는 아이디입니다.";
						if(checking%2==0)checking+=1;	
						console.log(checking);
						if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
					}
				}		
			};
			xhr.open('get','idoverlapck?id='+idValue,true);
			xhr.send();			
		}
	};
	
	pwd.onblur=function(){
		let pwdValue=pwd.value;
		let cck1=false;
		let cck2=false;
		let cck3=false;
		let cck4=false;

		for(let i=0;i<pwdValue.length;i++){
			let c=pwdValue.charCodeAt(i);
			if((c>='A'.charCodeAt(0)&&c<='Z'.charCodeAt(0))||(c>='a'.charCodeAt(0)&&c<='z'.charCodeAt(0))){
				cck1=true;cck2=true;
			}
			else if((c>='0'.charCodeAt(0)&&c<='9'.charCodeAt(0))){
				cck1=true;cck3=true;
			}
			else{cck1=false;break;}
			if(cck2&&cck3)cck4=true;
		}
		if(!cck1||!cck4||pwdValue.length<8){pwdcheck.innerHTML="영어와 숫자를 포함한 8자리 이상의 코드를 입력하세요";}
		else {
			pwdcheck.innerHTML="사용할 수 있는 비밀번호입니다";		
			if(checking%4<=2)checking+=2;	
			console.log(checking);
			if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
		}
	};
	pwdchk.onblur=function(){
		let pwdValue=pwd.value;
		let chkValue=pwdchk.value;
		if(chkValue!=null&&pwdValue==chkValue){
			pccheck.innerHTML="비밀번호와 동일합니다";
			if(checking%8<=4)checking+=4;
			console.log(checking);
			if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
		}else{
			pccheck.innerHTML="비밀번호와 일치하지 않습니다";
		}
	}
	name.onblur=function(){
		let nameValue=name.value;
		if(nameValue==""){
			namecheck.innerHTML="닉네임을 입력하세요";
		}else{
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml= xhr.responseXML;
					let using = xml.getElementsByTagName("using")[0].textContent;
					if(using=="true"){
						namecheck.innerHTML="이미 사용되는 닉네임입니다";
					}
					else {
						namecheck.innerHTML="";
						if(checking%16<=8)checking+=8;
						console.log(checking);
						if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
					}
				}		
			};
			xhr.open('get','nameoverlapck?name='+nameValue,true);
			xhr.send();
			}
	}
	email.onblur=function(){
		let emailValue=email.value;
		if(emailValue==""){
			emailcheck.innerHTML="이메일을 입력하세요";
		}else{
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let xml= xhr.responseXML;
					let using = xml.getElementsByTagName("using")[0].textContent;
					if(using=="true"){
						emailcheck.innerHTML="이미 사용되는 이메일입니다";
					}
					else {
						emailcheck.innerHTML="";		
						if(checking%32<=16)checking+=16;
						console.log(checking);
						if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
					}
				}		
			};
			xhr.open('get','emailoverlapck?email='+emailValue,true);
			xhr.send();			
		}
	};
		
	
	phone.onblur=function(){
		let phoneValue=phone.value;
		let cck=false;
		for(let i=0;i<phoneValue.length;i++){
			let c=phoneValue.charCodeAt(i);
			if((c>='0'.charCodeAt(0)&&c<='9'.charCodeAt(0))){
				cck=true;
			}
			else{cck=false;break;}
		}
		console.log(cck+" "+phoneValue.length);
		if(!cck){
			phonecheck.innerHTML="숫자만 입력해 주세요";
		}else if(!(phoneValue.length==10 || phoneValue.length==11)){
			phonecheck.innerHTML="전화번호를 입력하세요";
		}else{
			phonecheck.innerHTML="";	
			if(checking%64<=32)checking+=32;
			console.log(checking);
			if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
		}
	}
	question.onblur=function(){
		let questValue=question.value;
		if(questValue==""){
			questcheck.innerHTML="질문을 선택하세요";
		}else{
			questcheck.innerHTML="";	
			if(checking%128<=64)checking+=64;
			console.log(checking);
			if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
		}
	}
	answer.onblur=function(){
		let answerValue=answer.value;
		if(answerValue==""){
			answercheck.innerHTML="답을 입력하세요";
		}else{
			answercheck.innerHTML="";	
			if(checking%256<=128)checking+=128;
			console.log(checking);
			if(checking==255){buttons.innerHTML="<input class=\"btn1\" type=\"submit\" id=\"registbtn\" value=\"회원가입\" style=\"background-color: black; border:2px solid white;\">";}
		}
	}
	
</script>
</body>
</html>