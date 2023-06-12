<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT = 5;
	final int PAGE_DISPLAY_COUNT=5;
	int pageNum = 1;
	
	String strPageNum = request.getParameter("pageNum");
	
	if(strPageNum != null) {
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
	
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	FileDao dao = FileDao.getInstance();
	List<FileDto> list = dao.getList(dto);
	String id=(String)session.getAttribute("id");
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
		<jsp:param value="file" name="currentPage"/>
	</jsp:include>
	
	<div class="container">
		<h1>자료실</h1>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for (FileDto temp : list) { %>
				<tr>
					<td><%=temp.getNum()%></td>
					<td><%=temp.getWriter()%></td>
					<td><%=temp.getTitle()%></td>
					<td><a href="download.jsp?num=<%=temp.getNum()%>"><%=temp.getOrgFileName()%></a></td>
					<td><%=temp.getRegdate()%></td>
					<td>
						<% if (temp.getWriter().equals(id)) { %>
							<a href="delete.jsp?num=<%=temp.getNum()%>">삭제</a>
						<% } %>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
		
		<ul class="pagination justify-content-center">
			<% if(startPageNum != 1) { %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
				</li>
			<% } %>
			<% for(int i=startPageNum; i<=endPageNum; i++) { %>
				<li class="page-item <%= i==pageNum ? "active":"" %>">
					<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<% } %>
			<% if(endPageNum < totalPageCount) { %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
				</li>
			<% } %>
		</ul>
		
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp" class="btn btn-primary">업로드</a>
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp" class="btn btn-primary">ajax 업로드</a>
	</div>
</body>
</html>