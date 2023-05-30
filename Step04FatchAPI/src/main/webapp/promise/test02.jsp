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
	<h1>Promise테스트</h1>
	<script>
		/*
			함수의 인자로 전달되는 resolve, reject는 함수
			- resolve : 작업 완료 시 호출
				- 호출 시 .then()의 함수를 실행
			- reject : 작업 실패 시 호출
				- 호출 시 .catch()의 함수를 실행
		*/
		let p1 = new Promise(function(resolve,reject) {
			//resolve();
			reject();
			console.log("reject함수 호출");
		});
		
		p1.then(function() {
			console.log(".then 호출");
		});
		
		p1.catch(function() {
			console.log(".catch 호출");
		})
	</script>
</body>
</html>