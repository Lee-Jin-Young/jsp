<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	String isSave=request.getParameter("isSave"); //체크박스
	
	//체크박스가 체크될 경우 아이디 비밀번호를 쿠키로 응답하고 일주일 동안 유지되도록 한다.
	if(isSave != null){
		Cookie cook1=new Cookie("savedId", id);
		Cookie cook2=new Cookie("savedPwd", pwd);
		cook1.setMaxAge(60*60*24*7);
		cook2.setMaxAge(60*60*24*7);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}
	//체크박스가 체크되지 않을 경우 특정 키값으로 저장된 쿠키값 삭제하기
	else {
		Cookie cook1=new Cookie("savedId", "");
		Cookie cook2=new Cookie("savedPwd", null);
		cook1.setMaxAge(0);
		cook2.setMaxAge(0);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<h1>쿠키 테스트 페이지</h1>
	
	<p><%=id %> 님 로그인 되었습니다.</p>
	
	<a href="cookie_form3.jsp">다시 테스트</a>
</body>
</html>








