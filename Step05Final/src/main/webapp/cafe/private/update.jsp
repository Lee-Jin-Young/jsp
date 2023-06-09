<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	CafeDto dto=CafeDao.getInstance().getData(num);
	
	//로그인 아이디와 작성자 아이디 확인
	String id=(String)session.getAttribute("id");

	dto.setNum(dto.getNum());
	dto.setWriter(dto.getWriter());
	dto.setContent(dto.getContent());

	boolean isSuccess = CafeDao.getInstance().update(dto);
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
	<div class="container">
	
		<h1>알림</h1>
		
		<%
		if (isSuccess) {
		%>
		<p class="alert alert-success">
			<strong><%=num%></strong> 번 글을 수정 했습니다.
		</p>
		<a href="list.jsp">목록보기</a>
		<%
		} else {
		%>
		<p class="alert alert-danger">
			수정 실패 <a class="alert-link" href="update_form.jsp?num=<%=num%>">재수정</a>
			<a href="list.jsp">리스트로</a>
		</p>
		<%
		}
		%>
		
	</div>
</body>
</html>