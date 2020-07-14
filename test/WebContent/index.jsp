<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<style>

</style>
</head>

<body>
<header>
	<div>
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">logo</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">맛집</a></li> 
				<li class="nav-item"><a class="nav-link" href="#">추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/login.jsp">로그인</a></li>
			</ul>
		</div>
	</div>
	<div >
		container
		<form action="">
			<legend>검색창</legend>
			<input type="text" name="search" placeholder="검색할 내용을 입력하세요."/>
			<button type="submit">검색</button>
		</form>
	</div>
</header>

<section> contents
	<div>제목
		<div>
			내용들
			
		</div>
	</div>
</section>
</body>
</html>