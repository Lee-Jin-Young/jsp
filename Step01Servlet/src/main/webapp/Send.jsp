<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg=request.getParameter("msg");
	System.out.println("msg:"+msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Send.jsp</title>
</head>
<body>
	<p>메세지 받음</p>
	<p>전달 받은 메세지 <strong><%=msg %></strong></p>
</body>
</html>