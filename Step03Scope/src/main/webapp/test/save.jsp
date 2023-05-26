<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	/*
		HttpSession객체의 setAttribute(key, value)메소드를 이용하여 문자열 저장
		HttpSession객체를 이용하여 저장한 데이터는 강제로 삭제하거나,
		웹브라우저를 닫거나, 특정시간동안 새로운 요청이 없을 시 삭제된다.
	*/
	session.setAttribute("nick", nick);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<p><strong><%=nick %></strong>을 기억</p>
	<p>30분 동안 아무런 요청이 없어가 웹 브라우저를 닫을 때 삭제됨</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>