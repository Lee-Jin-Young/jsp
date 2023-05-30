<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>둘</li>
		<li>셋</li>
	</ul>
	
	<script>
		document.querySelector("#moreBtn").addEventListener("click", () => {
			fetch("get_msg2.jsp")
			.then(res => res.text())
			.then((data) => {
				console.log(data);
				const list=JSON.parse(data);
				
				for(let i=0; i<list.length; i++){
					let li=document.createElement("li");
					li.innerText=list[i];
					document.querySelector("#msgList").append(li);
				}
			});
			
		});
	</script>
</body>
</html>