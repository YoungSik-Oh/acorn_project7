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
    font-family: Arial, 'Helvetica', sans-serif;
}

/* All the snapping stuff */
.scroll-container {
    height: 100vh;
    overflow-y: scroll;
    scroll-snap-type: y mandatory;
    scroll-behavior: smooth;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 1;
	font-size: 18px;
	border: none;
	background-color: olive;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover{
	background-color: white;
	color: olive;
}

section {
    height: 100vh;
    scroll-snap-align: start;
    z-index: 99;
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

<button onclick="topFunction()" id="myBtn" title="Go to top"> 맨 위로 </button>

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

<script>
var mybutton = document.getElementById("myBtn");

window.onscroll = function(){scrollFunction()};

function scrollFunction(){
	if (document.documentElement.scrollTop > 20){
		mybutton.style.display = "block";
	}else{
		mybutton.style.display = "none";
	}
}

function topFunction(){
	document.documentElement.scrollTop = 0;
}
</script>

</body>
</html>