<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String email=request.getParameter("email");
	String profile=request.getParameter("profile");
	
	UsersDto dto=new UsersDto();
 	dto.setId(id);
 	dto.setEmail(email);
 	
 	if(!profile.equals("empty")){
 		dto.setProfile(profile);
 	}
 	
	boolean isSuccess = UsersDao.getInstance().update(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<script>
		<% if(isSuccess) { %>
			alert("수정완료");
			location.href="info.jsp";
		<% }else { %>
			alert("수정실패");
			location.href="update_form.jsp";
		<% } %>
	</script>
</body>
</html>