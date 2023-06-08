<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	UsersDto dto=UsersDao.getInstance().getData(id);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<style>
	#profileImage {
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm {
		display: none;
	}
</style>
</head>
<body>
	<div class="container">
	
		<h1>회원 정보 수정 폼 입니다.</h1>
		
		<a id="profileLink" href="javascript:">
			<% if(dto.getProfile() == null) { %>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			<% }else { %>
				<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
			<% } %>
		</a>
		
		<form action="update.jsp" method="post">
			<input type="hidden" name="profile" 
				value="<%=dto.getProfile()==null ? "empty" : dto.getProfile()%>"/>
			<div>
				<label for="id">아이디</label>
				<input type="text" id="id" value="<%=dto.getId() %>" readonly/>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" value="<%=dto.getEmail()%>"/>
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>	

		<form id="imageForm" action="profile_upload.jsp" method="post" enctype="multipart/form-data">
			프로필 사진
			<input type="file" id="image" name="image" accept=".jpg, .png, .gif, JPG, jpeg, JPEG"/>
			<button type="submit">업로드</button>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	
	<script>
		document.querySelector("#profileLink").addEventListener("click", ()=>{
			document.querySelector("#image").click();
		});
		
		document.querySelector("#image").addEventListener("change", ()=>{
			const form=document.querySelector("#imageForm");
			
			ajaxFormPromise(form)
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
				document.querySelector("input[name=profile]").value=data.imagePath;
				
				let img=`<img id="profileImage" src="${pageContext.request.contextPath }\${data.imagePath}">`;
				document.querySelector("#profileLink").innerHTML=img;
			});
		});
	</script>
</body>
</html>