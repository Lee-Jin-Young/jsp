<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
<style>
	.active {
		border : 1px solid red;
		background-color : yellow;
	}
</style>
</head>
<body>
	<h1>이벤트 처리</h1>
	<ul id="myNav">
		<li><a href="#">one</a></li>
		<li><a href="#">two</a></li>
		<li><a href="#">three</a></li>
	</ul>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		//id가 myNav인 자손요소 a
		$("#myNav a").on("focus", function(e) {
			// .parent는 부모요소
			$(e.target).parent().addClass("active");
		});
		$("#myNav a").on("blur", function(e) {
			$(e.target).parent().removeClass("active");
		});
	</script>
</body>
</html>