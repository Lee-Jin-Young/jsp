<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realPath=application.getRealPath("/upload");
	File f=new File(realPath);
	
	if(!f.exists()){ 
		f.mkdir();
	}

	MultipartRequest mr=new MultipartRequest(request, //HttpServletRequest 객체 전달
			realPath,                       //저장할 경로
			1024*1024*100,                  //최대 업로드 사이즈
			"utf-8",                        //한글 파일명 인코딩
			new DefaultFileRenamePolicy()); //동일한 파일이 존재하면 이름변경
	
	String title=mr.getParameter("title");
	String writer=(String)session.getAttribute("id");
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	long fileSize=mr.getFile("myFile").length();

	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);

	boolean isSuccess=FileDao.getInstance().insert(dto);
%>    
{"isSuccess":<%=isSuccess %>, "saveFileName":"<%=saveFileName %>"}