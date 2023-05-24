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
<title>/guest/update_form.jsp</title>
</head>
<body>
	<div class="container">
		<h1>글 수정 페이지 입니다.</h1>

		<form action="update.jsp" method="post">
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" value="<%=dto.getWriter()%>">
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="text" id="pwd" value="<%=dto.getPwd()%>">
			</div>
			<div>
				<textarea id="content" value="<%=dto.getContent()%>"></textarea>
			</div>
			<button type="submit">작성</button>
			<button type="reset">지우기</button>
		</form>

		<a href="list.jsp">글 목록으로</a>
	</div>
</body>
</html>