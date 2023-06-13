<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setWriter("hello!");
	dto.setTitle("안녕하세요!");
	
	request.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<%
			CafeDto result = (CafeDto)request.getAttribute("dto");
		%>
		<p>글번호 : <strong><%=dto.getNum()%></strong></p>
		<p>작성자 : <strong><%=dto.getWriter()%></strong></p>
		<p>제목 : <strong><%=dto.getTitle()%></strong></p>
		
		<h1>EL을 이용하여 작업하기</h1>
		<p>글번호 : <strong>${requestScope.dto.getNum()}</strong></p>
		<p>작성자 : <strong>${requestScope.dto.getWriter()}</strong></p>
		<%-- 필드면만 적으면 자동으로 getter 메소드를 호출 --%>
		<p>제목 : <strong>${dto.title}</strong></p>
	</div>
</body>
</html>