<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = new ArrayList<>();
	list.add("가나다라");
	list.add("마바사");
	list.add("아자차카");
%>

<%for(String tmp:list){ %>
	<li><%=tmp %></li>
<%} %>