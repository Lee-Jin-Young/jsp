<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">

		<h1>글 작성 페이지 입니다.</h1>

		<form action="insert.jsp" method="post">
			<div class="mb-3 row">
				<label for="writer" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-10">
					<%-- 값(name)을 전송 --%>
					<input type="text" class="form-control" id="writer" name="writer">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-10">
					<%-- 값(name)을 전송 --%>
					<input type="password" class="form-control" id="pwd" name="pwd">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="content" class="form-label">내용</label>
				<div class="col-sm-10">
					<%-- 값(innerText)을 전송 --%>
					<textarea id="content" class="form-control" name="content" rows="3"></textarea>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">작성</button>
			<button type="reset" class="btn btn-primary">지우기</button>
		</form>

		<a class="btn btn-primary" href="list.jsp">글 목록으로</a>
	</div>
</body>
</html>