<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   //Servlet 단에서 담은 sample  데이터라고 가정
   List<FileDto> list=new ArrayList<>();
   FileDto dto1=new FileDto();
   dto1.setNum(1);
   dto1.setWriter("김구라");
   dto1.setTitle("제목1");
   
   FileDto dto2=new FileDto();
   dto2.setNum(2);
   dto2.setWriter("해골");
   dto2.setTitle("제목2");
   
   FileDto dto3=new FileDto();
   dto3.setNum(3);
   dto3.setWriter("원숭이");
   dto3.setTitle("제목3");
   
   list.add(dto1);
   list.add(dto2);
   list.add(dto3);
   
   request.setAttribute("list", list);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach var="temp" items="${requestScope.list}">
					<tr>
						<td>${temp.getNum()}</td>
						<td>${temp.getWriter()}</td>
						<td>${temp.getTitle()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>