<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = "all">
</div>

<div id = "pageDiv">

</div>
<script type="text/javascript">
function list(pageNum){
	reload();
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		console.log("1");
		if(xhr.readyState==4&&xhr.status==200){
			xml = xhr.responseXML;
			length = xml.getElementsByTagName("fsnum").length;
			let all = document.getElementById("all");
			for(let i=0;i<length;i++){
				let fsnum = xml.getElementsByTagName("fsnum")[i].textContent;
				let fsgroup = xml.getElementsByTagName("fsgroup")[i].textContent;
				let fscontent = xml.getElementsByTagName("fscontent")[i].textContent;
				let gid = xml.getElementsByTagName("gid")[i].textContent;
				//let id = xml.getElementsByTagName("id")[i].textContent;
				let newDiv = document.createElement("div");
				let newTable = document.createElement("table");
				let newTr = document.createElement("tr");
				let newTd1 = document.createElement("td"); //일촌 이름
				newTd1.innerHTML = gid
				let newTd2 = document.createElement("td");//내용
				newTd2.innerHTML = fscontent
				let newTd3 = document.createElement("td"); // 삭제
				newTd3.onclick = fsdelete(fsgroup);
				
				newTr.appendChild(newTd1);
				newTr.appendChild(newTd2);
				newTr.appendChild(newTd3);
				newTable.appendChild(newTr);
				all.appendChild(newTable);
				
				}
				/* 
				pw.print("<page>");
				pw.print("<pageNum>"+pageNum+"</pageNum>");
				pw.print("<startPageNum>"+startPageNum+"</startPageNum>");
				pw.print("<endPageNum>"+endPageNum+"</endPageNum>");
				pw.print("<startRow>"+startRow+"</startRow>");
				pw.print("<endRow>"+endRow+"</endRow>");
				pw.print("</page>");
				*/
				let pageNum = xml.getElementsByTagName("pageNum")[0].textContent;
				let startPageNum = xml.getElementsByTagName("startPageNum")[0].textContent;
				let endPageNum = xml.getElementsByTagName("endPageNum")[0].textContent; 
				let startRow = xml.getElementsByTagName("startRow")[0].textContent; 
				let endRow = xml.getElementsByTagName("endRow")[0].textContent;
				console.log(startPageNum)
				console.log(endPageNum);
				let str = "";
				pageDiv = document.getElementById("pageDiv");
				for(let i=startPageNum;i<=endPageNum;i++){
					if(pageNum==i){
						str = str +"<a href = 'javascript:list("+i+")'>" +"<span style='color:black;font-weight: 900'>"+[i] +"</span>"+"</a>";
						
					}else{
						str = str +"<a href = 'javascript:list("+i+")'>" +"<span style='color:gray;font-weight: 900'>"+[i] +"</span>"+"</a>";
						
					}
				}
				console.log(str);
				pageDiv.innerHTML = str;
				console.log(pageDiv);
				
			
		}
	}
	xhr.open("get","${pageContext.request.contextPath}/friendsay/list?id=${param.id}&pageNum="+pageNum)
	xhr.send();
	
}
	list(1)

function reload(){
	let div = document.getElementById("all");
	let childs = div.childNodes;
	for(let i=childs.length-1;i>=0;i--){
		div.removeChild(childs.item(i))
	}
	}
function fsdelete(fsnum){
	console.log(fsnum)
}

</script>
</body>
</html>