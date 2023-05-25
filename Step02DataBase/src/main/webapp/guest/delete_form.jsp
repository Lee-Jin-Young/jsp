<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	GuestDto dto = GuestDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/delete_form.jsp</title>
</head>
<body>
	<div class="container">
		<h1>글 삭제 페이지 입니다.</h1>

		<form action="delete.jsp" method="get">
			<div>
				<label for="num">글번호</label>
				<input type="text" id="num" value ="<%=dto.getNum()%>" name="num" readonly>
			</div>
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" value="<%=dto.getWriter()%>" readonly>
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="text" id="pwd" name="pwd">
			</div>
			<div>
				<textarea id="content" readonly><%=dto.getContent()%></textarea>
			</div>
			<button type="submit">삭제</button>
		</form>

		<a href="list.jsp">글 목록으로</a>
	</div>
</body>
</html>