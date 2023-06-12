<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>

<nav class="navbar bg-primary navbar-expand-md" data-bs-theme="dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">
      <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      Board
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText">
    	<span class="navbar-toggler-icon"></span>
    </button>
    
    <%
    	String current=request.getParameter("currentPage");
    %>
      
    <div class="collapse navbar-collapse" id="navbarText">
         <ul class="navbar-nav me-auto">
           <li class="nav-item">
                <a class="nav-link <%=current.equals("file") ? "active":"" %>" href="${pageContext.request.contextPath }/file/list.jsp">파일</a>
           </li>
           <li class="nav-item">
                <a class="nav-link <%=current.equals("cafe") ? "active":"" %>" href="${pageContext.request.contextPath }/cafe/list.jsp">게시판</a>
           </li>
         </ul>
         <span class="navbar-text ms-2" data-bs-theme="dark">
         </span>
    </div>
    
    <div>
    	<% if (id != null) { %>
		<p>
			<a href="${pageContext.request.contextPath }/users/private/info.jsp" class="btn btn-primary"><%=id %></a>님 로그인중
			<a href="${pageContext.request.contextPath }/users/logout.jsp" class="btn btn-light btn-sm">로그아웃</a>
		</p>
		<% } else { %>
		<a href="${pageContext.request.contextPath }/users/login_form.jsp">로그인</a>
		<% } %>
    </div>
  </div>
</nav>










