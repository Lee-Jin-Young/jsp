<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	boolean isSuccess = GuestDao.getInstance().delete(num, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p>
			<strong><%=num%></strong> 번 글을 삭제 했습니다. <a href="list.jsp">목록보기</a>
		</p>
		<%
		} else {
		%>
		<p>
			삭제 실패 <a href="list.jsp">목록보기</a>
		</p>
		<%
		}
		%>
	</div>
</body>
</html>