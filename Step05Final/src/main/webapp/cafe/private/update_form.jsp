<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
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
		<h1>글 수정</h1>

		<form action="update.jsp" method="post" >
			<div class="mb-3 row">
				<label for="num" class="col-sm-2 col-form-label">글번호</label>
				<div class="col-sm-10">
					<%-- 기존 값(value)이 텍스트형태(plaintext)로 보이며 값(name)을 전송하지만 수정불가능(readonly) --%>
					<input type="text" id="num" value ="<%=dto.getNum()%>" name="num" class="form-control-plaintext" readonly>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="writer" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-10">
					<%-- 기존 값(value)이 보이며 값(name)을 전송하지만 수정불가능(readonly) --%>
					<input type="text" id="writer" value="<%=dto.getWriter()%>" name="writer" class="form-control-plaintext" readonly>
				</div>
			</div>
			<div class="mb-3 row">
			<%-- 기존 값(innerText)이 보이며 값(name)을 전송함 --%>
				<textarea id="content" name="content" class="form-control" rows="5"><%=dto.getContent()%></textarea>
			</div>
			
			<div class="btn-group">
				<button type="submit" class="btn btn-primary">작성</button>
				<button type="reset" class="btn btn-outline-primary">지우기</button>
				<a href="${pageContext.request.contextPath}/cafe/list.jsp" class="btn btn-outline-primary">글 목록으로</a>
			</div>
		</form>
	</div>
</body>
</html>