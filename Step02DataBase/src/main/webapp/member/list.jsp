<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%MemberDao dao = MemberDao.getInstance();%>
<%List<MemberDto> list  = dao.getList();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>회원 목록 입니다.</h1>
		<div style="text-align:right">
			<a href="insert_form.jsp">회원추가</a>
		</div>
		<table class="">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (MemberDto temp : list) {
				%>
				<tr>
					<td><%=temp.getNum()%></td>
					<td><%=temp.getName()%></td>
					<td><%=temp.getAddr()%></td>
					<td>
						<a href="update_form.jsp?num=<%=temp.getNum()%>">수정</a>
					</td>
					<td>
						<a href="delete.jsp?num=<%=temp.getNum()%>">삭제</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>