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
	<h1>이벤트 처리</h1>
	<input type="text" id="inputMsg" placeholder="메세지 입력"/>
	<button id="sendBtn">전송</button>
	<p id="current"></p>
	<ul id="msgList">
		
	</ul>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#inputMsg").on("keyup", function(e) {
			console.log(e.keyCode);
			// 엔터키 입력
			if(e.keyCode == 13) {
				$("#sendBtn").click()
			}
			const msg = $(e.target).val();
			$("#current").text(msg);
		});
		
		$("#sendBtn").on("click", function() {
			const msg = $("#inputMsg").val();
			//$("li")는 $(document.createElement("li"))와 동일
			$("<li>").text(msg).appendTo("#msgList");
			$("#inputMsg").val("").focus();
		});
		
	</script>
</body>
</html>