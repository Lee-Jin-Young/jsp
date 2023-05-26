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
	<h3>콜백함수</h3>
	<script>
		function work(job, callback) {
			let ranTime = Math.random()*5000;
			
			setTimeout(()=>{
				console.log(job+" 을(를) 수행했습니다.");
				callback(); //전달 받은 함수 호출
			}, ranTime);
		}
		
		//순서가 뒤섞임
		//work("냉장고 문을 연다.", function(){};
		//work("코끼리를 냉장고에 넣는다.", function(){};
		//work("냉장고 문을 닫는다.", function(){};
		
		//작업을 마친 후 다음 작업을 한다.
		work("냉장고 문을 연다.", function(){
			work("코끼리를 냉장고에 넣는다.", function(){
				work("냉장고 문을 닫는다.", function(){});
			});
		});
		
		let p1 = new Promise(function(resolve){
			/*
				함수의 인자로 전달되는 resolve는 함수이다.
				resolve는 작업을 완료 하였을때 호출하는 함수로 resolve()함수가 호출되면 .then의 함수가 호출된다.
			*/
			resolve();
		});
		
		p1.then(function() {
			console.log("then내부의 함수 호출")
		})
	</script>
</body>
</html>