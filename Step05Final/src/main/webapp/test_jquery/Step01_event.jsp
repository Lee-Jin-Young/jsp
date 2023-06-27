<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
<style>
	.box {
		width : 100px;
		height : 100px;
		border : 1px solid red;
	}
</style>
</head>
<body>
	<div class="box">div1</div>
	<div class="box">div2</div>
	<div class="box">div3</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$(".box").on("mouseover", function(e) {
			console.log(e.target);
			//$()에 참조값을 전달하면 해당 객체를 jquery를 통해 이용 가능
			$(e.target)
				.css("background-color", "yellow")
				.css("width", "200px")
				.css("height", "200px")
				.text("mouseover");
		});
	</script>
</body>
</html>