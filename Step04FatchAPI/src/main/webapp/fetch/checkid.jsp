<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputId = request.getParameter("inputId");
	boolean canUse = true;
	if(inputId.equals("hello") || inputId.equals("wolrd")) {
		canUse = false;
	}
%>

{"canUse" : <%=canUse%>}