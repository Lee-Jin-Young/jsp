<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와 본다
String url = request.getParameter("url");
//만일 넘어오는 값이 없다면
if (url == null) {
	//로그인 후에 인덱스 페이지로 갈수 있도록 한다. 
	String cPath = request.getContextPath();
	url = cPath + "/index.jsp";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>로그인</h1>
		<form action="login.jsp" method="post">
			<div>
				<label for="id" class="form-label">아이디</label>
				<input type="text" class="form-control" name="id" id="id" />
			</div>
			<div>
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="text" class="form-control" name="pwd" id='pwd' />
			</div>
			<button class="btn btn-primary" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>