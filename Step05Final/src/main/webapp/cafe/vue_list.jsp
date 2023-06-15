<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
final int PAGE_ROW_COUNT = 2;
final int PAGE_DISPLAY_COUNT = 2;
int pageNum = 1;

String strPageNum = request.getParameter("pageNum");

if (strPageNum != null) {
	pageNum = Integer.parseInt(strPageNum);
}

int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
int endRowNum = pageNum * PAGE_ROW_COUNT;

int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

int totalRow = CafeDao.getInstance().getCount();
int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

if (endPageNum > totalPageCount) {
	endPageNum = totalPageCount;
}

request.setAttribute("startPageNum", startPageNum);

CafeDto dto = new CafeDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);

CafeDao dao = CafeDao.getInstance();
List<CafeDto> list = dao.getList(dto);
String id = (String) session.getAttribute("id");

request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="currentPage" />
	</jsp:include>

	<div class="container">

		<h1>게시글</h1>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% List<CafeDto> list1 = (List<CafeDto>)request.getAttribute("list"); %>
				<%
				for (CafeDto temp : list) {
				%>
				<tr>
					<td><%=temp.getNum()%></td>
					<td><%=temp.getWriter()%></td>
					<td><a href="detail.jsp?num=<%=temp.getNum()%>" class="link-dark link-offset-2"><strong><%=temp.getTitle()%></strong></a></td>
					<td><%=temp.getViewCount()%></td>
					<td><%=temp.getRegdate()%></td>
					<td>
						<%
						if (temp.getWriter().equals(id)) {
						%> <a href="private/update_form.jsp?num=<%=temp.getNum()%>"><i class="bi bi-pencil-square"></i></a> <%
 }
 %>
					</td>
					<td>
						<%
						if (temp.getWriter().equals(id)) {
						%> <a href="private/delete.jsp?num=<%=temp.getNum()%>"><i class="bi bi-trash-fill"></i></a> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<% int startPageNum1 = (int)request.getAttribute("startPageNum"); %>
		<ul class="pagination justify-content-center">
			<li><p>${startPageNum1}</p></li>
			<c:choose>
				<c:when test="${startPageNum1 ne 1}">
					<li class="page-item">
						
						<a class="page-link" href="vue_list.jsp?pageNum=${startPageNum1-1}">&laquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link disabled" href="vue_list.jsp?pageNum=${startPageNum1}">&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>


			<%
			for (int i = startPageNum; i <= endPageNum; i++) {
			%>
			<li class="page-item <%=i == pageNum ? "active" : ""%>"><a class="page-link" href="vue_list.jsp?pageNum=<%=i%>"><%=i%></a></li>
			<%
			}
			%>

			<%
			if (endPageNum < totalPageCount) {
			%>
			<li class="page-item"><a class="page-link" href="vue_list.jsp?pageNum=<%=endPageNum + 1%>">&raquo;</a></li>
			<%
			}
			%>
		</ul>

		<a href="private/insert_form.jsp" class="btn btn-info">새글 작성</a>

	</div>
</body>
</html>