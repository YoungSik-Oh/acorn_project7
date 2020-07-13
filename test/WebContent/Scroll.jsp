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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="style.css" />
</head>
<body>


<div class="scroll-container">
  <section>
    <h2>Section 1</h2>
  </section>
  <section>
    <h2>Section 2</h2>
  </section>
  <section>
    <h2>Section 3</h2>
  </section>
  <section>
    <h2>Section 4</h2>
	<button id="topBtn"></button>
  </section>
</div>

<script src="main.js"></script>
</body>
</html>