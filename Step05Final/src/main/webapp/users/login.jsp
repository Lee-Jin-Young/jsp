<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	boolean isValid= UsersDao.getInstance().isValid(dto);
	
	if(isValid) {
		session.setAttribute("id", id);
	}
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
	
		<% if(isValid) { %>
			<p class="alert alert-success">
				<strong><%=dto.getId()%></strong>님 로그인 되었습니다.
				<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">확인</a>
			</p>
		<% } else { %>
			<p class="alert alert-danger">
				아이디 혹은 비밀번호가 일치하지 않습니다.
				<a href="login_form.jsp" class="btn btn-primary">다시시도</a>
			</p>
		<% } %>
		
	</div>
</body>
</html>