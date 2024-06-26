<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
	
		<h1>비밀번호 수정 폼</h1>
		
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div>
				<label for="pwd">기존 비밀번호</label>
				<input type="password" name="pwd" id="pwd"/>
			</div>
			<div>
				<label for="newPwd">새 비밀번호</label>
				<input type="password" name="newPwd" id="newPwd"/>
			</div>
			<div>
				<label for="newPwd2">새 비밀번호 확인</label>
				<input type="password" id="newPwd2"/>
			</div>
			<button type="submit">수정하기</button>
			<button type="reset">리셋</button>
		</form>	
		
	</div>
	
	<script>
		document.querySelector("#myForm").addEventListener("submit", function(event){
			let pwd1=document.querySelector("#newPwd").value;
			let pwd2=document.querySelector("#newPwd2").value;
			
			if(pwd1 != pwd2){
				alert("비밀번호를 확인 하세요!");
				event.preventDefault();
			}
		});	
	</script>
</body>
</html>



