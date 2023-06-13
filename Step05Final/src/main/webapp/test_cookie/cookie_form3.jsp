<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String savedId = "";
	String savedPwd = "";
	
	Cookie[] cooks = request.getCookies();
	
	if (cooks != null) {
		for (Cookie tmp : cooks) {
			String key = tmp.getName();
	
			if (key.equals("savedId")) {
		savedId = tmp.getValue();
			}
	
			if (key.equals("savedPwd")) {
		savedPwd = tmp.getValue();
			}
	
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<form action="login.jsp" method="post">
		<table>
			<tr>
				<th><label for="id">아이디</label></th>
				<td><input type="text" name="id" id="id" value="<%=savedId%>" /></td>
			</tr>
			<tr>
				<th><label for="pwd">비밀번호</label></th>
				<td><input type="password" name="pwd" id="pwd" value="<%=savedPwd%>" /></td>
			</tr>
			<tr>
				<td></td>
				<td><label> <input type="checkbox" name="isSave" value="yes" ${ not empty cookie.savedId ? 'checked':''} /> 로그인 정보 저장
				</label></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit">로그인</button></td>
			</tr>
		</table>
	</form>
</body>
</html>