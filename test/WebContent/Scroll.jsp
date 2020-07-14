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
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: 'Helvetica', sans-serif;
}

/* All the snapping stuff */
.scroll-container {
    height: 100vh;
    overflow-y: scroll;
    scroll-snap-type: y mandatory;
    scroll-behavior: smooth;
}

section {
    height: 100vh;
    scroll-snap-align: start;
}

/* Other styles */
section {
    padding: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: darkorchid;
}

section:nth-child(2n) {
    background-color: turquoise;
}

section:nth-child(3n) {
    background-color: tomato;
}
</style>
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
  </section>
</div>
</body>
</html>