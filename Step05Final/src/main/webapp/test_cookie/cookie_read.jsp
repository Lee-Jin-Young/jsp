<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cooks = request.getCookies();

	String savedMsg = null;
	if (cooks != null) {
		for (Cookie tmp : cooks) {
			String key = tmp.getName();
			if (key.equals("savedMsg")) {
		savedMsg = tmp.getValue();
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
	<p>savedMsg 라는 키값으로 저장된 문자열 : <%=savedMsg%></p>
	<%-- EL 을 활용하면 아래와 같다 --%>
	<p>savedMsg 라는 키값으로 저장된 문자열 : ${cookie.savedMsg.value }</p>
	
	<a href="cookie_form.jsp">다시 테스트</a>
</body>
</html>




