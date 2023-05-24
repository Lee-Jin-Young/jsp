<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = MemberDao.getInstance().delete(num);

	/*
		리다이렉트 응답
			- 클라이언트에게 특정 경로로 요청을 다시 하라고 응답하는 것이다.
			- 다시 요청할 경로를 전달하면 클라이언트가 해당 경로로 요청을 다시 하게 된다.
			- HttpServletResponse객체의 기능을 활용
			- 요청을 다시할 경로를 전달할때는 절대경로로 전달하는것을 지향한다.
	*/

	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/member/list.jsp");
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