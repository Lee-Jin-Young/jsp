<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>자세히보기</h1>


		<div>
			<label for="num">글번호</label>
			<p><%=dto.getNum()%></p>
			<label for="writer">제목</label>
			<p><%=dto.getWriter()%></p>
			<label for="writer">작성자</label>
			<p><%=dto.getWriter()%></p>
			<label for="viewCount">조회수</label>
			<p><%=dto.getViewCount()%></p>
			<label for="regdate">작성일</label>
			<p><%=dto.getRegdate()%></p>
		</div>
		<div>
			<p><%=dto.getContent()%></p>
		</div>


		<a href="${pageContext.request.contextPath}/cafe/private/update_form.jsp?num=<%=dto.getNum()%>">수정하기</a>
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">글 목록으로</a>
	</div>
</body>
</html>