<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼2</h3>

		<form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" />
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile" />
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath }/js/my_util.js"></script>
	
	<script>
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			e.preventDefault();
			let data=new FormData(e.target); 
			
			/*
			fetch("upload2.jsp",{
				method:"post",
				body:data
			})
			.then(res=>res.text())
			.then((data)=>{
				console.log(data);
				const result=JSON.parse(data);
				console.log(result);
			});
			*/
			
			/*
			fetch("upload2.jsp",{
				method:"post",
				body:data
			})
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
			});
			*/
			
			//my_util활용
			ajaxFormPromise(e.target)
			.then(res=>res.json())
			.then((data)=>{
				console.log(data);
			});
		});
	</script>
</body>
</html>
