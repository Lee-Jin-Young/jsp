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
	
	.box2 {
		width : 100px;
		height: 100px;
		background-color : yellow;
		border : 1px solid red;
		transition : all 1s linear;
	}
</style>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<button id="moveBtn">움직이기</button>
	<button id="moveBtn2">움직이기2</button>
	<button id="moveBtn3">움직이기3</button>
	<div class="box"></div>
	<div class="box2"></div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		let marginL = 0;
		$("#hideBtn").click(() => {
			//$(".box").fadeOut();
			//$(".box").fadeOut(1000);
			/*
			$(".box").fadeOut(1000, () => {
				alert("hide");
			});
			*/
			$(".box").fadeOut({
				duration : 1000,
				complete : () => {
					alert("hide");
				}
			});
		});
		
		$("#showBtn").click(() => {
			$(".box").fadeIn();
		});
		
		$("#toggleBtn").click(() => {
			$(".box").fadeToggle();
		});
		
		$("#moveBtn").click(() => {
			let seq = setInterval(() => {
				marginL++;
				if(marginL == 100) {
					clearInterval(seq);
				}
				$(".box").css("margin-left", marginL+"px");
				
			}, 10);
		});
		
		$("#moveBtn2").click(() => {
			$(".box").animate({
				"margin-left" : "+=100px"
			}, 1000);
		});
		
		$("#moveBtn3").click(() => {
			$(".box2").css("margin-left", "100px");
		})
	</script>
</body>
</html>