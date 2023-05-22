<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num = Integer.parseInt(request.getParameter("num")); 
	int amount = Integer.parseInt(request.getParameter("amount"));
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>
	<p>
		<strong><%=num %></strong>번 상품 <strong><%=amount %></strong>개를 주문 하였습니다.
	</p>
</body>
</html>