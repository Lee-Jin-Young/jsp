<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//수업 중 간단히 테스트하기 위해 Servlet을 함께 작성함
	
	List<String> names = new ArrayList<String>();
	names.add("a");
	names.add("b");
	names.add("c");
	
	request.setAttribute("list",names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<%
		List<String> list = (List<String>)request.getAttribute("list");
	%>
	
	<h1>친구 목록</h1>
	<ul>
		<% for(String temp : list) {%>
			<li><%=temp %></li>
		<% } %>
	</ul>
	<%-- EL을 이용해 작성할 경우 --%>
	<h1>친구 목록(EL)</h1>
	<ul>
		<c:forEach var="temp" items="${requestScope.list}">
			<li>${temp} <strong>${status.index}</strong></li>
		</c:forEach>
	</ul>
	
	<%-- varStatus를 이용하면 인덱스나 순서 등을 얻어낼 수 있다. --%>
	<h1>친구 목록(EL) 인덱스 표시</h1>
	<ul>
		<c:forEach var="temp" items="${requestScope.list}" varStatus="status">
			<li>${temp} <strong>${status.index}</strong></li>
		</c:forEach>
	</ul>
	
	<h1>친구 목록(EL) 순서 표시</h1>
	<ul>
		<c:forEach var="temp" items="${requestScope.list}" varStatus="status">
			<li>${temp} <strong>${status.count}</strong></li>
		</c:forEach>
	</ul>
	
	<h1>친구 목록(EL) 첫번째 순서인지 여부</h1>
	<ul>
		<c:forEach var="temp" items="${requestScope.list}" varStatus="status">
			<li>${temp} <strong>${status.first}</strong></li>
		</c:forEach>
	</ul>
	
	<h1>친구 목록(EL) 마지막 순서인지 여부</h1>
	<ul>
		<c:forEach var="temp" items="${requestScope.list}" varStatus="status">
			<li>${temp} <strong>${status.last}</strong></li>
		</c:forEach>
	</ul>
</body>
</html>