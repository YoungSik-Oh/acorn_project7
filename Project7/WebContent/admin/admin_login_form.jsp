<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>관리자 페이지</h1>
	
	<form action="admin_login.jsp" method="post">
		<div class="form-group">
			<label for="adminName">관리자 이름</label>
			<input class="form-control" type="text" name="adminName" id="adminName"/>
		</div>	
		<div class="form-group">
			<label for="adminPw">관리자 비밀번호</label>
			<input class="form-control" type="password" name="adminPw" id="adminPw" />
		</div>		
		<button class="btn btn-outline-primary" type="submit">로그인</button>
		<a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/index.jsp">취소</a>
		
	</form>
</div>
<div style="margin-bottom : 200px;"></div>
<hr/>
<%@include file="../footer.jsp" %>
</body>
</html>