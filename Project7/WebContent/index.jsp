<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body class="container-fluid">
<div class="container">
	<div class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			<i class="fas fa-campground"></i>
			acorn
		</a>
	</div>
</div>

<a href="admin/admin_login_form.jsp">관리자 로그인</a> 
<%
	//id라는 키값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
<div class="container">
<%if(id!=null){ %>
	<p>
		<a href="user/info.jsp"><%=id %></a>님 로그인 중
		<a href="user/logout.jsp">로그아웃</a>
	</p>
<%} %>
		<h1>index page</h1>
	<ul>
		<li><a href="user/signup_form.jsp">회원가입</a></li>
		<li><a href="user/loginform.jsp">로그인</a></li>
		<li><a href="board/list.jsp">보드</a></li>
	</ul>
</div>

</body>
</html>