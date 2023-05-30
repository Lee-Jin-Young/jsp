<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				const arr=JSON.parse(data);
				
				for(let i=0; i<arr.length; i++) {
					let li=`<li>\${arr[i]}</li>`;
					document.querySelector("#msgList").insertAdjacentHTML("beforeend", li);		
				}
			});
		});
	</script>
</body>
</html>




