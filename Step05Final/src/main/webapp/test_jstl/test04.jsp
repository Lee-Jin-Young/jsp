<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setAttribute("score", 86);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<c:if test="true">
		<p>true</p>
	</c:if>
	
	<c:if test="${10%2 eq 0}"> 
		<p>10은 짝수입니다.</p>
	</c:if>
	
	<c:if test="${11%2 eq 0}">
		<p>11은 짝수입니다.</p>
	</c:if>
	
	<c:if test="${score%2 eq 0}">
		<p>${score}은 짝수입니다.</p>
	</c:if>
	
	<p>획득한 점수는 <strong>${score}</strong>입니다</p>
	<p>
		따라서 이번 학기 학점은 
		<%-- 다중if | switch --%>
		<c:choose>
			<%-- else if | case --%>
			<c:when test="${score ge 90}">A</c:when>
			<c:when test="${score ge 80}">B</c:when>
			<c:when test="${score ge 70}">C</c:when>
			<c:when test="${score ge 60}">D</c:when>
			<%-- else | default --%>
			<c:otherwise>F</c:otherwise>
		</c:choose>
	</p>
	
	<p>
		<strong>${score}</strong>는
		<c:choose>
			<c:when test="${score%2 eq 0}">짝수</c:when>
			<c:otherwise>홀수</c:otherwise>
		</c:choose>
		입니다.
	</p>
	
	<%
		String id = (String)session.getAttribute("id");
	%>
	
	<% if(id==null) { %>
		<p>로그인이 필요합니다.</p>
	<% } else { %>
		<p><strong><%=id%></strong>님 로그인</p>
	<% } %>
	
	<p>
		<c:choose>
			<c:when test="${empty id}">로그인이 필요합니다.</c:when>
			<c:otherwise><strong>${id}</strong>님 로그인</c:otherwise>
		</c:choose>
	</p>
	
</body>
</html>