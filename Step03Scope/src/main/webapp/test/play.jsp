<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nick = (String)session.getAttribute("nick");
	if(nick == null) {
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<p><strong><%=nick %></strong>님 안녕하세요.</p>
	<a href="${pageContext.request.contextPath}/">인덱스로</a>
</body>
</html>