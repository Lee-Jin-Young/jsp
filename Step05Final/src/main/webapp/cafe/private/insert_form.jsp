<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="currentPage"/>
	</jsp:include>
	
	<div class="container">
	
		<h1>새글 작성</h1>
		
		<form action="insert.jsp" method="post">
			<div class="mb-3 row">
				<label for="title" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" name="title" id="title" class="form-control"/>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="content" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10">
					<textarea name="content" id="content" class="form-control" rows="10"></textarea>
				</div>
			</div>
			
			<button type="submit" class="btn btn-info">저장</button>
		</form>
		
	</div>
</body>
</html>