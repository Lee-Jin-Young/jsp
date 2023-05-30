<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메세지 입력..." />
	<button id="sendBtn">전송</button>
	<script>
		document.querySelector("#sendBtn").addEventListener("click", () => {
			const msg=document.querySelector("#msg").value;
			
			fetch("send.jsp?msg="+msg)
			.then(res => res.text())
			.then((data) => {
				console.log(data);
			});
		});
	</script>
</body>
</html>




