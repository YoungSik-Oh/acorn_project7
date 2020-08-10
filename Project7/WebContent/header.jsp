<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = (String)session.getAttribute("id");
    %>
<style>
	.space{
		margin-right : 15px;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/album/">
<title>index.jsp</title>

    <!-- Bootstrap core CSS -->
<link href="/docs/4.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/navbar.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">
<link rel="stylesheet" href="css/bootstrap.css" />
<link href="album.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
<link href="album.css" rel="stylesheet">
<style>
	ul li a{
		color : white;
	}
</style>
<header>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>야요기어떄</strong>
      </a>
      
      <div class="row">
      	<nav class="navbar navbar-expand-lg navbar-light">
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  			</button>
  			
  	  		<div class="collapse navbar-collapse" id="navbarNav">
	    		<ul class="navbar-nav">
		      		<%if(id == null){ %>
		      			<li class="nav-item">
		        			<a class="space" class="nav-link" href="${pageContext.request.contextPath}/admin/admin_login_form.jsp">관리자 로그인 <span class="sr-only"></span></a>
		      			</li>
		      			<li class="nav-item">
		       			    <a class="space" class="nav-link" href="${pageContext.request.contextPath}/user/loginform.jsp">로그인</a>
		      			</li>
		      			<li class="nav-item">
		        			<a class="space" class="nav-link" href="${pageContext.request.contextPath}/user/signup_form.jsp">회원가입</a>
		      			</li>
		      		<%}else{ %>
		      			<li class="nav-item">
		      				<a class="space" href="${pageContext.request.contextPath}/user/info.jsp"><%=id %>님 환영합니다.</a>
		      			</li>
		      			<li class="nav-item">
		      				<a class="space" href="${pageContext.request.contextPath}/user/logout.jsp">로그아웃</a>
		      			</li>
		      		<%} %>
	    		</ul>
  			</div>
	     </nav>
	  </div>
    </div>
  </div>
</header>