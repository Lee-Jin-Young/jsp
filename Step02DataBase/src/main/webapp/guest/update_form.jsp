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
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<h1>글 수정 페이지 입니다.</h1>

		<form action="update.jsp" method="post">
			<div>
				<label for="num">글번호</label>
				//기존 값(value)이 보이며 값(name)을 전송하지만 수정불가능(readonly)
				<input type="text" id="num" value ="<%=dto.getNum()%>" name="num" readonly>
			</div>
			<div>
				<label for="writer">작성자</label>
				//기존 값(value)이 보이며 값(name)을 전송함
				<input type="text" id="writer" value="<%=dto.getWriter()%>" name="writer">
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				//값(name)을 전송함
				<input type="text" id="pwd" name="pwd">
			</div>
			<div>
				//기존 값(innerText)이 보이며 값(name)을 전송함
				<textarea id="content" name="content"><%=dto.getContent()%></textarea>
			</div>
			<button type="submit">작성</button>
			<button type="reset">지우기</button>
		</form>

		<a href="list.jsp">글 목록으로</a>
	</div>
</body>
</html>