<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<style>
	#profileImage {
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
	<div class="container">
	
		<h1>가입 정보 입니다.</h1>
		
		<table>
			<tr>
				<th>아이디</th>
				<td><%=id%></td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
					<% if(dto.getProfile() == null){ %>
						등록된 이미지 없음
					<% }else{ %>
						<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile() %>" />
					<% } %>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="pwd_update_form.jsp">수정하기</a></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail()%></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
		</table>
		
		<a href="update_form.jsp">개인정보 수정</a>
		
	</div>
	
</body>
</html>