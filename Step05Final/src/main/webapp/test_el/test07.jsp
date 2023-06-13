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
	<p>saveId의 값 : ${cookie.sevedId.value}</p>
	<p>saveId의 값이 있는지 여부 : ${not empty cookie.savedId}</p>
</body>
</html>