<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
String writer = (String) session.getAttribute("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

CafeDto dto = new CafeDto();
dto.setWriter(writer);
dto.setTitle(title);
dto.setContent(content);

CafeDao dao = CafeDao.getInstance();

boolean isSuccess = dao.insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>${pageContext.request.contextPath}</title>
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
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">리스트로</a>
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