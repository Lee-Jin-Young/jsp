<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
FileDao dao = FileDao.getInstance();
List<FileDto> list = dao.getList();
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
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp" class="btn btn-primary">업로드</a>
		<h1>자료실</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for (FileDto temp : list) {%>
					<tr>
						<td><%=temp.getNum()%></td>
						<td><%=temp.getWriter()%></td>
						<td><%=temp.getTitle()%></td>
						<td><%=temp.getOrgFileName()%></td>
						<td><%=temp.getRegdate()%></td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</div>
</body>
</html>