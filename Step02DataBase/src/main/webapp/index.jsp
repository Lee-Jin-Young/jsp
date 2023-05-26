<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%-- /include/navbar.jsp 페이지는 이 부분만 응답 --%>
	<%-- include된 jsp페이지에 파라미터 전달 가능 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="cuttentPage"/>
	</jsp:include>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/member/list.jsp">회원
					목록보기</a></li>
			<li><a href="${pageContext.request.contextPath }/guest/list.jsp">방명록
					목록보기</a></li>
		</ul>
	</div>
</body>
</html>
