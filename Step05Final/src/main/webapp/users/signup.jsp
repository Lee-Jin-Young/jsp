<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");

UsersDto dto = new UsersDto();
dto.setId(id);
dto.setPwd(pwd);
dto.setEmail(email);

boolean isSuccess = UsersDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p>
			<strong><%=id%></strong>님 가입 되었습니다. <a href="login_form.jsp">로그인
				하러 가기</a>
		</p>
		<%
		} else {
		%>
		<p>
			가입이 실패 했습니다. <a href="signup_form.jsp">다시 가입하러 가기</a>
		</p>
		<%
		}
		%>
	</div>
</body>
</html>












