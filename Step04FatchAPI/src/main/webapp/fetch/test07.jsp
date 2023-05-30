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
<!-- f1 -->
	<h1>폼에 입력한 내용을 페이지 전환없이 전송</h1>
	<form action="login.jsp" id="myForm" method="post">
		<input type="text" name="id" placeholder="아이디 입력" />
		<input type="text" name="pwd" placeholder="비밀번호 입력" />
		<button type="submit">로그인</button>
	</form>
	
	<!-- f2 -->
	<h1>폼에 입력한 내용을 페이지 전환없이 전송(my_util이용)</h1>
	<form action="login.jsp" id="myForm2" method="post">
		<input type="text" name="id" placeholder="아이디 입력" />
		<input type="text" name="pwd" placeholder="비밀번호 입력" />
		<button type="submit">로그인</button>
	</form>
	<script src = ${pageContext.request.contextPath}/js/my_util.js></script>
	
	<script>
	//f1
		/*
			폼 내부의 submit 버튼을 클릭할 경우 폼 요소에서는 submit 이벤트가 발생한다.
			따라서 .addEventListener("submit",() => {})를 이용가능하다.
		*/
		document.querySelector("#myForm").addEventListener("submit",(e) => {
			//submit의 기능인 새로고침을 막는다.
			e.preventDefault(); 
			
			const data = new FormData(e.target);
			const queryString = new URLSearchParams(data).toString();
			
			fetch("login.jsp", {
				method : "POST",
				headers : {"Content-Type" : "application/x-www-form-urlencoded; charset=utf-8"},
				body : queryString
			})
			.then(res => res.json())
			.then((data) => {
				console.log(data);
			});
		});
		
		//f2
		document.querySelector("#myForm2").addEventListener("submit",() => {
			e.preventDefault();
			
			ajaxFormPromise(e.target)
			.then(res => res.json())
			.then((data) => {
				console.log(data);
			});
		});
	</script>
</body>
</html>