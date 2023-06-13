<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String myName="김구라";
	/*
		해당 jsp 페이지 에서만 사용가능
	*/
	pageContext.setAttribute("myName", myName);

	String yourName="해골";
	/*
		request scope 에 담은 값은 응답하기 전까지 사용가능
		- 다른 페이지로 forward 이동시에도 사용가능하지만 redirect 이동하면 사용불가능
	*/
	request.setAttribute("yourName", yourName);

	String ourName="원숭이";
	/*
		session scope 에 담은 값은 세션이 유지 되는 동안 사용가능
		- 다른 페이지로 forward, redirect 이동 해도 웹브라우저를 닫거나 세션을 초기화 하기 전까지 사용가능
	*/
	session.setAttribute("ourName", ourName);
	
	String companyName="에이콘";
	/*
		application scope 에 담은 내용은 서버를 끄기 전까지 사용가능
		- 웹브라우저를 닫아도 삭제되지 않음
	*/
   application.setAttribute("companyName", companyName);
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
		<h1>EL로 page scope에 저장된 값 추출</h1>
		<p>내 이름은 <strong>${pageScope.myName}</strong></p>
		<p>내 이름은 <strong>${myName}</strong></p>
		
		<h1>EL로 request scope에 저장 된 값 추출</h1>
		<p>너의 이름은 <strong>${requestScope.yourName}</strong></p>
		<p>너의 이름은 <strong>${yourName}</strong></p>
		<%-- 위의 EL은 아래의 두 줄을 대체 가능하다. --%>
		<% String result = (String)request.getAttribute("yourName"); %>
		<p>너의 이름은 <strong><%=result%></strong></p>
		
		<h1>EL로 session scope에 저장 된 값 추출</h1>
		<p>우리 이름은 <strong>${sessionScope.ourName}</strong></p>
		<p>우리 이름은 <strong>${ourName}</strong></p>
		<%-- 위의 EL은 아래의 두 줄을 대체 가능하다. --%>
		<% String result2 = (String)session.getAttribute("ourName"); %>
		<p>너의 이름은 <strong><%=result2%></strong></p>
		
		<h1>EL로 application scope에 저장 된 값 추출</h1>
		<p>학원 이름은 <strong>${applicationScope.companyName}</strong></p>
		<p>학원 이름은 <strong>${companyName}</strong></p>
	</div>
</body>
</html>