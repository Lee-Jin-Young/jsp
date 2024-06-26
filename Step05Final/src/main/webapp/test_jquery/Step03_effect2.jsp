<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageContext.request.contextPath}</title>
<style>
	.box {
		width : 100px;
		height: 100px;
		background-color : yellow;
		border : 1px solid red;
	}
</style>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<div class="box"></div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#hideBtn").click(() => {
			//$(".box").hide(1000);
			/*
			$(".box").hide(1000, ()=> {
				alert("hide");
			});
			*/
			$(".box").hide({
				duration : 1000,
				complete : () => {
					alert("hide");
				}
			});
		});
		$("#showBtn").click(() => {
			$(".box").show();
		});
		$("#toggleBtn").click(() => {
			$(".box").toggle();
		});
	</script>
</body>
</html>