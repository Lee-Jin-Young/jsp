<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	GuestDto dto = new GuestDto();

	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String pwd = request.getParameter("pwd");

	dto.setNum(num);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setPwd(pwd);

boolean isSuccess = GuestDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>/guest/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p class="alert alert-success">
			<strong><%=num%></strong> 번 회원의 정보를 수정 했습니다.
		</p>
		<a href="list.jsp">목록보기</a>
		<%
		} else {
		%>
		<p class="alert alert-danger">
			수정 실패 <a class="alert-link" href="update_form.jsp?num=<%=num%>">재수정</a>
			<a href="list.jsp">리스트로</a>
		</p>
		<%
		}
		%>
	</div>
</body>
</html>