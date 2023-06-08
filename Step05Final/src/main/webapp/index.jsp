<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<% if (id != null) { %>
		<p>
			<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a>님 로그인중
			<a href="${pageContext.request.contextPath }/users/logout.jsp" class="btn btn-primary">로그아웃</a>
		</p>
		<% } else { %>
		<a href="${pageContext.request.contextPath }/users/login_form.jsp">로그인</a>
		<% } %>
		<h1>인덱스 페이지 입니다.</h1>
		<div class="list-group">
			<a href="${pageContext.request.contextPath }/users/signup_form.jsp" class="list-group-item list-group-item-action">회원가입</a>
			<a href="${pageContext.request.contextPath}/private/game.jsp" class="list-group-item list-group-item-action">게임하기(로그인 필요)</a>
			<a href="${pageContext.request.contextPath}/private/study.jsp" class="list-group-item list-group-item-action">공부하기(로그인 필요)</a>
			<a href="file/list.jsp" class="list-group-item list-group-item-action">자료실</a>
			<a href="test/signup_form.jsp" class="list-group-item list-group-item-action">form 테스트</a>
		</div>
	</div>
</body>
</html>