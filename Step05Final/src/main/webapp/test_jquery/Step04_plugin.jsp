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
	<p>p1</p>
	<p id="one">p2</p>
	<p id="two">p3</p>
	<!-- jquery 로딩하기 -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- jquery plugin js 로딩하기 -->
	<script src="js/jquery.my.js"></script>
	<script>
		$("#one").my();
		$("#two").my({
			msg:"hello",
			color:"#ffff00"
		});
	</script>
</body>
</html>