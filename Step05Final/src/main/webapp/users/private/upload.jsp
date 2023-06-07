<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String realPath=application.getRealPath("/upload");
	
	MultipartRequest mr=new MultipartRequest(request,
			realPath,     //업로드된 파일을 저장할 경로 
			1024*1024*50, //최대 업로드 사이즈
			"utf-8",      //한글 파일명 깨지지 않도록 
			new DefaultFileRenamePolicy());
	
	String saveFileName=mr.getFilesystemName("image");
	String imagePath="/upload/"+saveFileName;
	
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setProfile(imagePath);
	UsersDao.getInstance().updateProfile(dto);

	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/users/private/info.jsp");
%>