<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	FileDto dto = FileDao.getInstance().getData(num);

	String orgFileName = dto.getOrgFileName();
	String saveFileName = dto.getSaveFileName();
	String path = application.getRealPath("/upload") + File.separator + saveFileName;
	FileInputStream fis = new FileInputStream(path);
	String encodedName = null;

	if (request.getHeader("User-Agent").contains("Firefox")) {
		encodedName = new String(orgFileName.getBytes("utf-8"), "ISO-8859-1");
	} else {
		encodedName = URLEncoder.encode(orgFileName, "utf-8");
		encodedName = encodedName.replaceAll("\\+", " ");
	}

	//응답 헤더 정보 설정
	response.setHeader("Content-Disposition", "attachment;filename=" + encodedName);
	response.setHeader("Content-Transfer-Encoding", "binary");

	//다운로드할 파일의 크기
	response.setContentLengthLong(dto.getFileSize());

	//클라이언트에게 출력 하는 스트림 객체
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	byte[] buffer = new byte[1024 * 1024];
	int readedByte = 0;
	while (true) {
		readedByte = fis.read(buffer);
		if (readedByte == -1)
			break;
		bos.write(buffer, 0, readedByte);
		bos.flush();
	}
	fis.close();
%>
