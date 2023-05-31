<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form action="signup.jsp" method="post">
			<div class="mb-2">
				<label for="id" class="form-label">아이디</label> <input type="text"
					class="form-control" id="id" name="id">
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
				<div class="form-text">4글자 이상 10글자 이하로 입력해야 합니다.</div>
			</div>

			<div class="mb-2">
				<div class="form-label" for="email">이메일</div>
				<input type="text" class="form-control" id="email" name="email">
				<div class="invalid-feedback">이메일 형식에 맞게 입력하시오.</div>
			</div>
			<button class="btn btn-primary" type="submit" disabled="disabled">가입</button>
		</form>
	</div>

	<script>
        let isIdValid = false;
        let isEmailValid = false;

        document.querySelector("#id").addEventListener("input", (e)=>{
            const inputId=e.target.value;
            
            if(inputId.length <= 4 || 10 <= inputId.length){
            	isIdValid=false;

            	e.target.classList.add("is-invalid");
            	e.target.classList.remove("is-valid");

            	buttonChange();
            	
            	return;
            }
            
            fetch("checkid.jsp?inputId="+inputId)
            .then(res=>res.json())
            .then((data)=>{
            	
               isIdValid = data.canUse;
               
               if(isIdValid){
                    e.target.classList.add("is-valid");
                    e.target.classList.remove("is-invalid");
                }else{
                    e.target.classList.add("is-invalid");
                    e.target.classList.remove("is-valid");
                }
               
               buttonChange();
               
            });
            
        });


        document.querySelector("#email").addEventListener("input", (e) => {
            const inputEmail = e.target.value;

            //정규 표현식 객체
            let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');

            isEmailValid = regex.test(inputEmail);
            if(isEmailValid) {
                e.target.classList.add("is-valid");
                e.target.classList.remove("is-invalid");
            } else {
                e.target.classList.add("is-invalid");
                e.target.classList.remove("is-valid");
            }
            
            buttonChange();
        });

        //버튼의 상태를 바꾸는 함수 
        function buttonChange(){
            //폼 전체가 유효한지 여부
            const isFormValid = isIdValid && isEmailValid;
            if(isFormValid){
                document.querySelector("button[type=submit]").removeAttribute("disabled");
            }else{
                document.querySelector("button[type=submit]").setAttribute("disabled", "disabled");
            }
        }

    </script>
</body>
</html>