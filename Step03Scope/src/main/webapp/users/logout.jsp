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
	<%
		session.removeAttribute("nick");
	%>
	<p>로그아웃 되었습니다.</p>
	<a href="${pageContext.request.contextPath}/">인덱스로</a>
</body>
</html>