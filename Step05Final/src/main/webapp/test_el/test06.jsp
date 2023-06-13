<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cook = new Cookie("savedId", "Hello");
	cook.setMaxAge(60);
	response.addCookie(cook);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<h1></h1>
	<p>key가 savedId로 60초 동안 응답</p>
	<a href="test07.jsp">쿠키값 확인</a>
</body>
</html>