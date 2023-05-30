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
			resolve();
			console.log("resolve함수 호출");
		}).then(function() {
			console.log("첫번째 .then 호출");
			return new Promise(function(resolve, reject) {
				resolve();
			});
		}).then(function() {
			console.log("두번째 .then 호출");
		});
	</script>
</body>
</html>