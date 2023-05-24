<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String name = request.getParameter("name"); 
   String addr = request.getParameter("addr"); 
   MemberDto dto = new MemberDto();
   dto.setName(name);
   dto.setAddr(addr);
      MemberDao dao = MemberDao.getInstance();
    boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>/member/insert.jsp</title>
</head>
<body>
   <div class="container">
      <h1>알림</h1>
      <%if(isSuccess){ %>
         <p class="alert alert-success">
            <strong><%=name %></strong> 님의 정보가 저장되었습니다.
         </p>
         <a href="list.jsp">리스트로</a>
      <%}else { %>
         <p class="alert alert-success">
            회원정보 저장 실패!
         </p>
         <a href="insert_form.jsp">다시 작성</a>
      <%} %>
   </div>
</body>
</html>