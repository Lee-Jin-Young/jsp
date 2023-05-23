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
<title>/member/insert.jsp</title>
</head>
<body>
   <div class="container">
      <h1>알림</h1>
      <%if(isSuccess){ %>
         <p>
            <strong><%=name %></strong> 님의 정보가 저장되었습니다.
            <a href="list.jsp"></a>
         </p>
      <%}else { %>
         <p>
            회원정보 저장 실패!
            <a href="insert_form.jsp">다시 작성</a>
         </p>
      <%} %>
   </div>
</body>
</html>