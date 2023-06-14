<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	CafeDao dao = CafeDao.getInstance();
	CafeDto dto = dao.getData(num);
	
	dao.addViewCount(num);
	
	String id = (String)session.getAttribute("id");
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
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="currentPage"/>
	</jsp:include>
	
	<div class="container">
		<h1>자세히보기</h1>
		
		<table class="table table-bordered">
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>	
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="content">
						<%=dto.getContent() %>
					</div>
				</td>
			</tr>
		</table>

		<div class="btn-group">
			<% if (dto.getWriter().equals(id)) { %>
				<a href="${pageContext.request.contextPath}/cafe/private/update_form.jsp?num=<%=dto.getNum()%>" class="btn btn-info">수정하기</a>
				<a href="${pageContext.request.contextPath}/cafe/private/delete.jsp?num=<%=dto.getNum()%>" class="btn btn-danger">삭제하기</a>
				<script>
					function deleteConfirm() {
						const isDelete = confirm("이 글을 삭제 하겠습니까?");
						if(isDelete){
							//javascript 를 이용해서 페이지 이동 시키기
							location.href = "private/delete.jsp?num=<%=dto.getNum()%>";
						}
					}
				</script>
			<% } %>
			<a href="${pageContext.request.contextPath}/cafe/list.jsp" class="btn btn-outline-info">글 목록으로</a>
		</div>
	</div>
</body>
</html>