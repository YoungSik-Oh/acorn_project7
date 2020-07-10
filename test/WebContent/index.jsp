<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scroll.jsp</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index-section.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<div class="scroll-container">
  <section>
    <h2>Section 1</h2>
    <div class="search" >
		<form action="">
			<legend>검색창</legend>
			<input type="text" name="search" placeholder="검색할 내용을 입력하세요."/>
			<button type="submit">검색</button>
		</form>
	</div>
  </section>
  <section>
    <h2>Section 2</h2>
    <div class="container">
   		container
   	</div>
  </section>
  <section>
    <h2>Section 3</h2>
  </section>
  <section>
    <h2>Section 4</h2>
  </section>
</div>
</body>
</html>