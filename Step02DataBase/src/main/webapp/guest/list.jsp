<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
GuestDao dao = GuestDao.getInstance();
List<GuestDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-left">글 목록</h3>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>글 제목</th>
							<th>글쓴이</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (GuestDto temp : list) {
						%>
						<tr>
							<td><%=temp.getNum()%></td>
							<td><%=temp.getContent()%></td>
							<td><%=temp.getWriter()%></td>
							<td><a href="update_form.jsp?num=<%=temp.getNum()%>">수정</a></td>
							<td><a href="delete_form.jsp?num=<%=temp.getNum()%>">삭제</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<a href="insert_form.jsp">글작성</a>
			</div>
		</div>
	</div>
</body>
</html>