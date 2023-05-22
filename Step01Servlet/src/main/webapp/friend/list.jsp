<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
	<div>
		<h1>친구 목록 입니다.</h1>
		<ul>
			<%
			List<String> names = new ArrayList<>();

			names.add("김구라");
			names.add("해골");
			names.add("원숭이");

			for(int i = 0; i<names.size(); i++) {
				%><li><%
				out.print(names.get(i));
				%></li><%
			}
			%>
		</ul>
	</div>
</body>
</html>