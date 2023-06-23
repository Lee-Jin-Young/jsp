<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<input type="text" id="inputMsg" placeholder="문자열 입력"/>
		<button id="sendBtn">전송</button>
		<p id="result"></p>
	</div>
	
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		/* 
		자바스크립트 이용
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			const msg = document.querySelector("#inputMsg").value;
			document.querySelector("#result").innerText = msg;
		});
		*/
		
		/* 
		jquery 이용
		$() : css와 동일한 선택자를 소괄호 내부에 문자열로 작성시 jquery기능이 추가된 배열을 리턴함
		*/
		$("#sendBtn").on("click", ()=>{
			const msg = $("#inputMsg").val();
			$("#result").text(msg);
		});
	</script>
</body>
</html>