<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지</h1>
			<ul>
				<li><a href="${pageContext.request.contextPath}/fortune">오늘의 운세</a></li>
				<li><a href="${pageContext.request.contextPath}/test/fortune.jsp">테스트</a></li>
				<li><a href="${pageContext.request.contextPath}/member">회원 한 명의 정보 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/friend/list">친구 이름 목록 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/member/list">회원 목록 보기</a></li>
				<li><a href="${pageContext.request.contextPath}/test/play.jsp">놀러가기</a></li>
			</ul>
			<form action="${pageContext.request.contextPath}/test/save.jsp" method="post">
				<input type="text" name="nick" placeholder="닉네임 입력">
				<button type="submit">닉네임 저장</button>
			</form>
			
			<%
				String nick = (String)session.getAttribute("nick");
				if(nick!=null) { %>
					<p><string><%=nick %></string>님 반갑습니다.</p>
					<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
				<%}
			%>
	</div>
</body>
</html>