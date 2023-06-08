<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");	
	
	String currentPwd = UsersDao.getInstance().getData(id).getPwd();

	boolean isSuccess = false;
	if(currentPwd.equals(pwd)){
		UsersDto dto = new UsersDto();
		
		dto.setId(id);
		dto.setPwd(newPwd);
		
		isSuccess = UsersDao.getInstance().updatePwd(dto);
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
<div class="container">

	<% if(isSuccess){ %>
		<p>
			비밀 번호를 수정하고 로그 아웃되었습니다.
			<a href="${pageContext.request.contextPath }/users/login_form.jsp" class="btn btn-primary">다시 로그인</a>
		</p>
	<% }else{ %>
		<p>
			구 비밀번호가 일치하지 않습니다.
			<a href="${pageContext.request.contextPath }/users/private/pwd_update_form.jsp" class="btn btn-primary">다시 시도</a>
		</p>
	<% } %>
</div>
</body>
</html>



