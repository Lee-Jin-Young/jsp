<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String job = request.getParameter("job");
String gender = request.getParameter("gender");
String[] hobby = request.getParameterValues("hobby");
String hobbyResult = "";

if (hobby != null) {
	for (int i = 0; i < hobby.length; i++) {
		String tmp = hobby[i];
		hobbyResult += tmp;
		if (i != hobby.length - 1) {
	hobbyResult += "/";
		} //if
	} //for

	String[] result = hobbyResult.split("/");

	boolean isContain = hobbyResult.contains("xxx");
} //if

String allowEmail = request.getParameter("allowEmail");
String allowMessage = request.getParameter("allowMessage");
/*
	textarea 에 입력한 문자열은 개행, tab, 공백기호가 모두 포함됨
*/
String comment = request.getParameter("comment");
%>
<!DOCTYPE html>
<html>
<div class="container">

	<h1>회원가입 결과</h1>
	<p>회원님의 정보를 성공적으로 저장했습니다.</p>
	<p><%=hobbyResult%></p>

	<form action="signup.jsp" method="post">
		<div class="form-floating mb-2">
			<input class="form-control" type="text" name="id" id="id" placeholder="아이디 입력">
			<input class="form-control" value="<%=id%>" type="text" name="id" id="id" placeholder="아이디 입력">
			<label for="id">아이디</label>
		</div>
		<div class="form-floating mb-2">
			<input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
			<input class="form-control" value="<%=pwd%>" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
			<label for="pwd">비밀번호</label>
		</div>
		<select class="form-select mb-2" id="job" name="job">
			<option value="">직업 선택</option>
			<option value="programmer">프로그래머</option>
			<option value="doctor">의사</option>
			<option value="programmer" <%=job.equals("programmer") ? "selected" : ""%>>프로그래머</option>
			<option value="doctor" <%=job.equals("doctor") ? "selected" : ""%>>의사</option>
		</select>
		<fieldset>
			<legend>성별 체크</legend>
			<div class="form-check form-check-inline">
				<input class="form-check-input" value="man" type="radio" id="one" name="gender" checked>
				<input class="form-check-input" value="man" type="radio" id="one" name="gender" <%=gender.equals("man") ? "checked" : ""%>>
				<label class="form-check-label" for="one">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" value="woman" type="radio" id="two" name="gender">
				<input class="form-check-input" value="woman" type="radio" id="two" name="gender" <%=gender.equals("woman") ? "checked" : ""%>>
				<label class="form-check-label" for="two">여자</label>
			</div>
		</fieldset>
		<fieldset>
			<legend>취미 체크</legend>
			<div class="form-check">
				<input type="checkbox" value="piano" name="hobby" class="form-check-input" id="piano">
				<input type="checkbox" value="piano" name="hobby" class="form-check-input" id="piano" <%=hobbyResult.contains("piano") ? "checked" : ""%>>
				<label class="form-check-label" for="piano">피아노</label>
			</div>
			<div class="form-check">
				<input type="checkbox" value="game" name="hobby" class="form-check-input" id="game">
				<input type="checkbox" value="game" name="hobby" class="form-check-input" id="game" <%=hobbyResult.contains("game") ? "checked" : ""%>>
				<label class="form-check-label" for="game">게임</label>
			</div>
			<div class="form-check">
				<input type="checkbox" value="etc" name="hobby" class="form-check-input" id="etc">
				<input type="checkbox" value="etc" name="hobby" class="form-check-input" id="etc" <%=hobbyResult.contains("etc") ? "checked" : ""%>>
				<label class="form-check-label" for="etc">기타</label>
			</div>
		</fieldset>
		<div>
			<label class="form-label" for="comment">하고 싶은말</label>
			<textarea class="form-control" name="comment" id="comment" rows="10"><%=comment%></textarea>
		</div>
		<fieldset>
			<legend>개인정보 활용 동의</legend>
			<div class="form-check form-switch">
				<input class="form-check-input" type="checkbox" id="allowAll">
				<label class="form-check-label" for="allowAll">전체 동의</label>
			</div>
			<div class="form-check form-switch">
				<input class="form-check-input allow" type="checkbox" value="email" name="allowEmail" id="allowEmail">
				<input class="form-check-input allow" type="checkbox" value="email" name="allowEmail" id="allowEmail" <%=allowEmail != null ? "checked" : ""%>>
				<label class="form-check-label" for="allowEmail">이메일 수신여부</label>
			</div>
			<div class="form-check form-switch">
				<input class="form-check-input allow" type="checkbox" value="message" name="allowMessage" id="allowMessage">
				<input class="form-check-input allow" type="checkbox" value="message" name="allowMessage" id="allowMessage" <%=allowMessage != null ? "checked" : ""%>>
				<label class="form-check-label" for="allowMessage">광고성 문자 수신여부</label>
			</div>
		</fieldset>
		<button class="btn btn-outline-primary" type="submit">가입</button>
	</form>

</div>
</body>
</html>