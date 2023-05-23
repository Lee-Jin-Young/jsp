<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
boolean isSuccess = MemberDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/delete.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p>
			<strong><%=num%></strong> 번 회원의 정보를 삭제 했습니다. <a href="list.jsp">목록보기</a>
		</p>
		<%
		} else {
		%>
		<p>
			삭제 실패! <a href="list.jsp">목록보기</a>
		</p>
		<%
		}
		%>
	</div>

</body>
</html>