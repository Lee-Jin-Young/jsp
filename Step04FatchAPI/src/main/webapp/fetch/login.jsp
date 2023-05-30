<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean isValid = false;
	if(id.equals("hello")&&pwd.equals("1111")) {
		isValid = true;
	}
%>
{"isSuccess" : <%=isValid%>}