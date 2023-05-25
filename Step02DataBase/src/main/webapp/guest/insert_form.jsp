<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insert_form.jsp</title>
</head>
<body>
	<div class="container">
		<h1>글 작성 페이지 입니다.</h1>
		<form action="insert.jsp" method="get">
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer">
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="text" id="pwd" name="pwd">
			</div>
			<div>
				<textarea id="content" name="content"></textarea>
			</div>
			<button type="submit">작성</button>
			<button type="reset">지우기</button>
		</form>

		<a href="list.jsp">글 목록으로</a>
	</div>
</body>
</html>