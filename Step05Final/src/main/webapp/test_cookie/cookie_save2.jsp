<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg=request.getParameter("msg");
	//tomcat 8 이하 버전에서 모든 문자열을 다 저장하려면 인코딩을 해서 저장해야 한다.
	String encodedMsg=URLEncoder.encode(msg, "utf-8");
	Cookie cook=new Cookie("savedMsg", encodedMsg);
	cook.setMaxAge(60); //쿠키 유지시간 (초단위)
	response.addCookie(cook);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<p>웹 브라우저에 savedMsg라는 키값으로 "<%=msg %>"를 저장했습니다.</p>
	
	<a href="cookie_read2.jsp">저장된 문자열 확인 해보기</a>
</body>
</html>








