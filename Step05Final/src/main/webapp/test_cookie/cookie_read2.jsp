<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cooks=request.getCookies();
	String savedMsg=null;
	
	if(cooks!=null){
		for(Cookie tmp:cooks){
			String key=tmp.getName();
			
			if(key.equals("savedMsg")){
				savedMsg=URLDecoder.decode(tmp.getValue(),"utf-8");
			}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<p>savedMsg라는 키값으로 저장된 문자열 : <%=savedMsg %></p>
	
	<a href="cookie_form2.jsp">다시 테스트</a>
</body>
</html>




