<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	String id=(String)session.getAttribute("id");
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<h1>게임 페이지 입니다.</h1>
	<p><%=id %> 님 게임해요</p>
</body>
</html>