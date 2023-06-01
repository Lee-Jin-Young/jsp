<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="title" class="form-label">제목</label>
				<input type="text" name="title" id="title" class="form-control"/>
			</div>
			<div class="mb-3">
				<label for="myFile" class="form-label">첨부파일</label>
				<input type="file" name="myFile" id="myFile" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary">업로드</button>
		</form>
	</div>
</body>
</html>