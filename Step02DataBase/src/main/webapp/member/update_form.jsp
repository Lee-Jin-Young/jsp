<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	MemberDto dto=MemberDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/update_form.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 양식</h1>
		<form action="update.jsp">
			<div>
				<label for="num">번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly/>
			</div>
			<div>
				<label for="name">이름</label>
				<input type="text" id="name" name="name" value="<%=dto.getName()%>"/>
			</div>
			<div>
				<label for="addr">주소</label>
				<input type="text" id="addr" name="addr" value="<%=dto.getAddr()%>"/>
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>