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
	<h1>Promise 테스트</h1>
	<script>
		new Promise(function(resolve, reject) {
			let data = {num:1, name:"갑"};
			resolve(data);
			console.log("resolve함수 호출");
		}).then(function() {
			console.log(".then 호출");
		}).catch(function() {
			console.log(".catch 호출");
		});
	</script>
</body>
</html>