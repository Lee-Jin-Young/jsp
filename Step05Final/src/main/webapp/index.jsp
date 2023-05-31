<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<%if(id != null){ %>
			<p>
				<strong><%=id %></strong> 님 로그인중
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		<%}else{ %>
			<a href="${pageContext.request.contextPath }/users/login_form.jsp">로그인</a>
		<%} %>
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/private/game.jsp">게임하기(로그인 필요)</a></li>
			<li><a href="${pageContext.request.contextPath}/private/study.jsp">공부하기(로그인 필요)</a></li>
		</ul>
	</div>
</body>
</html>