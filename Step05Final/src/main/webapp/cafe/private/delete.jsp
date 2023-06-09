<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
	
	//로그인 아이디와 작성자 아이디 확인
	String id=(String)session.getAttribute("id");
	
	if(!dto.getWriter().equals(id)){
		//에러 코드 및 에러 메세지 전달
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인이 작성한 파일만 삭제 가능합니다.");
		return;
	}
	
	CafeDao.getInstance().delete(num);
	
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>