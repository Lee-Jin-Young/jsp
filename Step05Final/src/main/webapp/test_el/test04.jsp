<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
   <h1>요청 파라미터도 EL로 추출이 가능하다.</h1>
   
   <form action="test05.jsp" method="post">
      <input type="text" name="msg"/>
      <button type="submit">전송</button>
   </form>
   
   <br>
   
   <a href="test05.jsp?msg=hello">test05.jsp</a>
</body>
</html>