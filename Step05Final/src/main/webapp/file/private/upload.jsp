<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 파일 시스템 상에서의 /upload까지의 절대경로
// 다른 환경에서도 사용 할 수 있도록 작성하기 위함
String realPath = application.getRealPath("/upload");
File f = new File(realPath);
if (!f.exists()) {
	f.mkdir();
}
MultipartRequest mr = new MultipartRequest(
		request, 
		realPath, //파일 경로
		1024 * 1024 * 100, //최대 업로드 사이즈
		"utf-8", //파일명 인코딩
		new DefaultFileRenamePolicy() //동일한 파일명 존재 시 이름을 변경하여 저장
);

String title = mr.getParameter("title");
String writer = (String) session.getAttribute("id");
String orgFileName = mr.getOriginalFileName("myFile");
String saveFileName = mr.getFilesystemName("myFile");
long fileSize = mr.getFile("myFile").length();

FileDto dto = new FileDto();
dto.setWriter(writer);
dto.setTitle(title);
dto.setOrgFileName(orgFileName);
dto.setSaveFileName(saveFileName);
dto.setFileSize(fileSize);

boolean isSuccess = FileDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<%
	if (isSuccess) {
	%>
	<p>
		님이 업로드한 파일을 저장했습니다. <a href="${pageContext.request.contextPath}/file/list.jsp">목록보기</a>
	</p>
	<p><%=realPath%></p>
	<%
	} else {
	%>
	<p>
		업로드 되지 않았습니다. <a href="upload_form.jsp">재시도</a>
	</p>
	<%
	}
	%>
</body>
</html>