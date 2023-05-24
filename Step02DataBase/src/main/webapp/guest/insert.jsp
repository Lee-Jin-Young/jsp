<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String pwd = request.getParameter("pwd");

GuestDto dto = new GuestDto();
dto.setWriter(writer);
dto.setContent(content);
dto.setPwd(pwd);

GuestDao dao = GuestDao.getInstance();

boolean isSuccess = dao.insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>/guest/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p class="alert alert-success">
			<strong><%=writer%></strong> 님의 글이 저장되었습니다.
		</p>
		<a href="list.jsp">리스트로</a>
		<%
		} else {
		%>
		<p class="alert alert-success">글 작성 실패</p>
		<a href="insert_form.jsp">다시 작성</a>
		<%
		}
		%>
	</div>
</body>
</html>