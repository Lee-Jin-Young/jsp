<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 페이지</title>
</head>
<body>
	<h1>회원 목록 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
		<% 
		List<MemberDto> list=new ArrayList<>();
	    list.add(new MemberDto(1, "김구라", "노량진"));
	    list.add(new MemberDto(2, "해골", "행신동"));
	    list.add(new MemberDto(3, "원숭이", "상도동"));
	      
		for(MemberDto temp : list) {
			%>
			<tr>
				<td><%=temp.getNum() %></td>
				<td><%=temp.getName() %></td>
				<td><%=temp.getAddr() %></td>				
			</tr>
			<%
		}
		%>
		</tbody>
	</table>
</body>
</html>