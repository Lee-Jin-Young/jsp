<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String) session.getAttribute("id");
%>

<nav class="navbar bg-info navbar-expand-md" data-bs-theme="dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">
      <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      Board
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText">
    	<span class="navbar-toggler-icon"></span>
    </button>
      
    <div class="collapse navbar-collapse" id="navbarText">
         <ul class="navbar-nav me-auto">
           <li class="nav-item">
                <a class="nav-link ${param.currentPage eq 'file' ? 'active':'' }" href="${pageContext.request.contextPath }/file/list.jsp">파일</a>
           </li>
           <li class="nav-item">
                <a class="nav-link ${param.currentPage eq 'cafe' ? 'active':'' }" href="${pageContext.request.contextPath }/cafe/list.jsp">게시판</a>
           </li>
         </ul>
         <span class="navbar-text ms-2" data-bs-theme="dark">
         </span>
    </div>
    
    <div>
    	<c:choose>
    		<c:when test="${not empty id}">
				<a href="${pageContext.request.contextPath }/users/private/info.jsp" class="link-light link-offset-2"><strong>${id}</strong></a>님 로그인중
				<a href="${pageContext.request.contextPath }/users/logout.jsp" class="btn btn-light btn-sm">로그아웃</a>
    		</c:when>
    		<c:otherwise>
    			<a href="${pageContext.request.contextPath }/users/login_form.jsp" class="btn btn-light btn-sm">로그인</a>
    			<a href="${pageContext.request.contextPath }/users/signup_form.jsp" class="btn btn-light btn-sm">회원가입</a>
    		</c:otherwise>
    	</c:choose>
    </div>
  </div>
</nav>










