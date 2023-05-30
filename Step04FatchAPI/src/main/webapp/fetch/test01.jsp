<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<h1>fetch 함수 테스트</h1>
	<button id="myBtn">클릭</button>
	<a href="${pageContext.request.contextPath }/index.jsp">클릭</a>
	<script>
      document.querySelector("#myBtn").addEventListener("click", () => {
         
         const msg=prompt("메세지 입력");
         console.log("입력완료");
         console.log("-----");
         
         fetch("${pageContext.request.contextPath }/index.jsp")
         .then(function(response) {
            return response.text();
         })
         .then(function(data) {
            console.log(data);
         })
      });
   </script>
</body>
</html>