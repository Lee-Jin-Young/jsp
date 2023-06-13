<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setAttribute("hobby", "game/programming/piano");
	request.setAttribute("friends", "가,나,다");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<h1>forTokens 활용</h1>
	
	<h2>취미 목록</h2>
	<ul>
		<c:forTokens var="temp" items="${hobby }" delims="/">
			<li>${temp }</li>
		</c:forTokens>
	</ul>
	
	<h2>친구 목록</h2>
	<ul>
		<c:forTokens var="temp" items="${friends }" delims=",">
			<li>${temp }</li>
		</c:forTokens>
	</ul>
</body>
</html>