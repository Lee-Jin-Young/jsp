<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	CafeDto dto = new CafeDto();

	CafeDao dao = CafeDao.getInstance();
	List<CafeDto> list = dao.getListAll();
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
<div class="container">

	<h1>게시글 목록</h1>
	
	<a href="private/insert_form.jsp">새글 작성</a>
	
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<% for (CafeDto temp : list) { %>
				<tr>
					<td><%=temp.getNum()%></td>
					<td><%=temp.getWriter()%></td>
					<td><a href="detail.jsp?num=<%=temp.getNum()%>"><%=temp.getTitle()%></a></td>
					<td><%=temp.getViewCount()%></td>
					<td><%=temp.getRegdate()%></td>
					<td>
						<% if (temp.getWriter().equals(id)) { %>
							<a href="private/update_form.jsp?num=<%=temp.getNum()%>">수정</a>
						<% } %>
					</td>
					<td>
						<% if (temp.getWriter().equals(id)) { %>
							<a href="private/delete.jsp?num=<%=temp.getNum()%>">삭제</a>
						<% } %>
					</td>
				</tr>
				<% } %>
		</tbody>
	</table>
	
</div>
</body>
</html>