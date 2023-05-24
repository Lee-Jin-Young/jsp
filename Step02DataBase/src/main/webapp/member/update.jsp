<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberDto dto = new MemberDto();

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	
	boolean isSuccess = MemberDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>/member/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p class="alert alert-success">
			<strong><%=num%></strong> 번 회원의 정보를 수정 했습니다.
		</p>
		<a href="list.jsp">목록보기</a>
		<%
		} else {
		%>
		<p class="alert alert-danger">
			수정 실패
			<a class="alert-link" href="update_form.jsp?num=<%=num %>">재수정</a>
			<a href="list.jsp">리스트로</a>
		</p>
		<%
		}
		%>
	</div>
</body>
</html>